import SwiftUI

struct WorkRow: View {
  let work: MusicalWork
  var showsComposer = true

  var body: some View {
    HStack(spacing: 16) {
      WorkCover(work: work)
        .frame(width: 64, height: 80)
      VStack(alignment: .leading, spacing: 8) {
        Text(work.title).font(.system(.headline, design: .serif))
        Text(showsComposer ? "\(work.composer) · \(work.catalogue)" : work.catalogue)
          .font(.caption).foregroundStyle(.secondary)
        Text("\(work.versions.count) 個演奏版本")
          .font(.caption).foregroundStyle(.secondary)
      }
      Spacer(minLength: 0)
    }
    .padding(.vertical, 8)
    .contentShape(Rectangle())
  }
}
