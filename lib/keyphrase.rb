# frozen_string_literal: true

require_relative "keyphrase/version"

class Keyphrase

  autoload :Stoplist, "keyphrase/stoplist"

  CLEAN_REGEX = /([^\p{L}a-zA-Z0-9\'\- \.]|(?<!\w)\.)/ # don't remove ' because it might be part of a stop word
  BLACKLIST_REGEX = /(?:^|\s)[^a-zA-Z\p{L}0-9]+\b|\'|\-/ # remove words with no letters, ie 123.23.12. And last chance to remove ' and -
  CLEAN_SPACES_REGEX = /^[0-9\s\.]+$|\s+/ # last phase. Remove extra whitespace and lone numbers
  SENTENCES_REGEX = /[+!?,;:&\[\]\{\}\<\>\=\/\n\t\\"\\(\\)\u2019\u2013\|]|-(?!\w)|'(?=s)|(?<!\s)\.(?![a-zA-Z0-9])|(?<!\w)\#(?=\w)/u

  def self.analyse text, options={}
    @@keyphrase ||= Keyphrase.new
    @@keyphrase.analyse text, options
  end

  def initialize
    @cached_regex = {}
  end

  def analyse text, options={}
    stopwords = options[:stopwords]
    lang = options[:lang] || :eng
    clean_regex = options[:clean] || CLEAN_REGEX
    position_bonus = options[:position_bonus] || true
    sort = options[:sort] || true
    blacklist = options[:blacklist] || BLACKLIST_REGEX
    sentences_regex = options[:sentences_regex] || SENTENCES_REGEX
    clean_spaces_regex = options[:clean_spaces_regex] || CLEAN_SPACES_REGEX

    pattern    = buildStopwordRegExPattern lang, stopwords
    sentences  = text.split sentences_regex
    phrases    = generateCandidateKeywords sentences, pattern, clean_regex, blacklist, clean_spaces_regex
    wordscores = calculateWordScores phrases
    candidates = generateCandidateKeywordScores phrases, wordscores, position_bonus

    if sort
      candidates = candidates.sort_by{|k,v| -v}.to_h
    end

    if options[:verbose]
      candidates.each do |word, score|
        puts sprintf '%.2f - %s', score, word
      end
    end

    return candidates
  end

  private

  # create stopword pattern
  # 1
  def buildStopwordRegExPattern lang, stopwords = nil
    stopwords ||= Keyphrase::Stoplist.stopwords_for_lang lang

    # Check if the regex for the given language and stopwords is already cached
    if @cached_regex[lang].nil? || @cached_regex[lang][:stopwords] != stopwords
      # If not cached or stopwords have changed, recompile the regex and store in the cache
      @cached_regex[lang] = {
        stopwords: stopwords,
        regex: Regexp.new("(?:^|\\s)(?:#{stopwords.join('|')})(?:$|\\s)", Regexp::IGNORECASE | Regexp::MULTILINE)
      }
    end

    # Return the cached regex
    @cached_regex[lang][:regex]
  end

  # generate candidate keywords
  # 2
  def generateCandidateKeywords sentences, stopwords_regex, clean_regex, blacklist, clean_spaces_regex
    phrases = Array.new

    # first clean by removing unwanted special chars
    # second remove all stop words
    # third, remove uncaught stopwords in second pass
    # using a | as an easy way to divide the text by stopwords
    filtered_sentences = sentences.map { |sentence| sentence.gsub(clean_regex, " ").gsub(stopwords_regex, " | ").gsub(stopwords_regex, "|") }

    filtered_sentences.each do |parts|
      parts.split("|").each do |part|
        next if part.empty?

        # remove blacklisted things, like 1234.45.34
        # clean up spacing between words
        part = part.gsub(blacklist, " ").gsub(clean_spaces_regex, " ").strip

        next if part.empty?

        phrases.push part
      end
    end

    # remove duplicate keywords
    phrases = phrases.uniq(&:downcase)

    return phrases
  end

  # calculate individual word scores
  # 3
  def calculateWordScores phrases
    word_freq = Hash.new 0
    word_degree = Hash.new 0
    word_score = Hash.new 0

    phrases.each do |phrase|
      words = seperateWords phrase

      length = words.length
      degree = length-1

      words.each do |word|
        word_freq[word] += 1
        word_degree[word] += degree
      end
    end

    word_freq.each do |word, counter|
      word_degree[word] = word_degree[word] + word_freq[word]
    end

    word_freq.each do |word, counter|
      word_score[word] = word_degree[word]/(word_freq[word] * 1.0)
    end

    return word_score
  end

  # generate candidate keyword scores
  # 4
  def generateCandidateKeywordScores phrases, scores, position_bonus
    candidates = Hash.new 0
    phrase_index = 0

    phrases.each do |phrase|
      words = seperateWords(phrase)
      score = 0
      words.each do |word|
        score += scores[word]

      end

      # Boost score based on the phrase position in the text
      if position_bonus
        normalized_score = 1.0 / (phrase_index + 1)
        score += normalized_score
        phrase_index += 1
      end

      candidates[phrase] = score
    end

    return candidates
  end

  def seperateWords text
    words = Array.new

    text.split(/[^a-zA-Z0-9_\\+\\-\\'\\.]/).each do |word|
      word = word.strip.downcase
      if !word.empty? && !(true if Float(word) rescue false)
        words.push word
      end
    end

    return words
  end

end
