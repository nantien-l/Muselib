import Foundation

// Historical statements are sourced; listening prompts are editorial suggestions.
let romanticComposerProfiles: [ComposerProfile] = [
  ComposerProfile(
    id: .paganini,
    lifespan: "1782–1840",
    places: "Genova · Lucca · Wien · Nice",
    invitation: "技巧成為變奏的語言",
    introduction: "Paganini 把演奏經驗寫進作品。第二十四號隨想曲以相同主題為基礎，用音型與發音的變化組織音樂。",
    chapters: [
      ComposerChapter(
        id: "chapter-1", title: "從 Genova 到歐洲舞台",
        text:
          "Paganini 出生於 Genova，早年學習小提琴與吉他，也曾在 Lucca 的宮廷樂團工作。1828 年展開的海外巡演擴大了他的聲名。作曲與演奏在他的生涯中始終緊密相連。"
      ),
      ComposerChapter(
        id: "chapter-2", title: "一個主題的多種寫法",
        text: "第二十四號隨想曲由主題與變奏構成。雙音、快速音群與不同發音，改變了音樂的表面；節奏輪廓與樂句的終點，仍讓主題可被辨認。每個技巧也因此帶出不同的段落性格。"
      ),
      ComposerChapter(
        id: "chapter-3", title: "速度之外的線條",
        text: "聽 Perlman 的版本，可以先記住主題的句尾，再比較各變奏如何抵達同一位置。音符越密集，越容易注意到清楚的重音與收束如何維持樂句。"),
    ],
    milestones: [
      ComposerMilestone(
        id: "event-1", date: "1782", title: "出生於 Genova", detail: "早年學習小提琴，也接觸吉他。",
        source: ArchiveSource(
          title: "Premio Paganini · Niccolò Paganini",
          url: "https://www.premiopaganini.it/history/niccolo-paganini")),
      ComposerMilestone(
        id: "event-2", date: "1805–1807", title: "在 Lucca 宮廷樂團工作", detail: "擔任首席小提琴。",
        source: ArchiveSource(
          title: "Premio Paganini · Niccolò Paganini",
          url: "https://www.premiopaganini.it/history/niccolo-paganini")),
      ComposerMilestone(
        id: "event-3", date: "1828", title: "展開海外巡演", detail: "從 Wien 出發，擴大歐洲舞台上的聲名。",
        source: ArchiveSource(
          title: "Premio Paganini · Niccolò Paganini",
          url: "https://www.premiopaganini.it/history/niccolo-paganini")),
      ComposerMilestone(
        id: "event-4", date: "1840", title: "逝世於 Nice", detail: "後世繼續演奏與改寫他的主題。",
        source: ArchiveSource(
          title: "Premio Paganini · Niccolò Paganini",
          url: "https://www.premiopaganini.it/history/niccolo-paganini")),
    ],
    entryWorkID: "paganini-24",
    sources: [
      ArchiveSource(
        title: "Premio Paganini · Niccolò Paganini",
        url: "https://www.premiopaganini.it/history/niccolo-paganini"),
      ArchiveSource(
        title: "Warner Classics · Paganini: 24 Caprices",
        url: "https://www.warnerclassics.com/release/paganini-24-caprices"),
    ]
  ),
  ComposerProfile(
    id: .mendelssohn,
    lifespan: "1809–1847",
    places: "Hamburg · Berlin · Leipzig",
    invitation: "作曲家與小提琴家的長期合作",
    introduction: "E 小調協奏曲的開場旋律，早在完成前多年便出現在 Mendelssohn 與 Ferdinand David 的交流中。",
    chapters: [
      ComposerChapter(
        id: "chapter-1", title: "創作、指揮與教學",
        text:
          "Mendelssohn 的音樂工作包括演奏、指揮與教學。1843 年 Leipzig 音樂院開幕時，他擔任首任教務領導。作品的創作與傳播，也依靠這些音樂家與機構之間的合作。"
      ),
      ComposerChapter(
        id: "chapter-2", title: "多年醞釀的協奏曲",
        text:
          "1838 年，Mendelssohn 在信中向 Ferdinand David 提到 E 小調協奏曲的念頭。作品完成後，於 1845 年由 David 在 Leipzig 首演。長期交流讓小提琴的演奏需求參與了作品的形成。"
      ),
      ComposerChapter(
        id: "chapter-3", title: "連接三個樂章",
        text:
          "開頭的獨奏長句、慢樂章的歌唱與終樂章的輕巧發音，呈現不同性格。比較 Stern、Mutter 與 Heifetz 時，也值得注意樂章交界：前一段如何結束，會影響下一段開始的感覺。"
      ),
    ],
    milestones: [
      ComposerMilestone(
        id: "event-1", date: "1809", title: "出生於 Hamburg", detail: "後來的音樂生涯延伸至 Berlin 與 Leipzig。",
        source: ArchiveSource(
          title: "Mendelssohn-Haus Leipzig · Felix!",
          url: "https://www.mendelssohn-stiftung.de/de/felix")),
      ComposerMilestone(
        id: "event-2", date: "1838", title: "向 David 提起協奏曲計畫", detail: "信中已提到 E 小調的音樂念頭。",
        source: ArchiveSource(
          title: "Henle · Violin Concerto Op. 64, preface",
          url: "https://www.henle.de/media/6d/a9/de/1690886062/0720-1690886062-sync.pdf")),
      ComposerMilestone(
        id: "event-3", date: "1843", title: "Leipzig 音樂院開幕", detail: "Mendelssohn 擔任首任教務領導。",
        source: ArchiveSource(
          title: "Mendelssohn-Haus Leipzig · Felix!",
          url: "https://www.mendelssohn-stiftung.de/de/felix")),
      ComposerMilestone(
        id: "event-4", date: "1845", title: "E 小調協奏曲首演",
        detail: "3 月 13 日，David 獨奏、Niels W. Gade 指揮。",
        source: ArchiveSource(
          title: "Mendelssohn-Haus Leipzig · Felix!",
          url: "https://www.mendelssohn-stiftung.de/de/felix")),
      ComposerMilestone(
        id: "event-5", date: "1847", title: "逝世於 Leipzig", detail: "作品持續留在音樂會與教學曲目中。",
        source: ArchiveSource(
          title: "Mendelssohn-Haus Leipzig · Felix!",
          url: "https://www.mendelssohn-stiftung.de/de/felix")),
    ],
    entryWorkID: "mendelssohn-64",
    sources: [
      ArchiveSource(
        title: "Mendelssohn-Haus Leipzig · Felix!",
        url: "https://www.mendelssohn-stiftung.de/de/felix"),
      ArchiveSource(
        title: "Henle · Violin Concerto Op. 64, preface",
        url: "https://www.henle.de/media/6d/a9/de/1690886062/0720-1690886062-sync.pdf"),
    ]
  ),
  ComposerProfile(
    id: .wieniawski,
    lifespan: "1835–1880",
    places: "Lublin · Paris · St. Petersburg",
    invitation: "演奏、創作與教學",
    introduction: "Wieniawski 的小提琴作品同時要求技巧與旋律線條。第二號協奏曲把兩者放進同一段音樂之中。",
    chapters: [
      ComposerChapter(
        id: "chapter-1", title: "從 Lublin 到 Paris",
        text:
          "Wieniawski 出生於 Lublin，年少時進入 Paris Conservatoire，隨 Lambert Massart 學習。他後來以巡演小提琴家展開生涯，亦從事教學。技巧的設計與樂句的表達，都是他寫作時直接面對的問題。"
      ),
      ComposerChapter(
        id: "chapter-2", title: "持續修訂的作品",
        text:
          "1862 年 St. Petersburg 音樂院成立時，Wieniawski 參與小提琴與室內樂教學。第二號協奏曲的早期版本亦完成於這一年，後來仍持續修訂。樂譜因此保留了演奏與修改相互作用的痕跡。"
      ),
      ComposerChapter(
        id: "chapter-3", title: "旋律穿過音群",
        text: "Romance 的長句展現了作品的歌唱性。回到外側樂章，同樣可以追蹤快速音群中的旋律方向。Bohdan Luts 的比賽影片，讓這些交接與收束可以連同演奏動作一起觀察。"
      ),
    ],
    milestones: [
      ComposerMilestone(
        id: "event-1", date: "1835", title: "出生於 Lublin", detail: "在重視音樂的家庭成長。",
        source: ArchiveSource(
          title: "Wieniawski Society · Calendar",
          url: "https://www.wieniawski.com/calendar_eng.html")),
      ComposerMilestone(
        id: "event-2", date: "1843", title: "進入 Paris Conservatoire",
        detail: "隨 Lambert Massart 學習小提琴。",
        source: ArchiveSource(
          title: "Wieniawski Society · Calendar",
          url: "https://www.wieniawski.com/calendar_eng.html")),
      ComposerMilestone(
        id: "event-3", date: "1862", title: "參與 St. Petersburg 音樂院教學", detail: "教授小提琴與室內樂。",
        source: ArchiveSource(
          title: "Wieniawski Society · Calendar",
          url: "https://www.wieniawski.com/calendar_eng.html")),
      ComposerMilestone(
        id: "event-4", date: "1862", title: "第二號協奏曲的早期版本", detail: "之後數年繼續修訂作品。",
        source: ArchiveSource(
          title: "Wieniawski Society · List of works",
          url: "https://www.wieniawski.com/list_of_works.html")),
      ComposerMilestone(
        id: "event-5", date: "1880", title: "逝世於 Moscow", detail: "作為演奏家、作曲家與教師留下影響。",
        source: ArchiveSource(
          title: "Wieniawski Society · Calendar",
          url: "https://www.wieniawski.com/calendar_eng.html")),
    ],
    entryWorkID: "wieniawski-22",
    sources: [
      ArchiveSource(
        title: "Wieniawski Society · Calendar", url: "https://www.wieniawski.com/calendar_eng.html"),
      ArchiveSource(
        title: "Wieniawski Society · List of works",
        url: "https://www.wieniawski.com/list_of_works.html"),
    ]
  ),
  ComposerProfile(
    id: .tchaikovsky,
    lifespan: "1840–1893",
    places: "Votkinsk · Clarens · St. Petersburg",
    invitation: "旋律的延伸與節奏的推進",
    introduction: "Tchaikovsky 的小提琴協奏曲寫於 Clarens。與演奏者的交流，以及不同城市的演出，構成作品形成與傳播的歷史。",
    chapters: [
      ComposerChapter(
        id: "chapter-1", title: "在 Clarens 試奏",
        text:
          "1878 年，Tchaikovsky 在瑞士 Clarens 與小提琴家 Iosif Kotek 一起接觸小提琴曲目，並寫下協奏曲。Lalo 的 Symphonie espagnole 是當時的靈感之一，試奏與討論則讓樂器的實際聲響參與創作。"
      ),
      ComposerChapter(
        id: "chapter-2", title: "走向不同城市",
        text:
          "Brodsky 與 Hans Richter 於 1881 年在 Wien 的演出，是作品傳播的重要一站。Tchaikovsky Research 另整理了更早的 Hannover 演出證據，讓這部協奏曲的早期演出史有了新的線索。"
      ),
      ComposerChapter(
        id: "chapter-3", title: "從長句到舞曲",
        text: "第一樂章的主題逐漸延伸成密集音群，終樂章則以重音與節奏推進。比較 Perlman 與 Ferras，除了整體速度，也可以注意一句旋律在何處停留，以及短音保留了多少重量。"
      ),
    ],
    milestones: [
      ComposerMilestone(
        id: "event-1", date: "1840", title: "出生於 Votkinsk", detail: "生涯之後跨越多座城市。",
        source: ArchiveSource(
          title: "Boston Symphony Orchestra · Tchaikovsky",
          url: "https://www.bso.org/profiles/pyotr-ilyich-tchaikovsky")),
      ComposerMilestone(
        id: "event-2", date: "1878", title: "寫作小提琴協奏曲", detail: "在 Clarens 與 Kotek 交流小提琴曲目。",
        source: ArchiveSource(
          title: "Tchaikovsky Research · Violin Concerto",
          url: "https://en.tchaikovsky-research.net/pages/Violin_Concerto")),
      ComposerMilestone(
        id: "event-3", date: "1881", title: "Brodsky 在 Wien 演奏協奏曲",
        detail: "與 Hans Richter 合作，成為傳播的重要一站。",
        source: ArchiveSource(
          title: "Tchaikovsky Research · Violin Concerto",
          url: "https://en.tchaikovsky-research.net/pages/Violin_Concerto")),
      ComposerMilestone(
        id: "event-4", date: "1893", title: "逝世於 St. Petersburg", detail: "留下協奏曲、交響曲、芭蕾與歌劇作品。",
        source: ArchiveSource(
          title: "Boston Symphony Orchestra · Tchaikovsky",
          url: "https://www.bso.org/profiles/pyotr-ilyich-tchaikovsky")),
    ],
    entryWorkID: "tchaikovsky-35",
    sources: [
      ArchiveSource(
        title: "Boston Symphony Orchestra · Tchaikovsky",
        url: "https://www.bso.org/profiles/pyotr-ilyich-tchaikovsky"),
      ArchiveSource(
        title: "Tchaikovsky Research · Violin Concerto",
        url: "https://en.tchaikovsky-research.net/pages/Violin_Concerto"),
    ]
  ),
  ComposerProfile(
    id: .franck,
    lifespan: "1822–1890",
    places: "Liège · Paris",
    invitation: "動機在四個樂章中回返",
    introduction: "Franck 的 A 大調奏鳴曲以相似動機串連不同樂章，小提琴與鋼琴共同承擔旋律與推進。",
    chapters: [
      ComposerChapter(
        id: "chapter-1", title: "管風琴家與教師",
        text: "Franck 出生於 Liège，後來在 Paris 學習與工作，並在音樂院教授管風琴。他也寫作室內樂與管弦樂，將演奏與教學經驗帶入不同編制的創作。"),
      ComposerChapter(
        id: "chapter-2", title: "題獻給 Ysaÿe",
        text:
          "1886 年完成的 A 大調小提琴奏鳴曲，題獻給 Eugène Ysaÿe。Ysaÿe 是作品早期的重要演奏者；後來不同世代的小提琴家與鋼琴家，持續以新的合作組合演出這部作品。"
      ),
      ComposerChapter(
        id: "chapter-3", title: "兩件樂器的接續",
        text: "第一樂章鋼琴提出的材料，在後續樂章中以不同面貌回返。終樂章的模仿尤其清楚：同一條旋律由兩件樂器先後奏出，既各自完整，又互相交織。"),
    ],
    milestones: [
      ComposerMilestone(
        id: "event-1", date: "1822", title: "出生於 Liège", detail: "之後前往 Paris 學習與工作。",
        source: ArchiveSource(
          title: "Henle · Franck biography & Violin Sonata",
          url: "https://www.henle.de/us/Violin-Sonata-A-major/HN-1351")),
      ComposerMilestone(
        id: "event-2", date: "1872", title: "在 Paris 音樂院教授管風琴", detail: "教學是他音樂生涯的重要部分。",
        source: ArchiveSource(
          title: "Henle · Franck biography & Violin Sonata",
          url: "https://www.henle.de/us/Violin-Sonata-A-major/HN-1351")),
      ComposerMilestone(
        id: "event-3", date: "1886", title: "完成 A 大調小提琴奏鳴曲", detail: "題獻給 Eugène Ysaÿe。",
        source: ArchiveSource(
          title: "Henle · Franck biography & Violin Sonata",
          url: "https://www.henle.de/us/Violin-Sonata-A-major/HN-1351")),
      ComposerMilestone(
        id: "event-4", date: "1890", title: "逝世於 Paris", detail: "晚期作品持續進入音樂會曲目。",
        source: ArchiveSource(
          title: "Henle · Franck biography & Violin Sonata",
          url: "https://www.henle.de/us/Violin-Sonata-A-major/HN-1351")),
    ],
    entryWorkID: "franck-sonata",
    sources: [
      ArchiveSource(
        title: "Henle · Franck biography & Violin Sonata",
        url: "https://www.henle.de/us/Violin-Sonata-A-major/HN-1351"),
      ArchiveSource(
        title: "Henle · Franck sonata, preface",
        url: "https://www.henle.de/media/b8/b3/13/1697725903/1351-1697725903-sync.pdf"),
    ]
  ),
  ComposerProfile(
    id: .sibelius,
    lifespan: "1865–1957",
    places: "Hämeenlinna · Helsinki · Järvenpää",
    invitation: "獨奏與樂團的層次",
    introduction: "Sibelius 的小提琴協奏曲歷經 1904 年第一版與 1905 年修訂版。音樂在寬廣長句與鮮明節奏之間轉換。",
    chapters: [
      ComposerChapter(
        id: "chapter-1", title: "從開頭的音色進入",
        text:
          "Sibelius 出生於芬蘭 Hämeenlinna，晚年居於 Järvenpää。小提琴協奏曲的開頭，讓獨奏懸在細密的弦樂背景上；旋律的音域與樂團的厚度，持續改變聲音的遠近。"
      ),
      ComposerChapter(
        id: "chapter-2", title: "兩個版本",
        text:
          "第一版於 1904 年在 Helsinki 演出，由 Viktor Nováček 獨奏、作曲家指揮。修訂版於 1905 年在 Berlin 演出，由 Karl Halir 獨奏、Richard Strauss 指揮，也是今天熟悉的版本。"
      ),
      ComposerChapter(
        id: "chapter-3", title: "不同版本的聲音比例",
        text:
          "Ferras、Perlman 與 SooBeen Lee 的演出，可以從獨奏與樂團的音量比例開始比較。慢樂章的長句如何累積張力，終樂章的重音如何與伴奏交錯，則提供了另外兩個參照。"
      ),
    ],
    milestones: [
      ComposerMilestone(
        id: "event-1", date: "1865", title: "出生於 Hämeenlinna", detail: "亦稱 Tavastehus。",
        source: ArchiveSource(
          title: "Boston Symphony Orchestra · Sibelius Violin Concerto",
          url: "https://www.bso.org/works/sibelius-violin-concerto")),
      ComposerMilestone(
        id: "event-2", date: "1904", title: "協奏曲第一版演出", detail: "Helsinki，Nováček 獨奏、Sibelius 指揮。",
        source: ArchiveSource(
          title: "Boston Symphony Orchestra · Sibelius Violin Concerto",
          url: "https://www.bso.org/works/sibelius-violin-concerto")),
      ComposerMilestone(
        id: "event-3", date: "1905", title: "修訂版在 Berlin 演出",
        detail: "Halir 獨奏、Richard Strauss 指揮。",
        source: ArchiveSource(
          title: "Boston Symphony Orchestra · Sibelius Violin Concerto",
          url: "https://www.bso.org/works/sibelius-violin-concerto")),
      ComposerMilestone(
        id: "event-4", date: "1957", title: "逝世於 Järvenpää", detail: "協奏曲繼續由不同世代演奏。",
        source: ArchiveSource(
          title: "Boston Symphony Orchestra · Sibelius Violin Concerto",
          url: "https://www.bso.org/works/sibelius-violin-concerto")),
    ],
    entryWorkID: "sibelius-47",
    sources: [
      ArchiveSource(
        title: "Boston Symphony Orchestra · Sibelius Violin Concerto",
        url: "https://www.bso.org/works/sibelius-violin-concerto"),
      ArchiveSource(
        title: "IRCAM · Concerto pour violon",
        url: "https://ressources.ircam.fr/en/work/concerto-pour-violon-et-orchestre-en-re-mineur"),
    ]
  ),
]
