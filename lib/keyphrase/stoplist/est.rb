    class Keyphrase
      module Stoplist
        class Est
          def self.stopwords
            @@stopwords ||= [
   "aga", "ei", "et", "ja", "jah", "kas", "kui", "kõik", "ma", "me", "mida", "midagi", "mind",
    "minu", "mis", "mu", "mul", "mulle", "nad", "nii", "oled", "olen", "oli", "oma", "on", "pole",
    "sa", "seda", "see", "selle", "siin", "siis", "ta", "te", "ära",
            ]
          end
        end
      end
    end
