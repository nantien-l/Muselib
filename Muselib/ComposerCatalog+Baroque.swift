import Foundation

// Historical statements are sourced; listening prompts are editorial suggestions.
let baroqueComposerProfiles: [ComposerProfile] = [
  ComposerProfile(
    id: .bach,
    lifespan: "1685–1750",
    places: "Eisenach · Köthen · Leipzig",
    invitation: "一把琴裡的多個聲部",
    introduction: "從教會與宮廷的工作，到無伴奏小提琴作品，Bach 不斷探索旋律、低音與和聲如何共同運作。",
    chapters: [
      ComposerChapter(
        id: "chapter-1", title: "教會、宮廷與城市",
        text:
          "Bach 的生涯連著管風琴演奏、教學與排練。他在 Köthen 擔任宮廷樂長，之後赴 Leipzig 就任 Thomaskantor，負責學校與教會音樂。不同職務帶來不同編制，也讓作曲成為與演出緊密相連的日常工作。"
      ),
      ComposerChapter(
        id: "chapter-2", title: "交替出現的聲部",
        text:
          "Ciaccona 位於第二號小提琴 Partita 的末尾。和弦、旋律與低音由同一把琴交替呈現；有些音已經停止，和聲仍在記憶中延續。演奏者如何展開和弦、強調哪個聲部，會直接影響我們聽見的結構。"
      ),
      ComposerChapter(
        id: "chapter-3", title: "從和弦的展開比較版本",
        text: "Heifetz 與 SooBeen Lee 的版本提供了兩種聆聽參照。從開頭和弦切入，注意各音之間的間隔，再追蹤旋律進入快速音群後，低音是否仍然清楚。"
      ),
    ],
    milestones: [
      ComposerMilestone(
        id: "event-1", date: "1685", title: "出生於 Eisenach", detail: "成長於音樂家庭。",
        source: ArchiveSource(
          title: "Bach-Archiv Leipzig · Chronology", url: "https://www.bach-leipzig.de/de/node/3231"
        )),
      ComposerMilestone(
        id: "event-2", date: "1717", title: "前往 Köthen", detail: "擔任宮廷樂長。",
        source: ArchiveSource(
          title: "Bach-Archiv Leipzig · Chronology", url: "https://www.bach-leipzig.de/de/node/3231"
        )),
      ComposerMilestone(
        id: "event-3", date: "1723", title: "就任 Leipzig Thomaskantor", detail: "承擔教學與城市教會音樂工作。",
        source: ArchiveSource(
          title: "Bach-Archiv Leipzig · Chronology", url: "https://www.bach-leipzig.de/de/node/3231"
        )),
      ComposerMilestone(
        id: "event-4", date: "1750", title: "逝世於 Leipzig", detail: "作品在演奏與研究中持續流傳。",
        source: ArchiveSource(
          title: "Bach-Archiv Leipzig · Chronology", url: "https://www.bach-leipzig.de/de/node/3231"
        )),
    ],
    entryWorkID: "bach-1004",
    sources: [
      ArchiveSource(
        title: "Bach-Archiv Leipzig · Chronology", url: "https://www.bach-leipzig.de/de/node/3231"),
      ArchiveSource(
        title: "Henle · Bach violin solos, preface",
        url: "https://www.henle.de/media/0b/f7/bb/1697725652/1187-1697725652-sync.pdf"),
    ]
  ),
  ComposerProfile(
    id: .vivaldi,
    lifespan: "1678–1741",
    places: "Venezia · Wien",
    invitation: "獨奏與合奏的鮮明對比",
    introduction: "Vivaldi 兼具小提琴家、教師與作曲家的身分。協奏曲中的短音、反覆段落與獨奏插句，構成他鮮明的音樂語言。",
    chapters: [
      ComposerChapter(
        id: "chapter-1", title: "在 Pietà 工作",
        text:
          "1703 年，Vivaldi 受任為 Venezia 的 Ospedale della Pietà 小提琴教師，此後長期與這所機構合作。他的創作包括協奏曲、歌劇與宗教音樂，也連著樂手的訓練與實際演出。"
      ),
      ComposerChapter(
        id: "chapter-2", title: "季節的文字與音樂",
        text:
          "Le quattro stagioni 於 1725 年隨 Op. 8 出版，並附有描寫季節的十四行詩。L’inverno 中的顫動、長句與急促音群，分別呈現不同觸感；文字提供場景，節奏與發音則讓場景成形。"
      ),
      ComposerChapter(
        id: "chapter-3", title: "反覆段落之間",
        text: "合奏的熟悉材料再次出現時，音樂會重新站穩；獨奏離開這些段落，展開新的音型。比較 Mutter 與 Perlman，可以從短音的長度與重音著手，聽獨奏如何帶動合奏。"),
    ],
    milestones: [
      ComposerMilestone(
        id: "event-1", date: "1678", title: "出生於 Venezia", detail: "從父親學習小提琴。",
        source: ArchiveSource(
          title: "Atlanta Symphony Orchestra · Vivaldi",
          url: "https://www.aso.org/artists/detail/antonio-vivaldi")),
      ComposerMilestone(
        id: "event-2", date: "1703", title: "在 Pietà 任教", detail: "開始與機構中的樂手合作。",
        source: ArchiveSource(
          title: "Atlanta Symphony Orchestra · Vivaldi",
          url: "https://www.aso.org/artists/detail/antonio-vivaldi")),
      ComposerMilestone(
        id: "event-3", date: "1725", title: "Le quattro stagioni 出版", detail: "收於協奏曲集 Op. 8。",
        source: ArchiveSource(
          title: "Barbican · Vivaldi’s Four Seasons",
          url: "https://www.barbican.org.uk/digital-programmes/vivaldis-four-seasons")),
      ComposerMilestone(
        id: "event-4", date: "1741", title: "逝世於 Wien", detail: "生涯最後一站離開了 Venezia。",
        source: ArchiveSource(
          title: "Atlanta Symphony Orchestra · Vivaldi",
          url: "https://www.aso.org/artists/detail/antonio-vivaldi")),
    ],
    entryWorkID: "vivaldi-297",
    sources: [
      ArchiveSource(
        title: "Atlanta Symphony Orchestra · Vivaldi",
        url: "https://www.aso.org/artists/detail/antonio-vivaldi"),
      ArchiveSource(
        title: "Barbican · Vivaldi’s Four Seasons",
        url: "https://www.barbican.org.uk/digital-programmes/vivaldis-four-seasons"),
    ]
  ),
]
