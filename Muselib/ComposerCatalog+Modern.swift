import Foundation

// Biographical facts are linked to institutional sources; listening language is editorial.
private let ysayeBio = ArchiveSource(
  title: "IRCAM · Eugène Ysaÿe biography",
  url: "https://medias.ircam.fr/fr/composer/eugene-ysaye/biography")
private let ysayeSonatas = ArchiveSource(
  title: "Henle · Ysaÿe Six Sonatas, preface",
  url: "https://www.henle.de/media/15/f0/1d/1690886060/0776-1690886060-sync.pdf")
private let ravelBio = ArchiveSource(
  title: "IRCAM · Maurice Ravel biography",
  url: "https://resources.ircam.fr/fr/composer/maurice-ravel/biography")
private let debussyBio = ArchiveSource(
  title: "Opéra national de Paris · Claude Debussy",
  url: "https://www.operadeparis.fr/en/artists/claude-debussy")
private let debussySonata = ArchiveSource(
  title: "Henle · Debussy Violin Sonata, preface",
  url: "https://www.henle.de/media/38/e9/40/1690886053/0410-1690886053-sync.pdf")
private let prokofievBio = ArchiveSource(
  title: "IRCAM · Sergei Prokofiev biography",
  url: "https://ressources.ircam.fr/en/composer/serge-prokofiev/biography")
private let prokofievConcertos = ArchiveSource(
  title: "BIS · Prokofiev violin concertos booklet",
  url: "https://www.eclassical.com/shop/17115/art93/4980593-c16ca7-BIS-2142_booklet.pdf")
private let shostakovichBio = ArchiveSource(
  title: "IRCAM · Dmitri Shostakovich biography",
  url: "https://brahms.ircam.fr/en/dimitri-chostakovitch")
private let shostakovichConcerto = ArchiveSource(
  title: "Boston Symphony Orchestra · Violin Concerto No. 1",
  url: "https://www.bso.org/works/shostakovich-violin-concerto-no-1")
private let bartokBio = ArchiveSource(
  title: "Boosey & Hawkes · Béla Bartók biography",
  url: "https://www.boosey.com/pages/Opera/composer/composer_main?composerid=2694&ttype=BIOGRAPHY")
private let bartokSonata = ArchiveSource(
  title: "Boosey & Hawkes · Sonata for Violin Solo",
  url: "https://www.boosey.com/cr/music/Bela-Bartok-Sonata-for-Violin-Solo/1190")
private let szymanowskiBio = ArchiveSource(
  title: "USC Polish Music Center · Karol Szymanowski",
  url: "https://polishmusic.usc.edu/research/composers/karol-szymanowski/")
private let szymanowskiMythes = ArchiveSource(
  title: "Audite · Mythes booklet",
  url: "https://audite.de/media/file/00/30/91/Digibooklet.pdf")
private let chaussonBio = ArchiveSource(
  title: "Canada's National Arts Centre · Ernest Chausson",
  url: "https://nac-cna.ca/en/bio/ernest-chausson")
private let chaussonPoeme = ArchiveSource(
  title: "Henle · Chausson Poème, preface",
  url: "https://www.henle.de/media/0c/fb/b8/1690886047/0738-1690886047-sync.pdf")
private let dvorakBio = ArchiveSource(
  title: "Antonín Dvořák · Official biography",
  url: "https://www.antonin-dvorak.cz/en/life/biography/")
private let dvorakConcerto = ArchiveSource(
  title: "Antonín Dvořák · Violin Concerto",
  url: "https://www.antonin-dvorak.cz/en/work/concerto-for-violin-and-orchestra-in-a-minor/")

