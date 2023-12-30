    class Keyphrase
      module Stoplist
        class Cmn
          def self.stopwords
            @@stopwords ||= [
  "、",
    "。",
    "〈",
    "〉",
    "《",
    "》",
    "一",
    "一些",
    "一何",
    "一切",
    "一则",
    "一方面",
    "一旦",
    "一来",
    "一样",
    "一般",
    "一转眼",
    "七",
    "万一",
    "三",
    "上",
    "上下",
    "下",
    "不",
    "不仅",
    "不但",
    "不光",
    "不单",
    "不只",
    "不外乎",
    "不如",
    "不妨",
    "不尽",
    "不尽然",
    "不得",
    "不怕",
    "不惟",
    "不成",
    "不拘",
    "不料",
    "不是",
    "不比",
    "不然",
    "不特",
    "不独",
    "不管",
    "不至于",
    "不若",
    "不论",
    "不过",
    "不问",
    "与",
    "与其",
    "与其说",
    "与否",
    "与此同时",
    "且",
    "且不说",
    "且说",
    "两者",
    "个",
    "个别",
    "中",
    "临",
    "为",
    "为了",
    "为什么",
    "为何",
    "为止",
    "为此",
    "为着",
    "乃",
    "乃至",
    "乃至于",
    "么",
    "之",
    "之一",
    "之所以",
    "之类",
    "乌乎",
    "乎",
    "乘",
    "九",
    "也",
    "也好",
    "也罢",
    "了",
    "二",
    "二来",
    "于",
    "于是",
    "于是乎",
    "云云",
    "云尔",
    "五",
    "些",
    "亦",
    "人",
    "人们",
    "人家",
    "什",
    "什么",
    "什么样",
    "今",
    "介于",
    "仍",
    "仍旧",
    "从",
    "从此",
    "从而",
    "他",
    "他人",
    "他们",
    "他们们",
    "以",
    "以上",
    "以为",
    "以便",
    "以免",
    "以及",
    "以故",
    "以期",
    "以来",
    "以至",
    "以至于",
    "以致",
    "们",
    "任",
    "任何",
    "任凭",
    "会",
    "似的",
    "但",
    "但凡",
    "但是",
    "何",
    "何以",
    "何况",
    "何处",
    "何时",
    "余外",
    "作为",
    "你",
    "你们",
    "使",
    "使得",
    "例如",
    "依",
    "依据",
    "依照",
    "便于",
    "俺",
    "俺们",
    "倘",
    "倘使",
    "倘或",
    "倘然",
    "倘若",
    "借",
    "借傥然",
    "假使",
    "假如",
    "假若",
    "做",
    "像",
    "儿",
    "先不先",
    "光是",
    "全体",
    "全部",
    "八",
    "六",
    "兮",
    "共",
    "关于",
    "关于具体地说",
    "其",
    "其一",
    "其中",
    "其二",
    "其他",
    "其余",
    "其它",
    "其次",
    "具体地说",
    "具体说来",
    "兼之",
    "内",
    "再",
    "再其次",
    "再则",
    "再有",
    "再者",
    "再者说",
    "再说",
    "冒",
    "冲",
    "况且",
    "几",
    "几时",
    "凡",
    "凡是",
    "凭",
    "凭借",
    "出于",
    "出来",
    "分",
    "分别",
    "则",
    "则甚",
    "别",
    "别人",
    "别处",
    "别是",
    "别的",
    "别管",
    "别说",
    "到",
    "前后",
    "前此",
    "前者",
    "加之",
    "加以",
    "即",
    "即令",
    "即使",
    "即便",
    "即如",
    "即或",
    "即若",
    "却",
    "去",
    "又",
    "又及",
    "及",
    "及其",
    "及至",
    "反之",
    "反而",
    "反过来",
    "反过来说",
    "受到",
    "另",
    "另一方面",
    "另外",
    "另悉",
    "只",
    "只当",
    "只怕",
    "只是",
    "只有",
    "只消",
    "只要",
    "只限",
    "叫",
    "叮咚",
    "可",
    "可以",
    "可是",
    "可见",
    "各",
    "各个",
    "各位",
    "各种",
    "各自",
    "同",
    "同时",
    "后",
    "后者",
    "向",
    "向使",
    "向着",
    "吓",
    "吗",
    "否则",
    "吧",
    "吧哒",
    "含",
    "吱",
    "呀",
    "呃",
    "呕",
    "呗",
    "呜",
    "呜呼",
    "呢",
    "呵",
    "呵呵",
    "呸",
    "呼哧",
    "咋",
    "和",
    "咚",
    "咦",
    "咧",
    "咱",
    "咱们",
    "咳",
    "哇",
    "哈",
    "哈哈",
    "哉",
    "哎",
    "哎呀",
    "哎哟",
    "哗",
    "哟",
    "哦",
    "哩",
    "哪",
    "哪个",
    "哪些",
    "哪儿",
    "哪天",
    "哪年",
    "哪怕",
    "哪样",
    "哪边",
    "哪里",
    "哼",
    "哼唷",
    "唉",
    "唯有",
    "啊",
    "啐",
    "啥",
    "啦",
    "啪达",
    "啷当",
    "喂",
    "喏",
    "喔唷",
    "喽",
    "嗡",
    "嗡嗡",
    "嗬",
    "嗯",
    "嗳",
    "嘎",
    "嘎登",
    "嘘",
    "嘛",
    "嘻",
    "嘿",
    "嘿嘿",
    "四",
    "因",
    "因为",
    "因了",
    "因此",
    "因着",
    "因而",
    "固然",
    "在",
    "在下",
    "在于",
    "地",
    "基于",
    "处在",
    "多",
    "多么",
    "多少",
    "大",
    "大家",
    "她",
    "她们",
    "好",
    "如",
    "如上",
    "如上所述",
    "如下",
    "如何",
    "如其",
    "如同",
    "如是",
    "如果",
    "如此",
    "如若",
    "始而",
    "孰料",
    "孰知",
    "宁",
    "宁可",
    "宁愿",
    "宁肯",
    "它",
    "它们",
    "对",
    "对于",
    "对待",
    "对方",
    "对比",
    "将",
    "小",
    "尔",
    "尔后",
    "尔尔",
    "尚且",
    "就",
    "就是",
    "就是了",
    "就是说",
    "就算",
    "就要",
    "尽",
    "尽管",
    "尽管如此",
    "岂但",
    "己",
    "已",
    "已矣",
    "巴",
    "巴巴",
    "年",
    "并",
    "并且",
    "庶乎",
    "庶几",
    "开外",
    "开始",
    "归",
    "归齐",
    "当",
    "当地",
    "当然",
    "当着",
    "彼",
    "彼时",
    "彼此",
    "往",
    "待",
    "很",
    "得",
    "得了",
    "怎",
    "怎么",
    "怎么办",
    "怎么样",
    "怎奈",
    "怎样",
    "总之",
    "总的来看",
    "总的来说",
    "总的说来",
    "总而言之",
    "恰恰相反",
    "您",
    "惟其",
    "慢说",
    "我",
    "我们",
    "或",
    "或则",
    "或是",
    "或曰",
    "或者",
    "截至",
    "所",
    "所以",
    "所在",
    "所幸",
    "所有",
    "才",
    "才能",
    "打",
    "打从",
    "把",
    "抑或",
    "拿",
    "按",
    "按照",
    "换句话说",
    "换言之",
    "据",
    "据此",
    "接着",
    "故",
    "故此",
    "故而",
    "旁人",
    "无",
    "无宁",
    "无论",
    "既",
    "既往",
    "既是",
    "既然",
    "日",
    "时",
    "时候",
    "是",
    "是以",
    "是的",
    "更",
    "曾",
    "替",
    "替代",
    "最",
    "月",
    "有",
    "有些",
    "有关",
    "有及",
    "有时",
    "有的",
    "望",
    "朝",
    "朝着",
    "本",
    "本人",
    "本地",
    "本着",
    "本身",
    "来",
    "来着",
    "来自",
    "来说",
    "极了",
    "果然",
    "果真",
    "某",
    "某个",
    "某些",
    "某某",
    "根据",
    "欤",
    "正值",
    "正如",
    "正巧",
    "正是",
    "此",
    "此地",
    "此处",
    "此外",
    "此时",
    "此次",
    "此间",
    "毋宁",
    "每",
    "每当",
    "比",
    "比及",
    "比如",
    "比方",
    "没奈何",
    "沿",
    "沿着",
    "漫说",
    "焉",
    "然则",
    "然后",
    "然而",
    "照",
    "照着",
    "犹且",
    "犹自",
    "甚且",
    "甚么",
    "甚或",
    "甚而",
    "甚至",
    "甚至于",
    "用",
    "用来",
    "由",
    "由于",
    "由是",
    "由此",
    "由此可见",
    "的",
    "的确",
    "的话",
    "直到",
    "相对而言",
    "省得",
    "看",
    "眨眼",
    "着",
    "着呢",
    "矣",
    "矣乎",
    "矣哉",
    "离",
    "秒",
    "竟而",
    "第",
    "等",
    "等到",
    "等等",
    "简言之",
    "管",
    "类如",
    "紧接着",
    "纵",
    "纵令",
    "纵使",
    "纵然",
    "经",
    "经过",
    "结果",
    "给",
    "继之",
    "继后",
    "继而",
    "综上所述",
    "罢了",
    "者",
    "而",
    "而且",
    "而况",
    "而后",
    "而外",
    "而已",
    "而是",
    "而言",
    "能",
    "能否",
    "腾",
    "自",
    "自个儿",
    "自从",
    "自各儿",
    "自后",
    "自家",
    "自己",
    "自打",
    "自身",
    "至",
    "至于",
    "至今",
    "至若",
    "致",
    "般的",
    "若",
    "若夫",
    "若是",
    "若果",
    "若非",
    "莫不然",
    "莫如",
    "莫若",
    "虽",
    "虽则",
    "虽然",
    "虽说",
    "被",
    "要",
    "要不",
    "要不是",
    "要不然",
    "要么",
    "要是",
    "譬喻",
    "譬如",
    "让",
    "许多",
    "论",
    "设使",
    "设或",
    "设若",
    "诚如",
    "诚然",
    "该",
    "说",
    "说来",
    "请",
    "诸",
    "诸位",
    "诸如",
    "谁",
    "谁人",
    "谁料",
    "谁知",
    "贼死",
    "赖以",
    "赶",
    "起",
    "起见",
    "趁",
    "趁着",
    "越是",
    "距",
    "跟",
    "较",
    "较之",
    "边",
    "过",
    "还",
    "还是",
    "还有",
    "还要",
    "这",
    "这一来",
    "这个",
    "这么",
    "这么些",
    "这么样",
    "这么点儿",
    "这些",
    "这会儿",
    "这儿",
    "这就是说",
    "这时",
    "这样",
    "这次",
    "这般",
    "这边",
    "这里",
    "进而",
    "连",
    "连同",
    "逐步",
    "通过",
    "遵循",
    "遵照",
    "那",
    "那个",
    "那么",
    "那么些",
    "那么样",
    "那些",
    "那会儿",
    "那儿",
    "那时",
    "那样",
    "那般",
    "那边",
    "那里",
    "都",
    "鄙人",
    "鉴于",
    "针对",
    "阿",
    "除",
    "除了",
    "除外",
    "除开",
    "除此之外",
    "除非",
    "随",
    "随后",
    "随时",
    "随着",
    "难道说",
    "零",
    "非",
    "非但",
    "非徒",
    "非特",
    "非独",
    "靠",
    "顺",
    "顺着",
    "首先",
    "︿",
    "！",
    "＃",
    "＄",
    "％",
    "＆",
    "（",
    "）",
    "＊",
    "＋",
    "，",
    "０",
    "１",
    "２",
    "３",
    "４",
    "５",
    "６",
    "７",
    "８",
    "９",
    "：",
    "；",
    "＜",
    "＞",
    "？",
    "＠",
    "［",
    "］",
    "｛",
    "｜",
    "｝",
    "～",
    "￥",
    "一則",
    "一來",
    "一樣",
    "一轉眼",
    "萬一",
    "不僅",
    "不單",
    "不盡",
    "不盡然",
    "不獨",
    "不至於",
    "不論",
    "不過",
    "不問",
    "與",
    "與其",
    "與其說",
    "與否",
    "與此同時",
    "且不說",
    "且說",
    "兩者",
    "個",
    "個別",
    "臨",
    "爲",
    "爲了",
    "爲什麼",
    "爲何",
    "爲止",
    "爲此",
    "爲著",
    "乃至於",
    "麼",
    "之類",
    "烏乎",
    "也罷",
    "二來",
    "於",
    "於是",
    "於是乎",
    "云爾",
    "人們",
    "什麼",
    "什麼樣",
    "介於",
    "仍舊",
    "從",
    "從此",
    "從而",
    "他們",
    "他們們",
    "以爲",
    "以來",
    "以至於",
    "們",
    "任憑",
    "會",
    "何況",
    "何處",
    "何時",
    "餘外",
    "作爲",
    "你們",
    "依據",
    "便於",
    "俺們",
    "借儻然",
    "兒",
    "全體",
    "關於",
    "關於具體地說",
    "其餘",
    "具體地說",
    "具體說來",
    "內",
    "再則",
    "再者說",
    "再說",
    "衝",
    "況且",
    "幾",
    "幾時",
    "憑",
    "憑藉",
    "出於",
    "出來",
    "分別",
    "則",
    "則甚",
    "別",
    "別人",
    "別處",
    "別是",
    "別的",
    "別管",
    "別說",
    "前後",
    "卻",
    "反過來",
    "反過來說",
    "只當",
    "可見",
    "各個",
    "各種",
    "同時",
    "後",
    "後者",
    "嚇",
    "嗎",
    "否則",
    "吧噠",
    "嘔",
    "唄",
    "嗚",
    "嗚呼",
    "咱們",
    "哎喲",
    "譁",
    "喲",
    "哪個",
    "哪兒",
    "哪樣",
    "哪邊",
    "哪裡",
    "啪達",
    "啷噹",
    "嘍",
    "噯",
    "噓",
    "因爲",
    "在於",
    "基於",
    "處在",
    "多麼",
    "她們",
    "寧",
    "寧可",
    "寧願",
    "寧肯",
    "它們",
    "對",
    "對於",
    "對待",
    "對方",
    "對比",
    "將",
    "爾",
    "爾後",
    "爾爾",
    "就是說",
    "盡",
    "儘管",
    "儘管如此",
    "豈但",
    "並",
    "並且",
    "庶幾",
    "開外",
    "開始",
    "歸",
    "歸齊",
    "當",
    "當地",
    "當然",
    "當著",
    "彼時",
    "怎麼",
    "怎麼辦",
    "怎麼樣",
    "怎樣",
    "總之",
    "總的來看",
    "總的來說",
    "總的說來",
    "總而言之",
    "慢說",
    "我們",
    "或則",
    "打從",
    "換句話說",
    "換言之",
    "據",
    "據此",
    "無",
    "無寧",
    "無論",
    "時",
    "時候",
    "有關",
    "有時",
    "來",
    "來著",
    "來自",
    "來說",
    "極了",
    "某個",
    "根據",
    "歟",
    "此處",
    "此時",
    "此間",
    "毋寧",
    "每當",
    "沒奈何",
    "漫說",
    "然則",
    "然後",
    "猶且",
    "猶自",
    "甚麼",
    "甚至於",
    "用來",
    "由於",
    "由此可見",
    "的確",
    "的話",
    "相對而言",
    "離",
    "簡言之",
    "類如",
    "緊接著",
    "縱",
    "縱令",
    "縱使",
    "縱然",
    "經",
    "經過",
    "結果",
    "給",
    "繼之",
    "繼後",
    "繼而",
    "綜上所述",
    "罷了",
    "而況",
    "而後",
    "騰",
    "自個兒",
    "自從",
    "自各兒",
    "自後",
    "至於",
    "雖",
    "雖則",
    "雖然",
    "雖說",
    "要麼",
    "讓",
    "許多",
    "論",
    "設使",
    "設或",
    "設若",
    "誠如",
    "誠然",
    "該",
    "說",
    "說來",
    "請",
    "諸",
    "諸位",
    "諸如",
    "誰",
    "誰人",
    "誰料",
    "誰知",
    "賊死",
    "賴以",
    "趕",
    "起見",
    "較",
    "較之",
    "邊",
    "過",
    "還",
    "還是",
    "還有",
    "還要",
    "這",
    "這一來",
    "這個",
    "這麼",
    "這麼些",
    "這麼樣",
    "這麼點兒",
    "這些",
    "這會兒",
    "這兒",
    "這就是說",
    "這時",
    "這樣",
    "這次",
    "這般",
    "這邊",
    "這裡",
    "進而",
    "連",
    "連同",
    "通過",
    "那個",
    "那麼",
    "那麼些",
    "那麼樣",
    "那會兒",
    "那兒",
    "那時",
    "那樣",
    "那邊",
    "那裡",
    "鑑於",
    "針對",
    "除開",
    "隨",
    "隨後",
    "隨時",
    "隨著",
    "難道說",
    "非獨",
    "順",
    "順著",
            ]
          end
        end
      end
    end
