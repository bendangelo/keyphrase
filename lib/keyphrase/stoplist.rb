module Keyphrase::Stoplist
  # Dynamically require all files in the stoplist directory
  Dir[File.join(__dir__, 'stoplist', '*.rb')].each do |file|
    require_relative file
  end

  def self.stopwords
    stoplist_classes.map { |klass| klass.stopwords }
  end

  def self.stoplist_classes
    constants.map { |const| const_get(const) }
  end

end
