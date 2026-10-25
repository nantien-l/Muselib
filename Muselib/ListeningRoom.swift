import SwiftUI

struct ListeningRoom: View {
  @Environment(\.colorScheme) private var colorScheme
  @State private var selectedWork = repertoire.randomElement()!
  @AppStorage("savedWorkIDs") private var savedWorkIDs = ""

  private var savedIDs: Set<String> {
    Set(savedWorkIDs.split(separator: ",").map(String.init))
  }

  var body: some View {
    WorkPage(work: selectedWork, isSaved: savedIDs.contains(selectedWork.id)) {
      toggleSaved(selectedWork)
    }
    .id(selectedWork.id)
    .safeAreaInset(edge: .bottom) {
      Button {
        let alternatives = repertoire.filter { $0.id != selectedWork.id }
        if let next = alternatives.randomElement() {
          selectedWork = next
        }
      } label: {
        Label("探索另一首", systemImage: "shuffle")
          .frame(maxWidth: 560)
          .padding(.vertical, 8)
      }
      .buttonStyle(.borderedProminent)
      // Set both sides of the contrast pair; the prominent style otherwise
      // keeps a light label when the dark appearance turns .primary light.
      .tint(colorScheme == .dark ? .white : .black)
      .foregroundStyle(colorScheme == .dark ? Color.black : Color.white)
      .padding()
      .background(.bar)
    }
    .navigationTitle("Discover")
  }

  private func toggleSaved(_ work: MusicalWork) {
    var updated = savedIDs
    if updated.contains(work.id) { updated.remove(work.id) } else { updated.insert(work.id) }
    savedWorkIDs = updated.sorted().joined(separator: ",")
  }
}

#Preview("Light") {
  ListeningRoom().preferredColorScheme(.light)
}

#Preview("Dark") {
  ListeningRoom().preferredColorScheme(.dark)
}
