import SwiftUI

struct WorkDetailView: View {
  let work: MusicalWork
  var preferredPerformerID: String? = nil
  @AppStorage("savedWorkIDs") private var savedWorkIDs = ""
  private var savedIDs: Set<String> { Set(savedWorkIDs.split(separator: ",").map(String.init)) }

  var body: some View {
    WorkPage(
      work: work, isSaved: savedIDs.contains(work.id), preferredPerformerID: preferredPerformerID
    ) {
      var ids = savedIDs
      if ids.contains(work.id) { ids.remove(work.id) } else { ids.insert(work.id) }
      savedWorkIDs = ids.sorted().joined(separator: ",")
    }
    .navigationTitle("Repertoire")
  }
}
