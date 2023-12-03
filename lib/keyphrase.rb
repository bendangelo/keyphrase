# frozen_string_literal: true

require_relative "keyphrase/version"

class Keyphrase

  autoload :Stoplist, "keyphrase/stoplist"

  CLEAN_REGEX = /([^a-zA-Z0-9'\- \.]|(?<!\w)'|(?<!\w)\.)/
  SENTENCES_REGEX = /[!?,;:\n\t\\"\\(\\)\u2019\u2013\|]|-(?!\w)|(?<!\w)'(?!\w)|(?<!\s)\.[^a-zA-Z0-9]/u

  def self.analyse text, options={}
    @@keyphrase ||= Keyphrase.new
    @@keyphrase.analyse text, options
  end

  def analyse text, options={}
    stoplist = options[:stoplist] || :smart
    clean_regex = options[:clean] || CLEAN_REGEX

    pattern    = buildStopwordRegExPattern stoplist
    sentences  = text.split SENTENCES_REGEX
    phrases    = generateCandidateKeywords sentences, pattern, clean_regex
    wordscores = calculateWordScores phrases
    candidates = generateCandidateKeywordScores phrases, wordscores

    if options[:verbose]
      result = candidates.sort_by{|k,v| v}.reverse
      result.each do |word, score|
        puts sprintf '%.2f - %s', score, word
      end
    end

    return candidates
  end

  private

  # create stopword pattern
  # 1
  def buildStopwordRegExPattern stopwords

    if stopwords.is_a? Symbol
      # use caching
      return Keyphrase::Stoplist::Eng.smart_regex
    end

    stop_regex = /(?:^|\s)(?:#{stopwords.join('|')})(?:$|\s)/io

    return stop_regex
  end

  # generate candidate keywords
  # 2
  def generateCandidateKeywords sentences, stopwords_regex, clean_regex
    phrases = Array.new

    filtered_sentences = sentences.map { |sentence| sentence.gsub(clean_regex, "").gsub(stopwords_regex, "|") }

    filtered_sentences.each do |parts|
      parts.split("|").each do |part|
        part = part.strip

        if !part.empty?
          phrases.push part
        end
      end
    end

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
  def generateCandidateKeywordScores phrases, scores
    candidates = Hash.new 0

    phrases.each do |phrase|
      words = seperateWords(phrase)
      score = 0
      words.each do |word|
        score += scores[word]
      end
      candidates[phrase] = score
    end

    return candidates
  end

  def seperateWords text
    words = Array.new

    text.split(/[^a-zA-Z0-9_\\+\\-\\']/).each do |word|
      word = word.strip.downcase
      if !word.empty? && !(true if Float(word) rescue false)
        words.push word
      end
    end

    return words
  end

end
