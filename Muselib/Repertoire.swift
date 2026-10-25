import Foundation

struct MusicalWork: Identifiable, Hashable {
  let id: String
  let title: String
  let subtitle: String
  let composerID: ComposerID
  var composer: String { composerID.name }
  var composerProfile: ComposerProfile? { composerID.profile }
  let catalogue: String
  let form: String
  let invitation: String
  let introduction: String
  let listeningNotes: [String]
  let source: String

  var performerIDs: [String] {
    var seen = Set<String>()
    return (versions.map(\.performerID) + (historicalConnections[id] ?? [])).filter {
      seen.insert($0).inserted
    }
  }
  var performers: [Performer] {
    performerIDs.compactMap { performerID in artists.first { $0.id == performerID } }
  }

}

// Listening prompts are editorial suggestions, not descriptions of a specific recording.
let coreRepertoire: [MusicalWork] = [
  MusicalWork(
    id: "brahms-77", title: "Konzert für Violine und Orchester", subtitle: "D-Dur · Op. 77",
    composerID: .brahms, catalogue: "Op. 77", form: "Violin concerto",
    invitation: "從樂團的開場，聽到獨奏的回應。",
    introduction: "樂團先展開長段落，小提琴隨後接過旋律，讓開場的材料重新流動。慢樂章由雙簧管唱出主題，終樂章則以鮮明的重音推進。三個樂章裡，獨奏與樂團輪流帶領音樂。",
    listeningNotes: [
      "I. Allegro non troppo：比較樂團開場與獨奏進場的語氣，辨認相同材料如何改變。", "II. Adagio：記住雙簧管的旋律，聽小提琴如何在其上加以裝飾。",
      "III. Allegro giocoso, ma non troppo vivace：留意主題的重音，以及快速音群回到主題時的節奏。",
    ],
    source:
      "https://www.medici.tv/en/concerts/henryk-wieniawski-international-violin-competition-2026-semi-final-1"
  ),
  MusicalWork(
    id: "vasks-vox-amoris", title: "Vox Amoris",
    subtitle: "Fantasy for Violin and String Orchestra", composerID: .vasks, catalogue: "2008–2009",
    form: "Violin & strings", invitation: "一條旋律，置身整片弦樂之中。",
    introduction:
      "Vasks 在 2008 至 2009 年寫下這部單樂章幻想曲，以小提琴與弦樂團描寫愛。獨奏的旋律時而清楚浮現，時而融入合奏；聲音逐漸聚集，再回到安靜，形成作品的情緒起伏。",
    listeningNotes: [
      "獨奏出現時：分辨旋律與伴奏，聽兩者的音色有多接近。", "聲響變密時：追蹤獨奏，或改聽弦樂整體的強弱變化。", "安靜的段落：留意長音如何結束，以及下一句從哪裡接起。",
    ], source: "https://www.schott-music.com/en/vox-amoris-noc269204.html"),
  MusicalWork(
    id: "wieniawski-22", title: "Violin Concerto No. 2 in D minor", subtitle: "Op. 22",
    composerID: .wieniawski, catalogue: "Op. 22", form: "Violin concerto",
    invitation: "炫技與歌唱，在同一個樂句裡。",
    introduction: "長線條的旋律穿過和弦與快速音群，到了 Romance，音樂轉為舒展的歌唱。終樂章再次拉高張力。三個樂章展現不同性格，也考驗演奏者如何讓技巧始終服務於樂句。",
    listeningNotes: [
      "I. Allegro moderato：聽獨奏接過樂團旋律後，如何延長、裝飾樂句。", "II. Romance：留意音量漸弱時，旋律是否仍然向前。",
      "III. Allegro con fuoco：辨認快速音群中的主題，聽重音落在哪裡。",
    ], source: "https://konkurs.wieniawski.pl/uczestnicy/bohdan-luts/"),
  MusicalWork(
    id: "beethoven-61", title: "Violin Concerto in D major", subtitle: "Op. 61",
    composerID: .beethoven, catalogue: "Op. 61", form: "Violin concerto",
    invitation: "從定音鼓的幾個音開始。",
    introduction:
      "1806 年，Franz Clement 在 Wien 首演這部協奏曲。第一樂章以定音鼓的重複音開場，小提琴進場前，樂團已鋪陳出完整段落。獨奏接過這些材料，以旋律的延伸與裝飾，改變音樂的重心。",
    listeningNotes: [
      "I. Allegro ma non troppo：記住定音鼓的節奏，尋找它在其他聲部的回返。", "II. Larghetto：聽小提琴如何在樂團的長音上延伸旋律。",
      "III. Rondo：辨認反覆出現的主題，比較每次回來時的發音與重音。",
    ], source: "https://www.cedillerecords.org/albums/beethoven-and-clement-violin-concertos/"),
  MusicalWork(
    id: "bach-1004", title: "Ciaccona", subtitle: "Partita No. 2 in D minor", composerID: .bach,
    catalogue: "BWV 1004", form: "Solo violin", invitation: "一把小提琴，交替呈現旋律與低音。",
    introduction:
      "Ciaccona 是第二號無伴奏小提琴 Partita 的末樂章。開頭的和弦建立節奏與和聲，後面的音型不斷改變，低音的方向卻持續支撐音樂。演奏者要在四條弦之間，交代多個聲部的延續。",
    listeningNotes: [
      "開頭：聽和弦如何展開，哪個音最突出。", "快速音群：尋找低音落點，聽旋律如何從音群中浮現。", "色彩轉明後：比較明亮段落與開頭的音色，聽回到暗色時的變化。",
    ], source: "https://www.henle.de/media/0b/f7/bb/1697725652/1187-1697725652-sync.pdf"),
  MusicalWork(
    id: "vivaldi-297", title: "L’inverno", subtitle: "Le quattro stagioni", composerID: .vivaldi,
    catalogue: "RV 297 · Op. 8 No. 4", form: "Violin concerto", invitation: "短促的顫動，與一段溫暖的長音。",
    introduction:
      "L’inverno 以反覆的短音寫出寒冷的緊繃感。中間的 Largo 換成舒展旋律，背景仍維持細密節奏；終樂章再次加快，音群的移動帶來不穩定感。短音與長句的對比，是這首協奏曲最直接的聆聽線索。",
    listeningNotes: [
      "I. Allegro non molto：比較合奏與獨奏的短音，聽發音如何營造緊繃感。", "II. Largo：追蹤小提琴的長句，同時注意背景的規律節奏。",
      "III. Allegro：聽音群如何加速、停頓，再重新出發。",
    ],
    source:
      "https://www.breitkopf.com/work/9131/le-quattro-stagioni-die-vier-jahreszeiten-op.-8-4-rv-297"
  ),
  MusicalWork(
    id: "tchaikovsky-35", title: "Violin Concerto in D major", subtitle: "Op. 35",
    composerID: .tchaikovsky, catalogue: "Op. 35", form: "Violin concerto",
    invitation: "長句的歌唱，鮮明的舞蹈節奏。",
    introduction:
      "第一樂章的旋律不斷延伸，逐漸轉入更密集的音群；Canzonetta 讓音色與表情收斂，終樂章再以重音和速度拉開對比。比較演奏版本時，句尾的停留與短音的發音，往往比整體速度更容易辨認。",
    listeningNotes: [
      "I. Allegro moderato：記住獨奏主題，聽它再次出現時如何改變力度。", "II. Canzonetta：留意弱音的質地，以及句尾如何收束。",
      "III. Finale：聽重音與短音的長度，感受舞曲節奏的彈性。",
    ], source: "https://www.henle.de/Violin-Concerto-D-major-op.-35/HN-685"),
  MusicalWork(
    id: "paganini-24", title: "Capriccio No. 24", subtitle: "24 Capricci", composerID: .paganini,
    catalogue: "Op. 1 No. 24", form: "Solo violin", invitation: "一個主題，接連換上不同音型。",
    introduction: "第二十四號隨想曲以主題與變奏構成。雙音、快速音群與不同發音改變了音樂表面，主題的節奏輪廓仍然可辨。技巧在這裡既是挑戰，也是組織每一段音樂的方式。",
    listeningNotes: [
      "主題：記住節奏與句尾，作為後面變奏的參照。", "變奏之間：分辨每段改變了音型、發音，還是聲部配置。", "音符最密集時：聽樂句的終點是否清楚，而不只注意速度。",
    ], source: "https://www.henle.de/media/46/2e/5d/1690886055/0450-1690886055-sync.pdf"),
  MusicalWork(
    id: "mendelssohn-64", title: "Violin Concerto in E minor", subtitle: "Op. 64",
    composerID: .mendelssohn, catalogue: "Op. 64", form: "Violin concerto",
    invitation: "獨奏一開始，就唱出主題。",
    introduction:
      "小提琴在開頭直接進入旋律，樂團隨即承接，形成緊密的推進。慢樂章延長歌唱的線條，終樂章則換成輕巧、靈活的發音。三個樂章的連接也值得聽：前一段的收尾，同時準備了下一段的開始。",
    listeningNotes: [
      "I. Allegro molto appassionato：聽獨奏開場的長句，以及樂團如何接續。", "II. Andante：注意長音之間的連接，旋律在哪裡轉折。",
      "III. Allegretto non troppo – Allegro molto vivace：比較短音的長度，聽輕巧感如何形成。",
    ], source: "https://www.henle.de/us/Violin-Concerto-e-minor-op.-64/HN-720"),
  MusicalWork(
    id: "sibelius-47", title: "Violin Concerto in D minor", subtitle: "Op. 47",
    composerID: .sibelius, catalogue: "Op. 47", form: "Violin concerto",
    invitation: "弦樂的背景之上，一個獨奏聲音浮現。",
    introduction:
      "小提琴在細密的樂團背景上展開旋律，時而突出，時而被更厚的聲響包圍。慢樂章以寬廣長句累積張力，終樂章則由鮮明節奏帶動。獨奏與樂團之間的層次，是比較不同版本的好起點。",
    listeningNotes: [
      "I. Allegro moderato：聽開頭獨奏與背景的音量比例，再追蹤旋律向上延伸。", "II. Adagio di molto：留意旋律升高時，音色與力度如何一起變化。",
      "III. Allegro, ma non tanto：分開聽伴奏節奏與獨奏重音，辨認兩者如何交錯。",
    ], source: "https://www.schott-music.com/en/violin-concerto-in-d-minor-no353474.html"),
  MusicalWork(
    id: "franck-sonata", title: "Sonate pour piano et violon", subtitle: "La majeur",
    composerID: .franck, catalogue: "A major", form: "Violin & piano",
    invitation: "鋼琴與小提琴，共同延續一個動機。",
    introduction:
      "四個樂章透過相似的動機相互連接。鋼琴先提出的材料，可能在小提琴聲部重新出現；同樣的輪廓，也會因速度與和聲改變而換上另一種表情。到終樂章，兩件樂器以相互模仿的旋律接續前進。",
    listeningNotes: [
      "I. Allegretto ben moderato：記住鋼琴開場，再聽小提琴如何回應。",
      "III. Recitativo-Fantasia：注意自由的獨奏語氣，與鋼琴進入時的轉折。",
      "IV. Allegretto poco mosso：追蹤相互模仿的旋律，辨認誰先開始、誰接著進入。",
    ], source: "https://www.henle.de/us/Violin-Sonata-A-major/HN-1351"),
  MusicalWork(
    id: "brahms-108", title: "Sonate für Klavier und Violine Nr. 3", subtitle: "d-Moll · Op. 108",
    composerID: .brahms, catalogue: "Op. 108", form: "Violin & piano",
    invitation: "旋律下方，鋼琴仍在推動音樂。",
    introduction:
      "1888 年完成的 Op. 108，是 Brahms 三首小提琴奏鳴曲中唯一的小調作品，採四樂章安排。小提琴的長句下方，鋼琴以低音、和弦與內聲部持續推進。兩件樂器的重心分配，讓同一段音樂能呈現不同的張力。",
    listeningNotes: [
      "I. Allegro：追蹤小提琴長句下方的鋼琴，聽哪個聲部帶動下一拍。", "II. Adagio：留意旋律升高時，兩件樂器如何一起加強，再於句尾收回。",
      "IV. Presto agitato：辨認兩件樂器交接的短動機，聽重音如何推動樂句。",
    ], source: "https://www.henle.de/Violin-Sonata-d-minor-op.-108/HN-1570"),
]

let repertoire: [MusicalWork] = coreRepertoire + expandedRepertoire
