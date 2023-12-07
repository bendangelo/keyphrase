# frozen_string_literal: true

require_relative "keyphrase/version"

class Keyphrase

  autoload :Stoplist, "keyphrase/stoplist"

  CLEAN_REGEX = /([^a-zA-Z0-9\'\- \.]|(?<!\w)\.)/ # don't remove ' because it might be part of a stop word
  BLACKLIST_REGEX = /(?:^|\s)[^a-zA-Z\-]+\b|\'/ # remove words with no letters, ie 123.23.12. And last chance to remove '
  CLEAN_SPACES_REGEX = /\s+/
  SENTENCES_REGEX = /[+!?,;:&\[\]\{\}\<\>\=\/\n\t\\"\\(\\)\u2019\u2013\|]|-(?!\w)|'(?=s)|(?<!\s)\.(?![a-zA-Z0-9])|(?<!\w)\#(?=\w)/u

  def self.analyse text, options={}
    @@keyphrase ||= Keyphrase.new
    @@keyphrase.analyse text, options
  end

  def analyse text, options={}
    stoplist = options[:stoplist] || :smart
    lang = options[:lang] || :eng
    clean_regex = options[:clean] || CLEAN_REGEX
    position_bonus = options[:position_bonus] || true
    sort = options[:sort] || true
    blacklist = options[:blacklist] || BLACKLIST_REGEX
    sentences_regex = options[:sentences_regex] || SENTENCES_REGEX
    clean_spaces_regex = options[:clean_spaces_regex] || CLEAN_SPACES_REGEX

    pattern    = buildStopwordRegExPattern stoplist, lang
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
  def buildStopwordRegExPattern stopwords, lang

    if stopwords.is_a? Symbol
      # use caching
      return Keyphrase::Stoplist.stopwords lang, stopwords
    end

    stop_regex = /(?:^|\s)(?:#{stopwords.join('|')})(?:$|\s)/io

    return stop_regex
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
