import Foundation

// Newly added works. Editorial listening prompts are general and do not claim
// to describe a particular recording; performance versions are added separately.
let expandedRepertoire: [MusicalWork] = [
  MusicalWork(
    id: "mendelssohn-quartet-6", title: "String Quartet No. 6 in F minor",
    subtitle: "Op. 80", composerID: .mendelssohn, catalogue: "Op. 80",
    form: "String quartet", invitation: "四把弦樂器，一起把不安推向前方。",
    introduction: "Mendelssohn 的最後一首弦樂四重奏以急促的節奏和緊密的齊奏開場。作品寫於姊姊 Fanny 去世後，情緒並不靠標題說明，而藏在反覆的重音、短促動機與樂章間強烈的性格差異裡。",
    listeningNotes: [
      "I. Allegro vivace assai：聽四件樂器如何以相近節奏一起起步，再分開交接音型。",
      "II. Allegretto assai：留意較平穩的舞步感，與第一樂章的急迫如何形成落差。",
      "IV. Finale: Allegro molto：追蹤持續推進的節奏，聽齊奏與各聲部交替時張力如何改變。",
    ],
    source: "https://www.henle.de/en/String-Quartet-f-minor-op.-post.-80/HN-678"),
  MusicalWork(
    id: "paganini-la-campanella", title: "La campanella",
    subtitle: "Rondo à la clochette · Violin Concerto No. 2 · Op. 7, III",
    composerID: .paganini, catalogue: "Op. 7 · III",
    form: "Violin & orchestra", invitation: "一聲鐘響，變成整個樂章的遊戲規則。",
    introduction: "這是 Paganini 第二號小提琴協奏曲的終樂章，常以《La campanella》（小鐘）稱呼。鈴聲般的高音音型反覆回來，周圍接上跳躍、快速音群與華彩；聽時可以把那個清脆音型當作路標，追蹤它每次回返時的變化。",
    listeningNotes: [
      "主題回返時：辨認高音的鐘聲效果，聽它與樂團的回答如何交替。",
      "獨奏音群變快時：追蹤節奏重心，不必逐音追趕，留意樂句何時落地。",
      "華彩段落：比較自由的獨奏與固定節拍的差別，聽樂團何時重新接回音樂。",
    ],
    source: "https://data.carnegiehall.org/works/37760/about"),
  MusicalWork(
    id: "ysaye-ballade", title: "Sonate pour violon seul No. 3 “Ballade”",
    subtitle: "Ré mineur · Op. 27 No. 3", composerID: .ysaye,
    catalogue: "Op. 27 No. 3", form: "Solo violin",
    invitation: "從自由的獨白，一路走到近乎失控的速度。",
    introduction: "Ysaÿe 的第三首無伴奏奏鳴曲只有一個連續樂章，題名《Ballade》。開頭像不受拍子限制的宣敘，隨後節奏逐步凝聚、速度加快；不需要先知道艱深技巧，只要聽音樂如何從說話般的語氣變成一口氣衝向終點。",
    listeningNotes: [
      "開頭：留意自由的停頓與裝飾音，像句子還在尋找方向。",
      "節奏成形後：追蹤反覆出現的短動機，聽速度與音量如何一層層增加。",
      "接近結尾：比較音群的密度與重音位置，感受整段音樂如何累積成高潮。",
    ],
    source: "https://www.henle.de/media/15/f0/1d/1690886060/0776-1690886060-sync.pdf"),
  MusicalWork(
    id: "ravel-tzigane", title: "Tzigane", subtitle: "Rapsodie de concert · M. 76",
    composerID: .ravel, catalogue: "M. 76", form: "Violin & piano / orchestra",
    invitation: "先只剩一把小提琴，然後整個聲場才打開。",
    introduction: "《Tzigane》先以小提琴獨奏的長篇引子展開，接著鋼琴或樂團加入，音樂轉入更有舞蹈感的快速段落。這個由空到滿的轉變，比把作品當成單純的炫技曲更能聽出它的戲劇設計。",
    listeningNotes: [
      "獨奏引子：聽自由速度如何呼吸，留意裝飾音之間的停頓。",
      "伴奏進入：比較聲音空間忽然變寬後，小提琴的發音與節奏如何改變。",
      "快速舞曲段：抓住反覆的節奏型，聽它如何穿過華彩與樂團／鋼琴的回應。",
    ],
    source: "https://www.henle.de/media/c7/8a/5a/1697725927/0587-1697725927-sync.pdf"),
  MusicalWork(
    id: "debussy-sonata", title: "Sonate pour violon et piano",
    subtitle: "sol mineur · L. 140", composerID: .debussy,
    catalogue: "L. 140", form: "Violin & piano",
    invitation: "聽一個小小的動機，怎麼突然換了光線。",
    introduction: "Debussy 最後完成的室內樂奏鳴曲由三個短小而性格不同的樂章構成。旋律常以片段出現，音色與和聲轉換比長篇主題更值得追蹤；第三樂章的快速回返，則把前面散落的能量收束起來。",
    listeningNotes: [
      "I. Allegro vivo：比較小提琴與鋼琴提出短動機的方式，留意同一材料再次出現時的音色。",
      "II. Intermède: Fantasque et léger：聽節奏忽快忽慢時，兩件樂器如何互相接話。",
      "III. Finale: Très animé：追蹤快速音型回返的位置，感受結尾如何聚集前兩樂章的能量。",
    ],
    source: "https://www.henle.de/media/38/e9/40/1690886053/0410-1690886053-sync.pdf"),
  MusicalWork(
    id: "prokofiev-concerto-1", title: "Violin Concerto No. 1 in D major",
    subtitle: "Op. 19", composerID: .prokofiev, catalogue: "Op. 19",
    form: "Violin concerto", invitation: "夢一般的旋律，忽然轉成尖銳的節奏。",
    introduction: "第一號協奏曲把三個樂章連成一條音色旅程：開頭與結尾都讓小提琴回到夢幻般的高音線條，中間樂章則用鮮明節奏和粗礪發音打破平衡。聽旋律如何變形，能比追逐技巧更快抓住作品個性。",
    listeningNotes: [
      "I. Andantino：從小提琴開場的長線條開始，聽樂團如何接住並改變它。",
      "II. Scherzo: Vivacissimo：留意短促、帶重音的節奏，和第一樂章的歌唱形成反差。",
      "III. Moderato：追蹤開頭的音色與旋律如何回來，注意結尾逐漸退回遠處的效果。",
    ],
    source: "https://www.eclassical.com/shop/17115/art93/4980593-c16ca7-BIS-2142_booklet.pdf"),
  MusicalWork(
    id: "prokofiev-concerto-2", title: "Violin Concerto No. 2 in G minor",
    subtitle: "Op. 63", composerID: .prokofiev, catalogue: "Op. 63",
    form: "Violin concerto", invitation: "小提琴一開口，就把旋律帶到你面前。",
    introduction: "第二號協奏曲從小提琴獨奏開始，旋律直接、清楚，帶著歌唱性；之後的樂章則在抒情線條、尖銳節奏與西班牙舞曲色彩之間切換。可以先聽三個開場，感受作品如何一次次換一種說話方式。",
    listeningNotes: [
      "I. Allegro moderato：聽獨奏如何以簡潔旋律建立語氣，再由樂團擴展。",
      "II. Andante assai：留意長音與伴奏的距離，聽樂句如何逐漸累積。",
      "III. Allegro, ben marcato：抓住明確的重音與舞蹈節奏，追蹤它們如何推向結尾。",
    ],
    source: "https://www.eclassical.com/shop/17115/art93/4980593-c16ca7-BIS-2142_booklet.pdf"),
  MusicalWork(
    id: "shostakovich-concerto-1", title: "Violin Concerto No. 1 in A minor",
    subtitle: "Op. 77 · Op. 99", composerID: .shostakovich,
    catalogue: "Op. 77 / Op. 99", form: "Violin concerto",
    invitation: "一段低聲獨白，接上一整場漫長的獨奏。",
    introduction: "四個樂章不像傳統協奏曲那樣只靠快慢交替。夜曲與帶有諷刺感的 Scherzo 之後，Passacaglia 讓固定低音反覆出現、逐步加壓，再直接接上長篇小提琴華彩，最後由 Burlesque 推向急促結尾。",
    listeningNotes: [
      "I. Nocturne：聽低音如何支撐緩慢旋律，留意音量很小時張力仍然存在。",
      "III. Passacaglia → Cadenza：追蹤固定低音反覆出現，聽它如何把音樂推進獨奏華彩。",
      "IV. Burlesque：比較尖銳的重音與快速節奏，感受前一樂章的沉重如何轉成躁動。",
    ],
    source: "https://www.bso.org/works/shostakovich-violin-concerto-no-1"),
  MusicalWork(
    id: "bartok-solo-sonata", title: "Sonata for Solo Violin",
    subtitle: "Sz. 117 · BB 124", composerID: .bartok,
    catalogue: "Sz. 117 · BB 124", form: "Solo violin",
    invitation: "一個人拉琴，卻能聽見和弦、低音和旋律同時存在。",
    introduction: "Bartók 為 Yehudi Menuhin 寫下這部無伴奏奏鳴曲。四個樂章從慢速的和弦與對位，走向帶有民間舞蹈氣息的快速音樂；演奏者需要讓一件樂器同時呈現多個聲部，也讓不同弓法變成清楚的音色對比。",
    listeningNotes: [
      "I. Tempo di ciaccona：聽和弦內部的旋律走向，不要只把它當成一串厚重的音。",
      "II. Fuga：追蹤主題先後出現在哪個音域，辨認獨奏如何製造對位感。",
      "IV. Presto：留意短促的發音、重音與弦上／弦外音色如何改變舞蹈感。",
    ],
    source: "https://www.boosey.com/cr/music/Bela-Bartok-Sonata-for-Violin-Solo/1190"),
  MusicalWork(
    id: "szymanowski-mythes", title: "Mythes",
    subtitle: "Trois poèmes pour violon et piano · Op. 30",
    composerID: .szymanowski, catalogue: "Op. 30",
    form: "Violin & piano", invitation: "從一座噴泉的倒影，聽見音色如何流動。",
    introduction: "《Mythes》由三首小提琴與鋼琴作品組成：〈La fontaine d’Aréthuse〉、〈Narcisse〉和〈Dryades et Pan〉。鋼琴與小提琴的聲音交疊出帶有神話意象的音響世界；第一首中，鋼琴流動的音型與小提琴高音色彩，是很好的入門線索。",
    listeningNotes: [
      "〈La fontaine d’Aréthuse〉：聽鋼琴的流動音型，和小提琴長音如何疊在一起。",
      "〈Narcisse〉：留意旋律如何像倒影般重現，音色是否在每次回返時改變。",
      "〈Dryades et Pan〉：追蹤節奏與發音轉得更活躍時，兩件樂器如何互相追逐。",
    ],
    source: "https://audite.de/media/file/00/30/91/Digibooklet.pdf"),
  MusicalWork(
    id: "chausson-poeme", title: "Poème",
    subtitle: "Op. 25", composerID: .chausson, catalogue: "Op. 25",
    form: "Violin & orchestra", invitation: "不用急著找主題，先聽情緒怎麼改變方向。",
    introduction: "Chausson 的《Poème》是一段連續發展的音樂，不採傳統協奏曲的快慢樂章配置。小提琴的獨白在樂團聲響中反覆出現、改變表情；旋律時而往前推，時而停下來，最後把能量收束回安靜。",
    listeningNotes: [
      "開頭：聽樂團如何建立背景，再留意小提琴進場的音域與力度。",
      "中段：追蹤旋律回返時的變化，辨認是音高、節奏還是配器改變了情緒。",
      "結尾：注意音樂如何逐漸放鬆，聽最後的聲音是否真正得到平靜。",
    ],
    source: "https://www.henle.de/media/0c/fb/b8/1690886047/0738-1690886047-sync.pdf"),
  MusicalWork(
    id: "dvorak-concerto", title: "Violin Concerto in A minor",
    subtitle: "Op. 53", composerID: .dvorak, catalogue: "Op. 53",
    form: "Violin concerto", invitation: "協奏曲的長線條裡，藏著舞曲的步伐。",
    introduction: "Dvořák 的協奏曲以交響性的樂團開場，獨奏加入後，音樂在長線條與鮮明節奏之間切換。慢樂章讓旋律充分歌唱，終樂章則帶入舞曲脈動；可把重音位置當成線索，聽出節奏如何讓音樂轉身。",
    listeningNotes: [
      "I. Allegro ma non troppo：比較樂團與獨奏各自提出的材料，聽它們如何接合。",
      "II. Adagio ma non troppo：追蹤旋律長句，留意樂團伴奏怎麼襯托或接手。",
      "III. Finale: Allegro giocoso, ma non troppo：聽舞曲節奏的重心，辨認主題何時回來。",
    ],
    source: "https://www.antonin-dvorak.cz/en/work/concerto-for-violin-and-orchestra-in-a-minor/"),
]
