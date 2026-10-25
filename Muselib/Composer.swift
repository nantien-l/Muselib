import Foundation

/// Stable identities keep work relationships independent of displayed spelling.
enum ComposerID: String, CaseIterable {
  case vasks, wieniawski, beethoven, bach, vivaldi, tchaikovsky
  case paganini, mendelssohn, sibelius, franck, brahms
  case ysaye, ravel, debussy, prokofiev, shostakovich, bartok, szymanowski, chausson, dvorak

  var name: String {
    switch self {
    case .vasks: "Pēteris Vasks"
    case .wieniawski: "Henryk Wieniawski"
    case .beethoven: "Ludwig van Beethoven"
    case .bach: "Johann Sebastian Bach"
    case .vivaldi: "Antonio Vivaldi"
    case .tchaikovsky: "Pyotr Ilyich Tchaikovsky"
    case .paganini: "Niccolò Paganini"
    case .mendelssohn: "Felix Mendelssohn"
    case .sibelius: "Jean Sibelius"
    case .franck: "César Franck"
    case .brahms: "Johannes Brahms"
    case .ysaye: "Eugène Ysaÿe"
    case .ravel: "Maurice Ravel"
    case .debussy: "Claude Debussy"
    case .prokofiev: "Sergei Prokofiev"
    case .shostakovich: "Dmitri Shostakovich"
    case .bartok: "Béla Bartók"
    case .szymanowski: "Karol Szymanowski"
    case .chausson: "Ernest Chausson"
    case .dvorak: "Antonín Dvořák"
    }
  }

  var profile: ComposerProfile? { composerProfiles.first { $0.id == self } }
}

struct ComposerProfile: Identifiable {
  let id: ComposerID
  let lifespan: String
  let places: String
  let invitation: String
  let introduction: String
  let chapters: [ComposerChapter]
  let milestones: [ComposerMilestone]
  let entryWorkID: MusicalWork.ID
  let sources: [ArchiveSource]

  var name: String { id.name }
  var imageName: String {
    id == .ysaye ? "portrait-eugene-ysaye" : "composer-\(id.rawValue)"
  }
  var works: [MusicalWork] { repertoire.filter { $0.composerID == id } }
  var entryWork: MusicalWork? { works.first { $0.id == entryWorkID } }
}

struct ComposerChapter: Identifiable {
  let id: String
  let title: String
  let text: String
}

struct ComposerMilestone: Identifiable {
  let id: String
  let date: String
  let title: String
  let detail: String
  let source: ArchiveSource
}
