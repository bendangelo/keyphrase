module Keyphrase::Stoplist
  class << self
    # Class variable to store filenames
    @@file_names = []

    # Method to retrieve the array of filenames
    def languages
      @@file_names
    end
  end

  # Dynamically require all files in the stoplist directory
  Dir[File.join(__dir__, 'stoplist', '*.rb')].each do |file|
    require_relative file
    @@file_names << File.basename(file, '.rb').to_sym
  end

  def self.stopwords_for_lang lang
    cl = const_get(lang.to_s.capitalize)

    cl.stopwords
  end

end
