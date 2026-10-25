import Foundation

private let vasksLife = ArchiveSource(
  title: "Pēteris Vasks · Life & creative work",
  url: "https://peterisvasks.lv/en/about-peteris-vasks/"
)
private let vasksStudies = ArchiveSource(
  title: "Schott · Pēteris Vasks biography",
  url: "https://schottmusiclondon.com/person/peteris-vasks"
)
private let voxAmoris = ArchiveSource(
  title: "Schott · Vox amoris",
  url: "https://www.schott-music.com/en/vox-amoris-noc269204.html"
)
private let distantLight = ArchiveSource(
  title: "Schott · Tālā gaisma",
  url: "https://www.schott-music.com/en/concerto-no-1-noc39411.html"
)
private let beethovenLife = ArchiveSource(
  title: "Beethoven-Haus Bonn · Biography",
  url: "https://www.beethoven.de/en/beethoven"
)
private let beethovenVienna = ArchiveSource(
  title: "City of Bonn · Beethoven's life",
  url: "https://www.bonn.de/bonn-erleben/beethoven/beethoven-kuenstler.php?loc=en"
)
private let beethovenConcerto = ArchiveSource(
  title: "Cedille Records · Beethoven & Clement",
  url: "https://www.cedillerecords.org/albums/beethoven-and-clement-violin-concertos/"
)
private let brahmsLife = ArchiveSource(
  title: "Deutsches Historisches Museum · Johannes Brahms",
  url: "https://www.dhm.de/lemo/biografie/johannes-brahms"
)
private let brahmsSonata = ArchiveSource(
  title: "Henle · Violin Sonata, Op. 108",
  url: "https://www.henle.de/Violin-Sonata-d-minor-op.-108/HN-1570"
)
private let brahmsPreface = ArchiveSource(
  title: "Henle · The three violin sonatas, preface",
  url: "https://www.henle.de/media/bd/1e/81/1697725885/1566-1697725885-sync.pdf"
)

