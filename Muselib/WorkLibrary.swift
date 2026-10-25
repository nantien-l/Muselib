import SwiftUI

/// Collections share work rows and the same detail destinations across the app.
struct WorkLibrary: View {
  let section: LibrarySection
  @AppStorage("savedWorkIDs") private var savedWorkIDs = ""
  @State private var query = ""

  private var savedIDs: Set<String> {
    Set(savedWorkIDs.split(separator: ",").map(String.init))
  }
  private func matches(_ text: String) -> Bool {
    query.isEmpty || text.localizedStandardContains(query)
  }
  private var works: [MusicalWork] {
    repertoire.filter {
      (section != .saved || savedIDs.contains($0.id))
        && matches("\($0.title) \($0.composer) \($0.catalogue)")
    }
  }

  var body: some View {
    List {
      Section {
        Text(description).font(.subheadline).foregroundStyle(.secondary)
          .padding(.vertical, 8)
      }
      switch section {
      case .composers:
        ForEach(composerProfiles.filter { matches($0.name) }) { composer in
          NavigationLink {
            ComposerPage(composer: composer)
          } label: {
            ComposerRow(composer: composer)
          }
        }
      case .violinists:
        ForEach(artists.filter { matches($0.name) }) { performer in
          NavigationLink {
            PerformerPage(performer: performer)
          } label: {
            PerformerRow(performer: performer)
          }
        }
      default:
        ForEach(works) { work in
          NavigationLink {
            WorkDetailView(work: work)
          } label: {
            WorkRow(work: work)
          }
        }
        if works.isEmpty {
          ContentUnavailableView(
            section == .saved && query.isEmpty ? "尚未收藏曲目" : "找不到曲目",
            systemImage: section == .saved ? "bookmark" : "magnifyingglass",
            description: Text("在曲目頁收藏作品，或試試其他搜尋文字。"))
        }
      }
    }
    .searchable(text: $query, prompt: "搜尋 \(section.rawValue)")
    .navigationTitle(section.rawValue)
  }

  private var description: String {
    switch section {
    case .composers: "\(composerProfiles.count) 位作曲家"
    case .violinists: "\(artists.count) 位演奏家"
    case .saved: "收藏的作品"
    default: "\(repertoire.count) 首作品 · \(performanceVersions.count) 個演奏版本"
    }
  }
}
