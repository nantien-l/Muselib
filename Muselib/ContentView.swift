import SwiftUI

struct ContentView: View {
  @State private var selection: LibrarySection? = .discover

  var body: some View {
    #if os(iOS)
      NavigationStack {
        List {
          NavigationLink(value: LibrarySection.discover) {
            Label("Discover", systemImage: LibrarySection.discover.symbol)
          }
          Section("LIBRARY") {
            ForEach([LibrarySection.repertoire, .composers, .violinists]) { section in
              NavigationLink(value: section) {
                Label(section.rawValue, systemImage: section.symbol)
              }
            }
          }
          Section("YOUR COLLECTION") {
            NavigationLink(value: LibrarySection.saved) {
              Label("Saved", systemImage: LibrarySection.saved.symbol)
            }
          }
        }
        .navigationTitle("Muselib")
        .navigationDestination(for: LibrarySection.self) { section in
          destination(for: section)
        }
      }
    #else
    NavigationSplitView {
      List(selection: $selection) {
        Label("Discover", systemImage: LibrarySection.discover.symbol)
          .tag(LibrarySection.discover)
        Section("LIBRARY") {
          ForEach([LibrarySection.repertoire, .composers, .violinists]) { section in
            Label(section.rawValue, systemImage: section.symbol).tag(section)
          }
        }
        Section("YOUR COLLECTION") {
          Label("Saved", systemImage: LibrarySection.saved.symbol).tag(LibrarySection.saved)
        }
      }
      .navigationTitle("Muselib")
      .navigationSplitViewColumnWidth(min: 200, ideal: 230)
    } detail: {
      NavigationStack {
        destination(for: selection ?? .discover)
      }
    }
    #endif
  }

  @ViewBuilder
  private func destination(for section: LibrarySection) -> some View {
    if section == .discover {
      ListeningRoom()
    } else {
      WorkLibrary(section: section)
    }
  }
}

#Preview { ContentView() }
