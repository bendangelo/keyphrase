module Keyphrase::Stoplist
  # Dynamically require all files in the stoplist directory
  Dir[File.join(__dir__, 'stoplist', '*.rb')].each do |file|
    require_relative file
  end

  def self.stopwords lang, type=:smart
    cl = const_get(lang.to_s.capitalize)

    if type == :strict
      cl.strict
    else
      cl.smart
    end
  end

  def self.stoplist_classes
    constants.map { |const|  }
  end

end
