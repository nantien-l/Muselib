import Foundation

struct PerformanceVersion: Identifiable {
    enum Kind: String { case recording = "錄音版本", concert = "現場演出", competition = "比賽演出" }
    let id: String
    let workID: MusicalWork.ID
    let performerID: Performer.ID
    let title: String
    let collaborators: String
    let kind: Kind
    // Year is only populated for documented performance/recording dates, not reissue dates.
    var year: Int? = nil
    var playback: PerformancePlayback? = nil
    var broadcast: ArchiveSource? = nil
    let source: ArchiveSource

    var performer: Performer { artists.first { $0.id == performerID }! }
    var work: MusicalWork { repertoire.first { $0.id == workID }! }
    var searchURL: URL {
        var url = URLComponents(string: "https://music.apple.com/search")!
        url.queryItems = [URLQueryItem(name: "term", value: "\(work.composer) \(work.title) \(work.catalogue) \(performer.name) \(collaborators)")]
        return url.url!
    }
}

extension MusicalWork {
    var versions: [PerformanceVersion] { performanceVersions.filter { $0.workID == id } }
    var canChangePerformer: Bool { Set(versions.map(\.performerID)).count > 1 }

    func randomVersion(excludingPerformerID: String? = nil) -> PerformanceVersion? {
        let alternatives = versions.filter { $0.performerID != excludingPerformerID }
        return alternatives.randomElement() ?? versions.randomElement()
    }
}