let modernComposerProfiles: [ComposerProfile] = [
  ComposerProfile(
    id: .ysaye, lifespan: "1858–1931", places: "Liège · Bruxelles · Cincinnati",
    invitation: "小提琴家的作品，寫給小提琴家",
    introduction: "Ysaÿe 同時是演奏家、教師與作曲家。六首無伴奏奏鳴曲各自題獻給當代小提琴家；第三首以一段連續的 Ballade，從自由敘述走向強烈節奏。",
    chapters: [
      ComposerChapter(id: "origins", title: "從 Liège 出發", text: "Ysaÿe 出生於比利時 Liège，成為重要的演奏家與教師，也曾擔任指揮。演奏者的身分讓他的作品直接面對小提琴的聲音、手感與表達可能。"),
      ComposerChapter(id: "sonatas", title: "六首奏鳴曲，六位演奏家", text: "1923 年完成的六首無伴奏奏鳴曲各自題獻給一位同時代小提琴家。它們不是同一套技巧的重複，而是六種個性鮮明的音樂肖像。"),
      ComposerChapter(id: "ballade", title: "一段不間斷的 Ballade", text: "第三首從自由、近似宣敘的開場出發，逐步加速並累積張力。聆聽時可以追蹤速度與節奏如何把段落推向終點。"),
    ],
    milestones: [
      ComposerMilestone(id: "birth", date: "1858", title: "出生於 Liège", detail: "比利時小提琴家、作曲家與指揮。", source: ysayeBio),
      ComposerMilestone(id: "career", date: "19 世紀末", title: "活躍於歐洲音樂舞台", detail: "以小提琴演奏、教學與指揮建立國際生涯。", source: ysayeBio),
      ComposerMilestone(id: "sonatas", date: "1923", title: "完成六首無伴奏奏鳴曲", detail: "每首作品題獻給一位當代小提琴家。", source: ysayeSonatas),
      ComposerMilestone(id: "death", date: "1931", title: "逝世於 Bruxelles", detail: "他的演奏與教學影響延伸至後世小提琴家。", source: ysayeBio),
    ],
    entryWorkID: "ysaye-ballade", sources: [ysayeBio, ysayeSonatas]),
  ComposerProfile(
    id: .ravel, lifespan: "1875–1937", places: "Ciboure · Paris",
    invitation: "精密的聲響，藏著舞台感",
    introduction: "Ravel 對音色、節奏與樂器效果有敏銳的控制。《Tzigane》先讓小提琴獨自展開長篇引子，再讓伴奏加入，聲響空間因此明顯改變。",
    chapters: [
      ComposerChapter(id: "origins", title: "從 Ciboure 到 Paris", text: "Ravel 出生於法國巴斯克地區的 Ciboure，後來在 Paris Conservatoire 學習。精確的工藝與豐富的想像，並存在他的管弦樂與室內樂作品裡。"),
      ComposerChapter(id: "sound", title: "音色是作品的一部分", text: "Ravel 的配器常讓人注意到樂器本身的音色和發音方式。聽他的作品時，可以把注意力放在音色如何轉換，而不只追蹤旋律。"),
      ComposerChapter(id: "tzigane", title: "Tzigane 的獨奏開場", text: "《Tzigane》以小提琴獨奏引子開始，經過自由而富裝飾性的段落，鋼琴或樂團才加入。這個前後對照，是進入作品最直接的聽覺線索。"),
    ],
    milestones: [
      ComposerMilestone(id: "birth", date: "1875", title: "出生於 Ciboure", detail: "後來以 Paris 為主要創作與生活中心。", source: ravelBio),
      ComposerMilestone(id: "conservatoire", date: "1889", title: "進入 Paris Conservatoire", detail: "開始接受正式音樂訓練。", source: ravelBio),
      ComposerMilestone(id: "tzigane", date: "1924", title: "創作 Tzigane", detail: "以小提琴獨奏與伴奏間的聲響對比展開作品。", source: ArchiveSource(title: "Henle · Ravel Tzigane, preface", url: "https://www.henle.de/media/c7/8a/5a/1697725927/0587-1697725927-sync.pdf")),
      ComposerMilestone(id: "death", date: "1937", title: "逝世於 Paris", detail: "留下鋼琴、室內樂與管弦樂等不同編制的作品。", source: ravelBio),
    ],
    entryWorkID: "ravel-tzigane", sources: [ravelBio]),
  ComposerProfile(
    id: .debussy, lifespan: "1862–1918", places: "Saint-Germain-en-Laye · Paris · Rome",
    invitation: "音色與動機，帶著音樂轉彎",
    introduction: "Debussy 的小提琴奏鳴曲是他最後完成的室內樂奏鳴曲。短小動機、音色變化與突然的轉折，讓三個樂章各自形成鮮明性格。",
    chapters: [
      ComposerChapter(id: "study", title: "Paris Conservatoire 的學生", text: "Debussy 於 1872 年進入 Paris Conservatoire，後來在 1884 年以清唱劇《L’Enfant prodigue》獲 Prix de Rome。巴黎的音樂與藝術生活持續形塑他的創作。"),
      ComposerChapter(id: "language", title: "不只追蹤旋律", text: "Debussy 的音樂常讓和聲色彩、音域與音色成為重要線索。聆聽時可以留意一個動機如何改變位置、力度與周圍的聲響。"),
      ComposerChapter(id: "sonata", title: "最後一首奏鳴曲", text: "G 小調小提琴奏鳴曲寫於 1917 年，是 Debussy 計畫中的六首奏鳴曲最後完成的一首。三個樂章短而對比鮮明，結尾以迅速的動能收束。"),
    ],
    milestones: [
      ComposerMilestone(id: "birth", date: "1862", title: "出生於 Saint-Germain-en-Laye", detail: "後來前往 Paris 接受音樂教育。", source: debussyBio),
      ComposerMilestone(id: "conservatoire", date: "1872", title: "進入 Paris Conservatoire", detail: "學習鋼琴與作曲。", source: debussyBio),
      ComposerMilestone(id: "rome", date: "1884", title: "獲 Prix de Rome", detail: "以清唱劇《L’Enfant prodigue》獲獎。", source: debussyBio),
      ComposerMilestone(id: "sonata", date: "1917", title: "完成小提琴奏鳴曲", detail: "這是他最後完成的室內樂奏鳴曲。", source: debussySonata),
      ComposerMilestone(id: "death", date: "1918", title: "逝世於 Paris", detail: "留下未完成的奏鳴曲計畫與多種編制的作品。", source: debussyBio),
    ],
    entryWorkID: "debussy-sonata", sources: [debussyBio, debussySonata]),
  ComposerProfile(
    id: .prokofiev, lifespan: "1891–1953", places: "Sontsovka · St Petersburg · Moscow",
    invitation: "歌唱與尖銳，並存在同一個聲音裡",
    introduction: "Prokofiev 的兩首小提琴協奏曲性格迥異：第一號帶有夢幻、歌唱的線條，第二號則以更直接的旋律和清晰節奏展開。",
    chapters: [
      ComposerChapter(id: "student", title: "年輕的作曲家與鋼琴家", text: "Prokofiev 出生於 Sontsovka，1904 年進入 St Petersburg Conservatory。早期同時以作曲家與鋼琴演奏者受到注意。"),
      ComposerChapter(id: "journeys", title: "在不同城市之間創作", text: "他於 1918 年離開俄國，往後在美國與歐洲生活，1930 年代中期返回蘇聯。移動與時代變化，構成他創作生涯的重要背景。"),
      ComposerChapter(id: "concertos", title: "兩首協奏曲，兩種開場", text: "第一號協奏曲以小提琴的抒情長線條開始，終樂章又讓音樂回到夢幻色彩；第二號則從獨奏小提琴直接開始。把兩個開頭並置，能很快聽出作品性格的差別。"),
    ],
    milestones: [
      ComposerMilestone(id: "birth", date: "1891", title: "出生於 Sontsovka", detail: "從母親學習鋼琴，童年開始創作。", source: prokofievBio),
      ComposerMilestone(id: "conservatory", date: "1904", title: "進入 St Petersburg Conservatory", detail: "接受鋼琴、作曲與指揮等訓練。", source: prokofievBio),
      ComposerMilestone(id: "departure", date: "1918", title: "離開俄國", detail: "此後在美國與歐洲生活與工作。", source: prokofievBio),
      ComposerMilestone(id: "return", date: "1936", title: "返回蘇聯定居", detail: "在不同時期寫下兩首小提琴協奏曲。", source: prokofievBio),
      ComposerMilestone(id: "death", date: "1953", title: "逝世於 Moscow", detail: "兩首小提琴協奏曲至今常被並置演出。", source: prokofievBio),
    ],
    entryWorkID: "prokofiev-concerto-1", sources: [prokofievBio, prokofievConcertos]),
  ComposerProfile(
    id: .shostakovich, lifespan: "1906–1975", places: "Saint Petersburg · Leningrad · Moscow",
    invitation: "一場漫長的獨白，如何走到狂奔",
    introduction: "Shostakovich 第一號小提琴協奏曲規模龐大，四個樂章從陰暗的夜曲走向諷刺感鮮明的終曲，中間穿過一段長篇 Passacaglia 與小提琴獨奏華彩。",
    chapters: [
      ComposerChapter(id: "education", title: "從鋼琴走進作曲", text: "Shostakovich 出生於 Saint Petersburg，1919 年進入當地音樂院，學習鋼琴與作曲。早年的鋼琴工作也讓他接觸劇場與默片伴奏。"),
      ComposerChapter(id: "public-life", title: "作品與時代壓力", text: "他的創作生涯跨越劇烈的政治與社會變動，作品曾承受官方批評與重新評價。理解這段背景時，仍可以先回到樂譜本身，聽音樂如何安排張力與對比。"),
      ComposerChapter(id: "concerto", title: "夜曲、Passacaglia、華彩", text: "第一號協奏曲先以低聲部的長線條建立夜曲氣氛；Passacaglia 的固定低音逐步累積張力，接上篇幅很長的獨奏華彩，最後進入節奏尖銳的 Burlesque。"),
    ],
    milestones: [
      ComposerMilestone(id: "birth", date: "1906", title: "出生於 Saint Petersburg", detail: "在音樂家庭中成長，從小學習鋼琴。", source: shostakovichBio),
      ComposerMilestone(id: "conservatory", date: "1919", title: "進入 Petrograd Conservatory", detail: "學習鋼琴、作曲與管弦樂法。", source: shostakovichBio),
      ComposerMilestone(id: "symphony", date: "1926", title: "第一號交響曲首演", detail: "作品使年輕作曲家受到更廣泛注意。", source: shostakovichBio),
      ComposerMilestone(id: "concerto", date: "1948", title: "完成第一號小提琴協奏曲", detail: "作品後來於 1955 年由 David Oistrakh 首演。", source: shostakovichConcerto),
      ComposerMilestone(id: "death", date: "1975", title: "逝世於 Moscow", detail: "留下交響曲、室內樂與協奏曲等大型作品。", source: shostakovichBio),
    ],
    entryWorkID: "shostakovich-concerto-1", sources: [shostakovichBio, shostakovichConcerto]),
  ComposerProfile(
    id: .bartok, lifespan: "1881–1945", places: "Nagyszentmiklós · Budapest · New York",
    invitation: "一把小提琴，聽起來像好幾個聲部",
    introduction: "Bartók 將民間音樂研究與現代作曲並行發展。《Sonata for Solo Violin》以單件樂器呈現和弦、對位與不同音色，像一場濃縮的室內樂。",
    chapters: [
      ComposerChapter(id: "origins", title: "作曲家，也是田野採集者", text: "Bartók 出生於 Nagyszentmiklós，長期蒐集與研究民間音樂。他和 Zoltán Kodály 的工作，讓民歌不只是引用的旋律，也成為節奏與音階的研究對象。"),
      ComposerChapter(id: "language", title: "從民間聲音發展語言", text: "不同地域的歌謠、節奏與音階，為 Bartók 的創作提供材料。他將採集、整理與作曲結合，逐漸形成個人鮮明的音樂語言。"),
      ComposerChapter(id: "sonata", title: "獨奏小提琴的多聲部", text: "這首奏鳴曲由 Yehudi Menuhin 委託，完成於 1944 年。聆聽和弦時，可以分辨高音旋律與低音支點；快速段落則留意發音和節奏如何轉換。"),
    ],
    milestones: [
      ComposerMilestone(id: "birth", date: "1881", title: "出生於 Nagyszentmiklós", detail: "後來在 Budapest 接受音樂訓練。", source: bartokBio),
      ComposerMilestone(id: "folk", date: "1905–1906", title: "開始系統性研究民間音樂", detail: "與 Zoltán Kodály 一同蒐集與記錄民歌。", source: bartokBio),
      ComposerMilestone(id: "academy", date: "1934", title: "離開音樂院教職", detail: "將更多時間投入民族音樂學研究。", source: bartokBio),
      ComposerMilestone(id: "sonata", date: "1944", title: "為 Yehudi Menuhin 寫作獨奏奏鳴曲", detail: "作品讓單把小提琴承擔多聲部與對位。", source: bartokSonata),
      ComposerMilestone(id: "death", date: "1945", title: "逝世於 New York", detail: "晚年移居美國，仍持續創作與研究。", source: bartokBio),
    ],
    entryWorkID: "bartok-solo-sonata", sources: [bartokBio, bartokSonata]),
  ComposerProfile(
    id: .szymanowski, lifespan: "1882–1937", places: "Tymoszówka · Warsaw · Zakopane",
    invitation: "從神話意象走進音色",
    introduction: "《Mythes》由三首小提琴與鋼琴作品組成。Szymanowski 以密集的音色層次與流動的和聲，讓神話題材轉化為可聽見的色彩。",
    chapters: [
      ComposerChapter(id: "early", title: "從家庭音樂到 Warsaw", text: "Szymanowski 出生於 Tymoszówka 的波蘭家庭，早年隨父親學習音樂，後到 Warsaw 修習作曲。旅行與接觸不同音樂潮流，讓他的創作風格逐步改變。"),
      ComposerChapter(id: "styles", title: "風格不斷變化", text: "早期作品帶有浪漫派色彩，之後對音色與和聲的探索逐漸加深；1920 年代在 Zakopane 的生活，也使波蘭高地音樂進入他的創作視野。"),
      ComposerChapter(id: "mythes", title: "三幅聲音中的神話", text: "《Mythes》包含《La fontaine d’Aréthuse》、《Narcisse》與《Dryades et Pan》。可先從第一首開始：聽鋼琴的流動織度，如何讓小提琴的音色像光線一樣改變。"),
    ],
    milestones: [
      ComposerMilestone(id: "birth", date: "1882", title: "出生於 Tymoszówka", detail: "在重視文學、詩歌與音樂的家庭中成長。", source: szymanowskiBio),
      ComposerMilestone(id: "warsaw", date: "1901", title: "前往 Warsaw 修習作曲", detail: "師從 Zygmunt Noskowski 等教師。", source: szymanowskiBio),
      ComposerMilestone(id: "mythes", date: "1915", title: "創作 Mythes", detail: "三首作品以小提琴與鋼琴描寫神話意象。", source: szymanowskiMythes),
      ComposerMilestone(id: "zakopane", date: "1920 年代", title: "與 Zakopane 建立長期連結", detail: "波蘭高地音樂影響他後期的創作方向。", source: szymanowskiBio),
      ComposerMilestone(id: "death", date: "1937", title: "逝世於 Lausanne", detail: "作品涵蓋交響曲、歌劇、室內樂與歌曲。", source: szymanowskiBio),
    ],
    entryWorkID: "szymanowski-mythes", sources: [szymanowskiBio, szymanowskiMythes]),
  ComposerProfile(
    id: .chausson, lifespan: "1855–1899", places: "Paris · Limay",
    invitation: "一首沒有被固定形式框住的詩",
    introduction: "Chausson 的《Poème》不是按傳統協奏曲樂章展開，而是讓小提琴與樂團共同推進一條自由的音樂線。長句、停頓與配器變化，讓情緒逐步聚集。",
    chapters: [
      ComposerChapter(id: "studies", title: "從法律轉向音樂", text: "Chausson 先完成法律學業，之後進入 Paris Conservatoire，向 Jules Massenet 與 César Franck 學習作曲。Franck 的教學與音樂圈交流，對他後來的創作影響深遠。"),
      ComposerChapter(id: "salon", title: "巴黎音樂圈的交會處", text: "他在 Société Nationale de Musique 擔任秘書，也經營接待詩人、作曲家與演奏家的沙龍。這些往來讓創作和當代藝術生活緊密相連。"),
      ComposerChapter(id: "poeme", title: "Ysaÿe 與 Poème", text: "《Poème》為小提琴與樂團而作，獻給 Eugène Ysaÿe。作品像一段自由敘述：旋律反覆回返、改變方向，樂團則擴展或收攏它的聲響。"),
    ],
    milestones: [
      ComposerMilestone(id: "birth", date: "1855", title: "出生於 Paris", detail: "先接受法律教育，之後轉向音樂。", source: chaussonBio),
      ComposerMilestone(id: "study", date: "1879", title: "進入 Conservatoire 學習作曲", detail: "曾向 Massenet 與 Franck 學習。", source: chaussonBio),
      ComposerMilestone(id: "societe", date: "1886", title: "擔任 Société Nationale de Musique 秘書", detail: "參與推廣當代法國音樂。", source: chaussonBio),
      ComposerMilestone(id: "poeme", date: "1896", title: "完成 Poème", detail: "作品獻給小提琴家 Eugène Ysaÿe。", source: chaussonPoeme),
      ComposerMilestone(id: "death", date: "1899", title: "逝世於 Limay", detail: "一次自行車意外中止了他的創作生涯。", source: chaussonBio),
    ],
    entryWorkID: "chausson-poeme", sources: [chaussonBio, chaussonPoeme]),
  ComposerProfile(
    id: .dvorak, lifespan: "1841–1904", places: "Nelahozeves · Prague · New York",
    invitation: "舞曲脈動，穿過協奏曲的長句",
    introduction: "Dvořák 的小提琴協奏曲把抒情旋律、捷克舞曲節奏與樂團交響性放在同一部作品裡。聽外側樂章的節奏如何轉換，再讓慢樂章的旋律暫時放慢腳步。",
    chapters: [
      ComposerChapter(id: "origins", title: "從村鎮樂手走向 Prague", text: "Dvořák 出生於 Nelahozeves，早年接觸小提琴與地方舞曲。後來在 Prague 的樂團與音樂生活中工作，逐漸建立作曲家的聲望。"),
      ComposerChapter(id: "international", title: "地方聲音走向國際舞台", text: "他將波希米亞與斯拉夫舞曲節奏融入大型交響與室內樂作品。1892 至 1895 年在美國工作期間，也繼續思考不同音樂傳統如何進入創作。"),
      ComposerChapter(id: "concerto", title: "舞曲節奏與旋律回返", text: "A 小調小提琴協奏曲的外側樂章充滿節奏推進，中間的慢樂章則讓旋律舒展。終樂章的舞曲感不斷回來，可以留意重音與速度如何改變舞步的感覺。"),
    ],
    milestones: [
      ComposerMilestone(id: "birth", date: "1841", title: "出生於 Nelahozeves", detail: "在 Prague 北方的村鎮長大，早年學習小提琴。", source: dvorakBio),
      ComposerMilestone(id: "prague", date: "1862", title: "進入 Prague 的樂團生活", detail: "在劇院樂團演奏多年，累積管弦樂實務經驗。", source: dvorakBio),
      ComposerMilestone(id: "america", date: "1892–1895", title: "在 New York 工作與教學", detail: "旅居美國期間持續創作，也接觸不同音樂文化。", source: dvorakBio),
      ComposerMilestone(id: "concerto", date: "1879–1880", title: "創作 A 小調小提琴協奏曲", detail: "協奏曲在抒情旋律與舞曲節奏間往返。", source: dvorakConcerto),
      ComposerMilestone(id: "death", date: "1904", title: "逝世於 Prague", detail: "留下交響曲、歌劇、室內樂與協奏曲。", source: dvorakBio),
    ],
    entryWorkID: "dvorak-concerto", sources: [dvorakBio, dvorakConcerto]),
]
