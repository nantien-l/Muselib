import Foundation

struct ArchiveSource: Identifiable {
  let title: String
  let url: String
  var id: String { url }
}

struct Performer: Identifiable {
  let id: String
  let name: String
  let headline: String
  let biography: String
  let equipmentIDs: [String]
  let sources: [ArchiveSource]
  var imageName: String { "portrait-\(id)" }
  var equipment: [Equipment] {
    equipmentIDs.compactMap { key in instrumentArchive.first { $0.id == key } }
  }
  var works: [MusicalWork] {
    repertoire.filter { $0.performerIDs.contains(id) || $0.recommendedPerformerIDs.contains(id) }
  }
}

struct Equipment: Identifiable {
  enum Kind: String {
    case violin = "Violin"
    case bow = "Bow"
  }
  let id: String
  let name: String
  let maker: String
  let date: String?
  let kind: Kind
  let story: String
  let sources: [ArchiveSource]
  var imageName: String { "\(kind.rawValue.lowercased())-\(id)" }
  var performers: [Performer] { artists.filter { $0.equipmentIDs.contains(id) } }
}

// Dedication and historical links are not selectable recorded versions.
let historicalConnections: [String: [String]] = ["franck-sonata": ["eugene-ysaye"]]

let artists: [Performer] = [
  Performer(
    id: "soobeen-lee", name: "SooBeen Lee", headline: "Bach · Sibelius",
    biography:
      "SooBeen Lee 曾獲 Montréal International Musical Competition 銅獎，並在 2022 Indianapolis 比賽獲獎。自 2025 年起，她在 Queen Elisabeth Music Chapel 隨 Augustin Dumay 學習。收錄的 2026 Wieniawski 演出，從 Bach 的 Ciaccona 延伸至 Sibelius 協奏曲，呈現獨奏與管弦樂兩種編制。",
    equipmentIDs: [],
    sources: [
      ArchiveSource(
        title: "Wieniawski · SooBeen Lee biography & programme",
        url: "https://konkurs.wieniawski.pl/uczestnicy/soobeen-lee/")
    ]),
  Performer(
    id: "anna-im", name: "Anna Im", headline: "Brahms · Wieniawski 2026",
    biography:
      "Anna Im 是 2019 Michael Hill 與 2024 Stuttgart 小提琴比賽首獎得主。她曾就讀 Curtis Institute of Music、Royal Academy of Music，並於 Kronberg Academy 隨 Janine Jansen、Erik Schumann 學習。收錄的比賽版本為她在 2026 Wieniawski Competition 演奏的 Brahms 協奏曲。",
    equipmentIDs: [],
    sources: [
      ArchiveSource(
        title: "Wieniawski · Anna Im biography & programme",
        url: "https://konkurs.wieniawski.pl/uczestnicy/anna-im/")
    ]),
  Performer(
    id: "jooha-choi", name: "Jooha Choi", headline: "Vasks · Franck",
    biography:
      "Jooha Choi 在 2026 Wieniawski Competition 演奏了 Vasks 的 Vox Amoris、Franck 奏鳴曲與 Brahms 協奏曲。她曾獲 Munetsugu Angel 比賽第二獎與觀眾獎，並獲借 1764 年 Michael Angelo Bergonzi 製作的 Mintz 小提琴。Vox Amoris 與 Franck 的比賽影片可由曲目頁開啟。",
    equipmentIDs: ["ex-mintz", "choi-sartory", "choi-ouchard"],
    sources: [
      ArchiveSource(
        title: "Wieniawski · Biography & programme",
        url: "https://konkurs.wieniawski.pl/uczestnicy/jooha-choi/"),
      ArchiveSource(
        title: "Munetsugu Angel · Results",
        url:
          "https://www.thestrad.com/news/15-year-old-jenny-hyeonjeong-lee-wins-munetsugu-angel-violin-competition/21082.article"
      ),
    ]),
  Performer(
    id: "bohdan-luts", name: "Bohdan Luts", headline: "Wieniawski 2026 · First Prize",
    biography:
      "Bohdan Luts 出生於 Lviv，曾就讀 International Menuhin Music Academy，之後師從 Boris Kuschnir。他在 2022 Carl Nielsen、2023 Long-Thibaud 與 2026 Wieniawski 比賽獲首獎；Wieniawski 獎項亦帶來 1711 Stradivari Marquis de Rivière 的兩年借用機會。",
    equipmentIDs: ["marquis-de-riviere"],
    sources: [
      ArchiveSource(
        title: "Wieniawski · Biography & programme",
        url: "https://konkurs.wieniawski.pl/uczestnicy/bohdan-luts/"),
      ArchiveSource(
        title: "Wieniawski 2026 · First Prize",
        url:
          "https://theviolinchannel.com/bohdan-luts-wins-2026-wieniawski-international-violin-competition/"
      ),
    ]),
  Performer(
    id: "clara-jumi-kang", name: "Clara-Jumi Kang", headline: "Beethoven · Violin & piano",
    biography:
      "Clara-Jumi Kang 出生於德國，三歲開始學琴，曾隨 Zakhar Bron、Dorothy DeLay、Nam-Yun Kim 與 Christoph Poppen 學習。她的曲目涵蓋協奏曲與室內樂，並曾與 Sunwook Kim 錄製 Beethoven 小提琴奏鳴曲全集。用琴為 KIA 提供的 1702 Stradivari Thunis。",
    equipmentIDs: ["thunis"],
    sources: [
      ArchiveSource(
        title: "Clara-Jumi Kang · Official biography", url: "https://www.clarajumikang.com/")
    ]),
  Performer(
    id: "christian-ferras", name: "Christian Ferras", headline: "Sibelius · Herbert von Karajan",
    biography:
      "Christian Ferras 與 Herbert von Karajan 合作錄製過 Beethoven、Tchaikovsky 與 Sibelius 等協奏曲。收錄的 Sibelius 版本錄於 1965 年。他在 1967 年購入 Dragonetti, Milanollo Stradivari，這把琴陪伴了他後來的演奏生涯。",
    equipmentIDs: ["milanollo"],
    sources: [
      ArchiveSource(
        title: "Karajan · Christian Ferras",
        url: "https://karajan.org/stories/karajan-artists-christian-ferras/"),
      ArchiveSource(
        title: "Deutsche Grammophon · Sibelius",
        url:
          "https://www.deutschegrammophon.com/en/catalogue/products/sibelius-violinkonzert-ferraskarajan-5415"
      ),
    ]),
  Performer(
    id: "anne-sophie-mutter", name: "Anne-Sophie Mutter", headline: "Vivaldi · Brahms · Franck",
    biography:
      "Anne-Sophie Mutter 的曲目涵蓋古典、浪漫與當代作品。她與 Trondheim Soloists 錄製的 Le quattro stagioni，以及與 Lambert Orkis 合作的 Brahms 奏鳴曲，分別呈現獨奏帶領合奏與室內樂合作。她的主要用琴是 1710 Stradivari Lord Dunn-Raven。",
    equipmentIDs: ["lord-dunn-raven"],
    sources: [
      ArchiveSource(
        title: "Deutsche Grammophon · Biography",
        url: "https://www.deutschegrammophon.com/en/artists/annesophiemutter"),
      ArchiveSource(
        title: "Mutter · Instruments interview",
        url:
          "https://www.thestrad.com/playing-hub/anne-sophie-mutter-on-fine-and-contemporary-instruments/10533.article"
      ),
    ]),
  Performer(
    id: "itzhak-perlman", name: "Itzhak Perlman", headline: "Concertos · Capricci",
    biography:
      "Itzhak Perlman 的演奏工作亦延伸至教學與年輕音樂家的培育。從 Tchaikovsky 協奏曲的長句，到 Paganini 隨想曲的變奏，可以比較他在不同編制中的發音與旋律處理。他使用的 Soil Stradivari 曾屬 Yehudi Menuhin；琴弓紀錄亦包括 Joseph Henry 的作品。",
    equipmentIDs: ["soil", "perlman-henry"],
    sources: [
      ArchiveSource(
        title: "Itzhak Perlman · Official biography", url: "https://itzhakperlman.com/biography/"),
      ArchiveSource(
        title: "Perlman · Violin & bow",
        url: "https://stringsmagazine.com/itzhak-perlman-turns-70-and-hes-loving-every-minute/"),
    ]),
  Performer(
    id: "isaac-stern", name: "Isaac Stern", headline: "Mendelssohn · Guarneri del Gesù",
    biography:
      "Isaac Stern 使用過 Panette 與 Ysaÿe 兩把 Guarneri del Gesù，也收藏過曾屬 Ysaÿe 的 Tourte 小提琴弓。這些器物串連起不同世代的演奏者。收錄的 Mendelssohn 協奏曲，提供了從錄音進一步認識他的起點。",
    equipmentIDs: ["panette", "ysaye", "ysaye-stern-tourte"],
    sources: [
      ArchiveSource(
        title: "Tarisio · Panette",
        url: "https://tarisio.com/cozio-archive/cozio-carteggio/renaud-capucon-panette-guarneri/"),
      ArchiveSource(
        title: "Tarisio · Ysaÿe's instruments & bows",
        url: "https://tarisio.com/cozio-archive/cozio-carteggio/eugene-ysaye-violins/"),
    ]),
  Performer(
    id: "jascha-heifetz", name: "Jascha Heifetz", headline: "Bach · Beethoven · Brahms",
    biography:
      "Jascha Heifetz 的收錄版本涵蓋 Bach 無伴奏作品、協奏曲與小提琴奏鳴曲，可比較他在不同編制中的發音與樂句安排。他於 1922 年購入曾屬 Ferdinand David 的 Guarneri del Gesù，也使用過曾屬老師 Leopold Auer 的 Kittel 琴弓。",
    equipmentIDs: ["david-heifetz", "auer-heifetz"],
    sources: [
      ArchiveSource(
        title: "Cremonese archive · David, Heifetz",
        url:
          "https://www.archiviodellaliuteriacremonese.it/strumenti/1740_violino_heifetz.aspx?f=457944"
      ),
      ArchiveSource(
        title: "Tarisio · Auer, Heifetz bow",
        url: "https://tarisio.com/cozio-archive/property/?ID=57798"),
    ]),
  Performer(
    id: "david-oistrakh", name: "David Oistrakh", headline: "Brahms · Beethoven",
    biography:
      "David Oistrakh 與 Frida Bauer 的 Brahms 第三號奏鳴曲現場演出，錄於 1966 年。他使用過的名琴包括 Marsick Stradivari；偏愛的琴弓製作者則包括 Nürnberger 與 Richaume。其中一支 Richaume 弓由兒子 Igor 購入後送給他。",
    equipmentIDs: ["marsick", "oistrakh-richaume", "oistrakh-nurnberger"],
    sources: [
      ArchiveSource(
        title: "The Strad · David Oistrakh",
        url:
          "https://www.thestrad.com/artists/remembering-the-great-violinist-david-oistrakh/4547.article"
      )
    ]),
  Performer(
    id: "eugene-ysaye", name: "Eugène Ysaÿe", headline: "Franck · Dedicatee",
    biography:
      "Franck 將 A 大調小提琴奏鳴曲贈予 Eugène Ysaÿe 作為結婚禮物，Ysaÿe 亦在婚禮慶祝場合演奏此曲。他使用的 Guarneri del Gesù 與收藏的 Tourte 弓，後來均與 Isaac Stern 的生涯相連。此處收錄的是作品題獻與器物流傳關係。",
    equipmentIDs: ["ysaye", "ysaye-sartory", "ysaye-stern-tourte"],
    sources: [
      ArchiveSource(
        title: "Henle · Franck preface",
        url: "https://www.henle.de/media/b8/b3/13/1697725903/1351-1697725903-sync.pdf"),
      ArchiveSource(
        title: "Tarisio · Ysaÿe's instruments & bows",
        url: "https://tarisio.com/cozio-archive/cozio-carteggio/eugene-ysaye-violins/"),
    ]),
]

