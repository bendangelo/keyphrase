    class Keyphrase
      module Stoplist
        class Lat
          def self.stopwords
            @@stopwords ||= [
 "a", "ab", "ac", "ad", "at", "atque", "aut", "autem", "cum", "de", "dum", "e", "erant", "erat",
    "est", "et", "etiam", "ex", "haec", "hic", "hoc", "in", "ita", "me", "nec", "neque", "non",
    "per", "qua", "quae", "quam", "qui", "quibus", "quidem", "quo", "quod", "re", "rebus", "rem",
    "res", "sed", "si", "sic", "sunt", "tamen", "tandem", "te", "ut", "vel",
            ]
          end
        end
      end
    end
