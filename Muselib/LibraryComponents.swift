import SwiftUI

struct EditorialSection<Content: View>: View {
  let eyebrow: String
  let title: String
  @ViewBuilder let content: () -> Content

  var body: some View {
    VStack(alignment: .leading, spacing: 18) {
      Text(eyebrow).font(.caption.weight(.medium)).tracking(2)
        .foregroundStyle(.secondary)
      Text(title).font(.title2.weight(.medium))
      content()
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

struct ArchivePage<Content: View>: View {
  @ViewBuilder let content: () -> Content
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 28, content: content)
        .padding(24).frame(maxWidth: 680).frame(maxWidth: .infinity)
    }
  }
}

struct ArchiveSources: View {
  let sources: [ArchiveSource]
  var body: some View {
    DisclosureGroup("資料來源") {
      VStack(alignment: .leading, spacing: 14) {
        ForEach(sources) { source in
          if let url = URL(string: source.url) {
            Link(destination: url) {
              Label(source.title, systemImage: "arrow.up.right")
                .font(.footnote)
            }
          }
        }
      }
      .padding(.top, 10)
    }
  }
}