let instrumentArchive: [Equipment] = [
  Equipment(
    id: "ex-mintz", name: "Ex-Mintz", maker: "Michael Angelo Bergonzi", date: "1764", kind: .violin,
    story: "Jooha Choi 在 2026 Munetsugu Angel 比賽獲第二獎後獲借的琴。公開報導使用 Mintz 名稱；本檔案沿用 Ex-Mintz 顯示名稱。",
    sources: [
      ArchiveSource(
        title: "Munetsugu Angel · Results",
        url:
          "https://www.thestrad.com/news/15-year-old-jenny-hyeonjeong-lee-wins-munetsugu-angel-violin-competition/21082.article"
      )
    ]),
  Equipment(
    id: "choi-sartory", name: "Jooha Choi · Sartory", maker: "Eugène Sartory", date: nil,
    kind: .bow, story: "Jooha Choi 使用的 Sartory 琴弓；製作年份與流傳紀錄尚未確認。", sources: []),
  Equipment(
    id: "choi-ouchard", name: "Jooha Choi · Ouchard", maker: "Ouchard", date: nil, kind: .bow,
    story: "Jooha Choi 使用的 Ouchard 琴弓；製作者完整姓名與年份尚未確認。", sources: []),
  Equipment(
    id: "marquis-de-riviere", name: "Marquis de Rivière", maker: "Antonio Stradivari", date: "1711",
    kind: .violin,
    story:
      "Bohdan Luts 獲 2026 Wieniawski Competition 首獎後，獲由 Nippon Violin 提供的兩年借用機會。這是奪冠後獲借的琴，不能據此認定為本次比賽或過往錄音用琴。",
    sources: [
      ArchiveSource(
        title: "Wieniawski · Nippon Violin special prize",
        url:
          "https://konkurs.wieniawski.pl/nagroda-specjalna-nippon-violin-skrzypce-antonia-stradivariego-marquis-de-riviere-z-1711-roku/"
      )
    ]),
  Equipment(
    id: "thunis", name: "Thunis", maker: "Antonio Stradivari", date: "1702", kind: .violin,
    story: "Clara-Jumi Kang 官網列出的演奏用琴，由 KIA 提供借用。用琴關聯依官網介紹記錄，未指定任何一場演出。",
    sources: [
      ArchiveSource(
        title: "Clara-Jumi Kang · Official biography", url: "https://www.clarajumikang.com/")
    ]),
  Equipment(
    id: "milanollo", name: "Dragonetti, Milanollo", maker: "Antonio Stradivari", date: "1728",
    kind: .violin,
    story:
      "這把 Stradivari 曾屬 Teresa Milanollo。依 Tarisio 的流傳介紹，Christian Ferras 於 1967 年購入並持有至 1982 年。它在這裡作為 Ferras 人生中的名琴介紹，並非他與 Karajan 的 1965 年 Sibelius 錄音用琴。",
    sources: [
      ArchiveSource(
        title: "Tarisio · The sisters Milanollo",
        url: "https://tarisio.com/carteggio/historic-women-performers-milanollo-sisters"),
      ArchiveSource(
        title: "Tarisio · Dragonetti, Milanollo",
        url: "https://tarisio.com/cozio-archive/property/?ID=40875"),
    ]),
  Equipment(
    id: "lord-dunn-raven", name: "Lord Dunn-Raven", maker: "Antonio Stradivari", date: "1710",
    kind: .violin,
    story:
      "Anne-Sophie Mutter 在訪談中稱這把琴為她的主要用琴。她也擁有另一把 1703 年 Emiliani Stradivari；人物與琴的關係不能直接當成每份錄音的用琴證明。",
    sources: [
      ArchiveSource(
        title: "Mutter · Instruments interview",
        url:
          "https://www.thestrad.com/playing-hub/anne-sophie-mutter-on-fine-and-contemporary-instruments/10533.article"
      )
    ]),
  Equipment(
    id: "soil", name: "Soil", maker: "Antonio Stradivari", date: "1714", kind: .violin,
    story: "Stradivari 黃金時期的作品，曾由 Yehudi Menuhin 使用，後與 Itzhak Perlman 的演奏生涯相連。",
    sources: [
      ArchiveSource(
        title: "Perlman · Violin & bow",
        url: "https://stringsmagazine.com/itzhak-perlman-turns-70-and-hes-loving-every-minute/")
    ]),
  Equipment(
    id: "perlman-henry", name: "Itzhak Perlman · Henry", maker: "Joseph Henry",
    date: "c. 1851–1870", kind: .bow,
    story: "Strings 的 Perlman 專訪報導記載他使用 Joseph Henry 製作的琴弓，年代約在 1851 至 1870 年。",
    sources: [
      ArchiveSource(
        title: "Perlman · Violin & bow",
        url: "https://stringsmagazine.com/itzhak-perlman-turns-70-and-hes-loving-every-minute/")
    ]),
  Equipment(
    id: "panette", name: "Panette", maker: "Giuseppe Guarneri del Gesù", date: "1737",
    kind: .violin,
    story: "曾由 Isaac Stern 使用的名琴。Tarisio 的訪談由後來的演奏者 Renaud Capuçon 談及這把琴，讓同一件器物串連不同世代。",
    sources: [
      ArchiveSource(
        title: "Tarisio · Panette",
        url: "https://tarisio.com/cozio-archive/cozio-carteggio/renaud-capucon-panette-guarneri/")
    ]),
  Equipment(
    id: "ysaye", name: "Ysaÿe", maker: "Giuseppe Guarneri del Gesù", date: "1740", kind: .violin,
    story: "Ysaÿe 曾在琴內留下視它為人生伴侶的文字；後來 Isaac Stern 也使用過它。從這裡可以沿著同一把琴，探索兩位演奏家。",
    sources: [
      ArchiveSource(
        title: "Nippon Music Foundation · Ysaÿe",
        url: "https://s-mf.or.jp/english/instruments-new/post_293.html"),
      ArchiveSource(
        title: "Tarisio · Provenance", url: "https://tarisio.com/cozio-archive/property/?ID=40064"),
    ]),
  Equipment(
    id: "ysaye-stern-tourte", name: "Ex-Ysaÿe, Stern · Tourte", maker: "François Xavier Tourte",
    date: nil, kind: .bow,
    story:
      "一支金與玳瑁裝配、八角弓桿的 Tourte 小提琴弓，曾屬 Ysaÿe，後由 Isaac Stern 取得。它與另一支同樣流傳至 Stern 的 Sartory 中提琴弓是不同器物。",
    sources: [
      ArchiveSource(
        title: "Tarisio · Ysaÿe's bows",
        url: "https://tarisio.com/cozio-archive/cozio-carteggio/eugene-ysaye-violins/")
    ]),
  Equipment(
    id: "david-heifetz", name: "David, Heifetz", maker: "Giuseppe Guarneri del Gesù",
    date: "c. 1740", kind: .violin,
    story:
      "Heifetz 於 1922 年購入、曾屬 Ferdinand David 的名琴。年代依 Cremonese 樂器檔案記為約 1740；該檔案指出琴內 1742 年標籤非原始標籤，因此文獻中會見到不同年份。",
    sources: [
      ArchiveSource(
        title: "Cremonese archive · David, Heifetz",
        url:
          "https://www.archiviodellaliuteriacremonese.it/strumenti/1740_violino_heifetz.aspx?f=457944"
      )
    ]),
  Equipment(
    id: "auer-heifetz", name: "Auer, Heifetz", maker: "Nikolai Kittel", date: nil, kind: .bow,
    story: "Tarisio 的流傳紀錄列出 Leopold Auer 與 Jascha Heifetz。這支弓為老師與學生之間留下了一條可追索的線索。",
    sources: [
      ArchiveSource(
        title: "Tarisio · Auer, Heifetz",
        url: "https://tarisio.com/cozio-archive/property/?ID=57798")
    ]),
  Equipment(
    id: "marsick", name: "Marsick", maker: "Antonio Stradivari", date: "1705", kind: .violin,
    story: "David Oistrakh 使用過的 Stradivari 之一，在他逝世後傳給兒子 Igor。",
    sources: [
      ArchiveSource(
        title: "The Strad · Oistrakh's instruments",
        url:
          "https://www.thestrad.com/artists/remembering-the-great-violinist-david-oistrakh/4547.article"
      )
    ]),
  Equipment(
    id: "oistrakh-richaume", name: "David Oistrakh · Richaume", maker: "André Richaume",
    date: "1957 年購入", kind: .bow, story: "Igor Oistrakh 在 1957 年購入這支弓，之後送給父親 David。此處年份記錄購入時間。",
    sources: [
      ArchiveSource(
        title: "The Strad · Oistrakh's bows",
        url:
          "https://www.thestrad.com/artists/remembering-the-great-violinist-david-oistrakh/4547.article"
      )
    ]),
  Equipment(
    id: "oistrakh-nurnberger", name: "David Oistrakh · Nürnberger", maker: "Albert Nürnberger",
    date: nil, kind: .bow,
    story: "The Strad 將 Nürnberger 與 Richaume 列為 Oistrakh 偏愛的兩位製弓師。具體琴弓的製作年代未詳。",
    sources: [
      ArchiveSource(
        title: "The Strad · Oistrakh's bows",
        url:
          "https://www.thestrad.com/artists/remembering-the-great-violinist-david-oistrakh/4547.article"
      )
    ]),
  Equipment(
    id: "ysaye-sartory", name: "Ysaÿe · Sartory", maker: "Eugène Sartory", date: "1928", kind: .bow,
    story:
      "為 Ysaÿe 特製的小提琴弓，刻有 Specialement fait pour E. Ysaye 題字與 1928 年份。此弓與他擁有的其他 Sartory 弓分別建檔。",
    sources: [
      ArchiveSource(
        title: "Tarisio · Ysaÿe Sartory",
        url: "https://tarisio.com/cozio-archive/property/?ID=56120")
    ]),
]
