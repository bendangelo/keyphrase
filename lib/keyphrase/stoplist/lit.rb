    class Keyphrase
      module Stoplist
        class Lit
          def self.stopwords
            @@stopwords ||= [
"abi",
    "abidvi",
    "abiejose",
    "abiejuose",
    "abiejø",
    "abiem",
    "abigaliai",
    "abipus",
    "abu",
    "abudu",
    "ai",
    "ana",
    "anaiptol",
    "anaisiais",
    "anajai",
    "anajam",
    "anajame",
    "anapus",
    "anas",
    "anasai",
    "anasis",
    "anei",
    "aniedvi",
    "anieji",
    "aniesiems",
    "anoji",
    "anojo",
    "anojoje",
    "anokia",
    "anoks",
    "anosiomis",
    "anosioms",
    "anosios",
    "anosiose",
    "anot",
    "ant",
    "antai",
    "anuodu",
    "anuoju",
    "anuosiuose",
    "anuosius",
    "anàja",
    "anàjà",
    "anàjá",
    "anàsias",
    "anøjø",
    "apie",
    "aplink",
    "ar",
    "arba",
    "argi",
    "arti",
    "aukðèiau",
    "að",
    "be",
    "bei",
    "beje",
    "bemaþ",
    "bent",
    "bet",
    "betgi",
    "beveik",
    "dar",
    "dargi",
    "daugmaþ",
    "deja",
    "dëka",
    "dël",
    "dëlei",
    "dëlto",
    "ech",
    "et",
    "gal",
    "galbût",
    "galgi",
    "gan",
    "gana",
    "gi",
    "greta",
    "idant",
    "iki",
    "ir",
    "irgi",
    "it",
    "itin",
    "ið",
    "iðilgai",
    "iðvis",
    "jaisiais",
    "jajai",
    "jajam",
    "jajame",
    "jei",
    "jeigu",
    "ji",
    "jiedu",
    "jiedvi",
    "jieji",
    "jiesiems",
    "jinai",
    "jis",
    "jisai",
    "jog",
    "joji",
    "jojo",
    "jojoje",
    "jokia",
    "joks",
    "josiomis",
    "josioms",
    "josios",
    "josiose",
    "judu",
    "judvi",
    "juk",
    "jumis",
    "jums",
    "jumyse",
    "juodu",
    "juoju",
    "juosiuose",
    "juosius",
    "jus",
    "jàja",
    "jàjà",
    "jàsias",
    "jájá",
    "jøjø",
    "jûs",
    "jûsiðkis",
    "jûsiðkë",
    "jûsø",
    "kad",
    "kada",
    "kadangi",
    "kai",
    "kaip",
    "kaipgi",
    "kas",
    "katra",
    "katras",
    "katriedvi",
    "katruodu",
    "kaþin",
    "kaþkas",
    "kaþkatra",
    "kaþkatras",
    "kaþkokia",
    "kaþkoks",
    "kaþkuri",
    "kaþkuris",
    "kiaurai",
    "kiek",
    "kiekvienas",
    "kieno",
    "kita",
    "kitas",
    "kitokia",
    "kitoks",
    "kodël",
    "kokia",
    "koks",
    "kol",
    "kolei",
    "kone",
    "kuomet",
    "kur",
    "kurgi",
    "kuri",
    "kuriedvi",
    "kuris",
    "kuriuodu",
    "lai",
    "lig",
    "ligi",
    "link",
    "lyg",
    "man",
    "manaisiais",
    "manajai",
    "manajam",
    "manajame",
    "manas",
    "manasai",
    "manasis",
    "mane",
    "manieji",
    "maniesiems",
    "manim",
    "manimi",
    "maniðkis",
    "maniðkë",
    "mano",
    "manoji",
    "manojo",
    "manojoje",
    "manosiomis",
    "manosioms",
    "manosios",
    "manosiose",
    "manuoju",
    "manuosiuose",
    "manuosius",
    "manyje",
    "manàja",
    "manàjà",
    "manàjá",
    "manàsias",
    "manæs",
    "manøjø",
    "mat",
    "maþdaug",
    "maþne",
    "mes",
    "mudu",
    "mudvi",
    "mumis",
    "mums",
    "mumyse",
    "mus",
    "mûsiðkis",
    "mûsiðkë",
    "mûsø",
    "na",
    "nagi",
    "ne",
    "nebe",
    "nebent",
    "negi",
    "negu",
    "nei",
    "nejau",
    "nejaugi",
    "nekaip",
    "nelyginant",
    "nes",
    "net",
    "netgi",
    "netoli",
    "neva",
    "nors",
    "nuo",
    "në",
    "o",
    "ogi",
    "oi",
    "paeiliui",
    "pagal",
    "pakeliui",
    "palaipsniui",
    "palei",
    "pas",
    "pasak",
    "paskos",
    "paskui",
    "paskum",
    "pat",
    "pati",
    "patiems",
    "paties",
    "pats",
    "patys",
    "patá",
    "paèiais",
    "paèiam",
    "paèiame",
    "paèiu",
    "paèiuose",
    "paèius",
    "paèiø",
    "per",
    "pernelyg",
    "pirm",
    "pirma",
    "pirmiau",
    "po",
    "prie",
    "prieð",
    "prieðais",
    "pro",
    "pusiau",
    "rasi",
    "rodos",
    "sau",
    "savaisiais",
    "savajai",
    "savajam",
    "savajame",
    "savas",
    "savasai",
    "savasis",
    "save",
    "savieji",
    "saviesiems",
    "savimi",
    "saviðkis",
    "saviðkë",
    "savo",
    "savoji",
    "savojo",
    "savojoje",
    "savosiomis",
    "savosioms",
    "savosios",
    "savosiose",
    "savuoju",
    "savuosiuose",
    "savuosius",
    "savyje",
    "savàja",
    "savàjà",
    "savàjá",
    "savàsias",
    "savæs",
    "savøjø",
    "skersai",
    "skradþiai",
    "staèiai",
    "su",
    "sulig",
    "ta",
    "tad",
    "tai",
    "taigi",
    "taip",
    "taipogi",
    "taisiais",
    "tajai",
    "tajam",
    "tajame",
    "tamsta",
    "tarp",
    "tarsi",
    "tartum",
    "tarytum",
    "tas",
    "tasai",
    "tau",
    "tavaisiais",
    "tavajai",
    "tavajam",
    "tavajame",
    "tavas",
    "tavasai",
    "tavasis",
    "tave",
    "tavieji",
    "taviesiems",
    "tavimi",
    "taviðkis",
    "taviðkë",
    "tavo",
    "tavoji",
    "tavojo",
    "tavojoje",
    "tavosiomis",
    "tavosioms",
    "tavosios",
    "tavosiose",
    "tavuoju",
    "tavuosiuose",
    "tavuosius",
    "tavyje",
    "tavàja",
    "tavàjà",
    "tavàjá",
    "tavàsias",
    "tavæs",
    "tavøjø",
    "taèiau",
    "te",
    "tegu",
    "tegul",
    "tiedvi",
    "tieji",
    "ties",
    "tiesiems",
    "tiesiog",
    "tik",
    "tikriausiai",
    "tiktai",
    "toji",
    "tojo",
    "tojoje",
    "tokia",
    "toks",
    "tol",
    "tolei",
    "toliau",
    "tosiomis",
    "tosioms",
    "tosios",
    "tosiose",
    "tu",
    "tuodu",
    "tuoju",
    "tuosiuose",
    "tuosius",
    "turbût",
    "tàja",
    "tàjà",
    "tàjá",
    "tàsias",
    "tøjø",
    "tûlas",
    "uþ",
    "uþtat",
    "uþvis",
    "va",
    "vai",
    "viduj",
    "vidury",
    "vien",
    "vienas",
    "vienokia",
    "vienoks",
    "vietoj",
    "virð",
    "virðuj",
    "virðum",
    "vis",
    "vis dëlto",
    "visa",
    "visas",
    "visgi",
    "visokia",
    "visoks",
    "vos",
    "vël",
    "vëlgi",
    "ypaè",
    "á",
    "ákypai",
    "ástriþai",
    "ðalia",
    "ðe",
    "ði",
    "ðiaisiais",
    "ðiajai",
    "ðiajam",
    "ðiajame",
    "ðiapus",
    "ðiedvi",
    "ðieji",
    "ðiesiems",
    "ðioji",
    "ðiojo",
    "ðiojoje",
    "ðiokia",
    "ðioks",
    "ðiosiomis",
    "ðiosioms",
    "ðiosios",
    "ðiosiose",
    "ðis",
    "ðisai",
    "ðit",
    "ðita",
    "ðitas",
    "ðitiedvi",
    "ðitokia",
    "ðitoks",
    "ðituodu",
    "ðiuodu",
    "ðiuoju",
    "ðiuosiuose",
    "ðiuosius",
    "ðiàja",
    "ðiàjà",
    "ðiàsias",
    "ðiøjø",
    "ðtai",
    "ðájá",
    "þemiau",
            ]
          end
        end
      end
    end