// Each entry identifies an existing release or documented performance.
// Historical dedicatees and instrument ownership are kept out of this array.
let performanceVersions: [PerformanceVersion] = [
    PerformanceVersion(id: "lee-bach-wieniawski-2026", workID: "bach-1004", performerID: "soobeen-lee", title: "Wieniawski Competition · Stage I", collaborators: "Solo violin", kind: .competition, year: 2026, broadcast: ArchiveSource(title: "Wieniawski Society · 個人演出影片（含其他曲目）", url: "https://konkurs.wieniawski.pl/multimedia/soobeen-lee-stage-1-17th-henryk-wieniawski-international-violin-competition/"), source: ArchiveSource(title: "Wieniawski · SooBeen Lee", url: "https://konkurs.wieniawski.pl/uczestnicy/soobeen-lee/")),
    PerformanceVersion(id: "lee-sibelius-wieniawski-2026", workID: "sibelius-47", performerID: "soobeen-lee", title: "Wieniawski Competition · Stage IV", collaborators: "Poznań Philharmonic Orchestra · Łukasz Borowicz", kind: .competition, year: 2026, broadcast: ArchiveSource(title: "medici.tv · 21 October 2026 整場轉播", url: "https://www.medici.tv/en/concerts/henryk-wieniawski-international-violin-competition-2026-semi-final-2"), source: ArchiveSource(title: "Wieniawski · SooBeen Lee", url: "https://konkurs.wieniawski.pl/uczestnicy/soobeen-lee/")),
    PerformanceVersion(id: "im-brahms-wieniawski-2026", workID: "brahms-77", performerID: "anna-im", title: "Wieniawski Competition · Stage IV", collaborators: "Poznań Philharmonic Orchestra · Łukasz Borowicz", kind: .competition, year: 2026, broadcast: ArchiveSource(title: "medici.tv · 20 October 2026 整場轉播", url: "https://www.medici.tv/en/concerts/henryk-wieniawski-international-violin-competition-2026-semi-final-1"), source: ArchiveSource(title: "Wieniawski · Anna Im", url: "https://konkurs.wieniawski.pl/uczestnicy/anna-im/")),
    PerformanceVersion(id: "choi-vasks-wieniawski-2026", workID: "vasks-vox-amoris", performerID: "jooha-choi", title: "Wieniawski Competition · Stage III", collaborators: "Amadeus Polish Radio Chamber Orchestra · Anna Duczmal-Mróz", kind: .competition, year: 2026, playback: PerformancePlayback(videoID: "04orGXsS9fo", publisher: "Wieniawski Society"), source: ArchiveSource(title: "Wieniawski · Jooha Choi", url: "https://konkurs.wieniawski.pl/uczestnicy/jooha-choi/")),
    PerformanceVersion(id: "luts-wieniawski-final-2026", workID: "wieniawski-22", performerID: "bohdan-luts", title: "Wieniawski Competition · Final", collaborators: "Poznań Philharmonic Orchestra · Łukasz Borowicz", kind: .competition, year: 2026, playback: PerformancePlayback(videoID: "DM6RfJsZcF4", publisher: "Wieniawski Society"), source: ArchiveSource(title: "Wieniawski · Bohdan Luts", url: "https://konkurs.wieniawski.pl/uczestnicy/bohdan-luts/")),
    PerformanceVersion(id: "kang-beethoven-lg-2022", workID: "beethoven-61", performerID: "clara-jumi-kang", title: "LG Arts Center · Opening Festival", collaborators: "Deutsche Kammerphilharmonie Bremen · Paavo Järvi", kind: .concert, year: 2022, source: ArchiveSource(title: "LG Arts Center · Concert programme", url: "https://www.lgart.com/down/Display/202211/2022_LG_Arts_Center_SEOUL_Opening_Festival_brochure_1110.pdf")),
    PerformanceVersion(id: "perlman-beethoven-giulini", workID: "beethoven-61", performerID: "itzhak-perlman", title: "Beethoven: Violin Concerto", collaborators: "Philharmonia Orchestra · Carlo Maria Giulini", kind: .recording, source: ArchiveSource(title: "Warner Classics · Beethoven", url: "https://www.warnerclassics.com/release/itzhak-perlman-beethoven-concerto")),
    PerformanceVersion(id: "ferras-beethoven-karajan", workID: "beethoven-61", performerID: "christian-ferras", title: "Beethoven: Violin Concerto", collaborators: "Berliner Philharmoniker · Herbert von Karajan", kind: .recording, year: 1967, source: ArchiveSource(title: "Deutsche Grammophon · Beethoven", url: "https://www.deutschegrammophon.com/en/catalogue/products/beethoven-violinkonzert-ferraskarajan-1818")),
    PerformanceVersion(id: "oistrakh-beethoven-cluytens", workID: "beethoven-61", performerID: "david-oistrakh", title: "Beethoven: Violin Concerto", collaborators: "Orchestre National de la Radiodiffusion Française · André Cluytens", kind: .recording, source: ArchiveSource(title: "Warner Classics · Beethoven", url: "https://www.warnerclassics.com/de/release/beethoven-violin-concerto-oistrakh")),
    PerformanceVersion(id: "heifetz-beethoven-naxos", workID: "beethoven-61", performerID: "jascha-heifetz", title: "Beethoven & Brahms: Violin Concertos · Naxos Historical", collaborators: "", kind: .recording, source: ArchiveSource(title: "Naxos · Catalogue 8.110936", url: "https://www.naxos.com/SharedFiles/pdf/rear/8.110936r.pdf")),
    PerformanceVersion(id: "heifetz-bach-sony", workID: "bach-1004", performerID: "jascha-heifetz", title: "Bach · Solo violin", collaborators: "Solo violin", kind: .recording, source: ArchiveSource(title: "Sony Classical · Heifetz catalogue", url: "https://www.sonyclassical.com/artists/artist-products/jascha-heifetz")),
    PerformanceVersion(id: "mutter-vivaldi-trondheim", workID: "vivaldi-297", performerID: "anne-sophie-mutter", title: "Vivaldi: The Four Seasons", collaborators: "Trondheim Soloists", kind: .recording, source: ArchiveSource(title: "Deutsche Grammophon · Mutter discography", url: "https://www.deutschegrammophon.com/en/artists/annesophiemutter")),
    PerformanceVersion(id: "perlman-vivaldi-warner", workID: "vivaldi-297", performerID: "itzhak-perlman", title: "Vivaldi: The Four Seasons & Violin Concertos", collaborators: "", kind: .recording, source: ArchiveSource(title: "Warner Classics · Vivaldi", url: "https://www.warnerclassics.com/release/vivaldi-four-seasons-violin-concertos")),
    PerformanceVersion(id: "perlman-tchaikovsky-warner", workID: "tchaikovsky-35", performerID: "itzhak-perlman", title: "Tchaikovsky: Violin Concerto · Warner Edition", collaborators: "", kind: .recording, source: ArchiveSource(title: "Warner Classics · Perlman edition", url: "https://www.warnerclassics.com/sites/default/files/2025-05/Itzhak%20Perlman%20Edition.pdf")),
    PerformanceVersion(id: "ferras-tchaikovsky-karajan", workID: "tchaikovsky-35", performerID: "christian-ferras", title: "Tchaikovsky · With Herbert von Karajan", collaborators: "Berliner Philharmoniker · Herbert von Karajan", kind: .recording, source: ArchiveSource(title: "Karajan · Christian Ferras recordings", url: "https://karajan.org/stories/karajan-artists-christian-ferras/")),
    PerformanceVersion(id: "perlman-paganini-warner", workID: "paganini-24", performerID: "itzhak-perlman", title: "Paganini: 24 Caprices", collaborators: "Solo violin", kind: .recording, source: ArchiveSource(title: "Warner Classics · 24 Caprices", url: "https://www.warnerclassics.com/release/paganini-24-caprices")),
    PerformanceVersion(id: "stern-mendelssohn-sony", workID: "mendelssohn-64", performerID: "isaac-stern", title: "Mendelssohn · The Complete Columbia Analogue Recordings", collaborators: "", kind: .recording, source: ArchiveSource(title: "Sony Classical · Isaac Stern", url: "https://www.sonyclassical.de/alben/releases-details/isaac-stern-the-complete-columbia-analogue-recordings")),
    PerformanceVersion(id: "mutter-mendelssohn-dg", workID: "mendelssohn-64", performerID: "anne-sophie-mutter", title: "Mendelssohn · 2009 album", collaborators: "", kind: .recording, source: ArchiveSource(title: "Deutsche Grammophon · Mutter discography", url: "https://www.deutschegrammophon.com/en/artists/annesophiemutter")),
    PerformanceVersion(id: "heifetz-mendelssohn-sony", workID: "mendelssohn-64", performerID: "jascha-heifetz", title: "Beethoven & Mendelssohn: Violin Concertos", collaborators: "", kind: .recording, source: ArchiveSource(title: "Sony Classical · Heifetz catalogue", url: "https://www.sonyclassical.com/releases/releases-details/beethoven-violin-concerto-mendelssohn-violin-concerto")),
    PerformanceVersion(id: "ferras-sibelius-karajan", workID: "sibelius-47", performerID: "christian-ferras", title: "Sibelius: Violin Concerto", collaborators: "Berliner Philharmoniker · Herbert von Karajan", kind: .recording, year: 1965, source: ArchiveSource(title: "Deutsche Grammophon · Sibelius", url: "https://www.deutschegrammophon.com/en/catalogue/products/sibelius-violinkonzert-ferraskarajan-5415")),
    PerformanceVersion(id: "perlman-sibelius-previn", workID: "sibelius-47", performerID: "itzhak-perlman", title: "Sibelius: Violin Concerto / Sinding: Suite", collaborators: "André Previn", kind: .recording, source: ArchiveSource(title: "Warner Classics · Sibelius", url: "https://www.warnerclassics.com/release/sibelius-violin-concerto-sinding-suite-violin-and-orchestra")),
    PerformanceVersion(id: "heifetz-franck-naxos", workID: "franck-sonata", performerID: "jascha-heifetz", title: "Beethoven, Brahms & Franck: Violin Sonatas", collaborators: "", kind: .recording, source: ArchiveSource(title: "Naxos Historical · Heifetz", url: "https://www.naxos.com/CatalogueDetail/?id=8.110990")),
    PerformanceVersion(id: "choi-franck-wieniawski-2026", workID: "franck-sonata", performerID: "jooha-choi", title: "Wieniawski Competition · Stage II", collaborators: "Michał Francuz", kind: .competition, year: 2026, playback: PerformancePlayback(videoID: "niwjtMOO1zw", publisher: "Wieniawski Society", startSeconds: 1105), source: ArchiveSource(title: "Wieniawski · Jooha Choi", url: "https://konkurs.wieniawski.pl/uczestnicy/jooha-choi/")),
    PerformanceVersion(id: "mutter-franck-weissenberg", workID: "franck-sonata", performerID: "anne-sophie-mutter", title: "Brahms & Franck: Violin Sonatas", collaborators: "Alexis Weissenberg", kind: .recording, source: ArchiveSource(title: "Warner Classics · Brahms & Franck", url: "https://www.warnerclassics.com/release/brahms-franck-violin-sonatas")),
    PerformanceVersion(id: "oistrakh-brahms-108", workID: "brahms-108", performerID: "david-oistrakh", title: "David Oistrakh plays Brahms Violin Sonatas", collaborators: "Frida Bauer", kind: .concert, year: 1966, source: ArchiveSource(title: "Brahms · Album booklet", url: "https://eclassical.textalk.se/shop/17115/art76/5088676-eae0e9-3149028139570.pdf")),
    PerformanceVersion(id: "mutter-brahms-orkis", workID: "brahms-108", performerID: "anne-sophie-mutter", title: "Brahms: The Violin Sonatas", collaborators: "Lambert Orkis", kind: .recording, source: ArchiveSource(title: "Deutsche Grammophon · Brahms sonatas", url: "https://www.deutschegrammophon.com/de/katalog/produkte/brahms-violin-sonatas-mutter-blu-ray-6561")),
    PerformanceVersion(id: "heifetz-brahms-naxos", workID: "brahms-108", performerID: "jascha-heifetz", title: "Beethoven, Brahms & Franck: Violin Sonatas", collaborators: "", kind: .recording, source: ArchiveSource(title: "Naxos Historical · Heifetz", url: "https://www.naxos.com/CatalogueDetail/?id=8.110990"))
]
