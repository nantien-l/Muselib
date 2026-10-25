import Foundation

/// One stable top-level destination; each collection owns its navigation history.
enum LibrarySection: String, CaseIterable, Identifiable {
  case discover = "Discover"
  case repertoire = "Repertoire"
  case composers = "Composers"
  case violinists = "Violinists"
  case saved = "Saved"
  var id: Self { self }
  var symbol: String {
    switch self {
    case .discover: "shuffle"
    case .repertoire: "music.note.list"
    case .composers: "pencil.and.outline"
    case .violinists: "person.2"
    case .saved: "bookmark"
    }
  }
}