/// Only completed editorial profiles are exposed as navigable composer pages.
private let featuredComposerProfiles: [ComposerProfile] = [
  ComposerProfile(
    id: .vasks,
    lifespan: "1946 —",
    places: "Aizpute · Vilnius · Rīga",
    invitation: "弦樂、自然與記憶",
    introduction: "Vasks 曾是低音提琴手。自然景象與對人的關懷，構成他弦樂創作的重要線索。",
    chapters: [
      ComposerChapter(
        id: "origins", title: "從樂團走向作曲",
        text:
          "Vasks 於 1946 年出生在拉脫維亞 Aizpute 的牧師家庭，後來赴 Vilnius 學習低音提琴。他曾在樂團演奏，之後在 Rīga 隨 Valentin Utkin 學習作曲。弦樂的集體聲響，與獨奏者的位置，始終是他創作中的重要關係。"
      ),
      ComposerChapter(
        id: "language", title: "自然與歷史經驗",
        text: "鳥鳴、森林、海洋，以及光明與黑暗的對照，出現在 Vasks 對創作的描述中，也連著拉脫維亞的歷史經驗。音樂中的安靜與張力，不斷改變旋律出現的方式。"
      ),
      ComposerChapter(
        id: "violin", title: "小提琴與弦樂團",
        text:
          "在 Tālā gaisma 之後，Vasks 又以相同編制寫下 Vox Amoris，並以愛作為作品核心。獨奏有時清楚浮在前景，有時被弦樂包圍；兩者之間的距離，形成單樂章內部的起伏。"
      ),
    ],
    milestones: [
      ComposerMilestone(
        id: "birth", date: "1946", title: "出生於 Aizpute", detail: "成長於拉脫維亞的牧師家庭。", source: vasksLife),
      ComposerMilestone(
        id: "bass", date: "1964–1970", title: "在 Vilnius 學習低音提琴", detail: "低音提琴與樂團演奏是他早期音樂經驗的一部分。",
        source: vasksLife),
      ComposerMilestone(
        id: "composition", date: "1973–1978", title: "在 Rīga 學習作曲",
        detail: "師從 Valentin Utkin，進一步投入創作。", source: vasksStudies),
      ComposerMilestone(
        id: "distant-light", date: "1996–1997", title: "Tālā gaisma", detail: "為小提琴與弦樂團創作的第一號協奏曲。",
        source: distantLight),
      ComposerMilestone(
        id: "vox-amoris", date: "2008–2009", title: "Vox Amoris", detail: "以小提琴與弦樂團寫下單樂章幻想曲。",
        source: voxAmoris),
    ],
    entryWorkID: "vasks-vox-amoris",
    sources: [vasksLife, vasksStudies, distantLight, voxAmoris]
  ),
  ComposerProfile(
    id: .beethoven,
    lifespan: "1770–1827",
    places: "Bonn · Wien",
    invitation: "由短小節奏展開的長篇結構",
    introduction: "Beethoven 的小提琴協奏曲從定音鼓的重複音開始，讓簡單的節奏材料貫穿寬廣段落。",
    chapters: [
      ComposerChapter(
        id: "bonn-vienna", title: "從 Bonn 到 Wien",
        text:
          "Beethoven 於 1770 年出生在 Bonn 的音樂家庭。1792 年赴 Wien 向 Haydn 學習，此後在那裡生活與創作。重複、延伸與改變短小材料，是觀察他音樂結構的一條線索。"
      ),
      ComposerChapter(
        id: "concerto", title: "與 Franz Clement 合作",
        text:
          "D 大調小提琴協奏曲於 1806 年 12 月 23 日在 Wien 首演，獨奏為 Franz Clement。Clement 兼具作曲家與小提琴家身分；這部作品則讓獨奏在充分展開的樂團段落之後進入。"
      ),
      ComposerChapter(
        id: "listening", title: "定音鼓的節奏",
        text: "開場定音鼓的重複音，為第一樂章提供鮮明的節奏參照。旋律與配器不斷改變，相關節奏仍會回返。比較演奏版本時，可以追蹤同一材料在獨奏與樂團之間如何交接。"
      ),
    ],
    milestones: [
      ComposerMilestone(
        id: "birth", date: "1770", title: "出生於 Bonn", detail: "在音樂家庭中成長。", source: beethovenLife),
      ComposerMilestone(
        id: "vienna", date: "1792", title: "前往 Wien", detail: "向 Haydn 學習，之後以 Wien 為生活與創作中心。",
        source: beethovenVienna),
      ComposerMilestone(
        id: "concerto", date: "1806", title: "小提琴協奏曲首演", detail: "12 月 23 日，由 Franz Clement 擔任獨奏。",
        source: beethovenConcerto),
      ComposerMilestone(
        id: "death", date: "1827", title: "逝世於 Wien", detail: "留下可從不同演出與版本持續探索的作品。",
        source: beethovenLife),
    ],
    entryWorkID: "beethoven-61",
    sources: [beethovenLife, beethovenVienna, beethovenConcerto]
  ),
  ComposerProfile(
    id: .brahms,
    lifespan: "1833–1897",
    places: "Hamburg · Düsseldorf · Wien",
    invitation: "旋律與內聲部共同推進",
    introduction: "Brahms 的奏鳴曲與協奏曲，讓獨奏和合作聲部共同承擔音樂的方向。旋律下方的低音與節奏，同樣值得注意。",
    chapters: [
      ComposerChapter(
        id: "connections", title: "與音樂家的相遇",
        text:
          "1833 年出生於 Hamburg 的 Brahms，早年以鋼琴演奏與作曲展開生涯。1853 年，他與 Joseph Joachim 及 Clara、Robert Schumann 相識。這些關係連結了創作、演奏與長期交流。"
      ),
      ComposerChapter(
        id: "sonatas", title: "三首小提琴奏鳴曲",
        text:
          "三首小提琴奏鳴曲集中完成於 1878 至 1888 年。D 小調第三號於 1888 年完成，是其中唯一的小調作品，亦採四樂章安排。旋律的張力與鋼琴的節奏，使它與前兩首呈現不同性格。"
      ),
      ComposerChapter(
        id: "duo", title: "鋼琴的低音與內聲部",
        text:
          "聽第三號奏鳴曲時，將注意力從小提琴移向鋼琴，會更容易辨認推進來自哪個聲部。Oistrakh、Mutter 與 Heifetz 的版本，也讓不同鋼琴合作夥伴的處理一同進入比較。"
      ),
    ],
    milestones: [
      ComposerMilestone(
        id: "birth", date: "1833", title: "出生於 Hamburg", detail: "早年以鋼琴演奏與作曲發展音樂生涯。",
        source: brahmsLife),
      ComposerMilestone(
        id: "schumanns", date: "1853", title: "與 Joachim、Schumann 夫婦相識",
        detail: "演奏者、作曲家與朋友之間的關係成為生涯的重要部分。", source: brahmsLife),
      ComposerMilestone(
        id: "vienna", date: "1862", title: "初訪 Wien", detail: "此後與這座城市的音樂生活逐漸建立深厚關係。",
        source: brahmsLife),
      ComposerMilestone(
        id: "sonata", date: "1888", title: "完成 Violin Sonata No. 3", detail: "歷經數年寫作，完成 Op. 108。",
        source: brahmsSonata),
      ComposerMilestone(
        id: "death", date: "1897", title: "逝世於 Wien", detail: "小提琴奏鳴曲仍在不同演奏組合中持續被重新詮釋。",
        source: brahmsLife),
    ],
    entryWorkID: "brahms-108",
    sources: [brahmsLife, brahmsSonata, brahmsPreface]
  ),
]

/// One profile for every composer represented in the current repertoire.
let composerProfiles: [ComposerProfile] =
  (featuredComposerProfiles + baroqueComposerProfiles + romanticComposerProfiles + modernComposerProfiles).sorted {
    $0.name.localizedStandardCompare($1.name) == .orderedAscending
  }
