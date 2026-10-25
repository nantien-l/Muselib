import SwiftUI

struct WorkPage: View {
  let work: MusicalWork
  let isSaved: Bool
  let onSave: () -> Void
  @State private var selectedVersionID: String?

  init(
    work: MusicalWork, isSaved: Bool, preferredPerformerID: String? = nil,
    onSave: @escaping () -> Void
  ) {
    self.work = work
    self.isSaved = isSaved
    self.onSave = onSave
    let preferred = work.versions.filter { $0.performerID == preferredPerformerID }
    _selectedVersionID = State(
      initialValue: (preferred.randomElement() ?? work.randomVersion())?.id)
  }

  private var selectedVersion: PerformanceVersion? {
    work.versions.first { $0.id == selectedVersionID } ?? work.versions.first
  }

  var body: some View {
    ScrollViewReader { proxy in
      ScrollView {
        VStack(alignment: .leading, spacing: 32) {
          Color.clear.frame(height: 0).id("top")
          VStack(alignment: .leading, spacing: 20) {
            HStack {
              Text("THE LISTENING ROOM")
                .font(.caption.weight(.medium)).tracking(3)
              Spacer()
              Button(action: onSave) {
                Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                  .padding(10)
              }
              .accessibilityLabel(isSaved ? "取消收藏" : "收藏曲目")
            }
            .foregroundStyle(.secondary)

            ComposerNameLink(composerID: work.composerID)
            Text(work.title)
              .font(.system(.largeTitle, design: .serif))
              .fixedSize(horizontal: false, vertical: true)
            Text(work.subtitle)
              .font(.title3).foregroundStyle(.secondary)
            Divider().padding(.vertical, 8)
            Text(work.invitation)
              .font(.title3).lineSpacing(5)
            HStack(alignment: .firstTextBaseline) {
              Text(work.form)
              Spacer()
              if !work.subtitle.contains(work.catalogue) { Text(work.catalogue) }
            }
            .font(.caption).foregroundStyle(.secondary)
          }
          .padding(24)
          .background(.quaternary.opacity(0.35), in: RoundedRectangle(cornerRadius: 4))

          EditorialSection(
            eyebrow: "THE WORK", title: work.versions.isEmpty ? "作品介紹" : "作品與演奏") {
            Text(work.introduction).lineSpacing(7)
            if let version = selectedVersion {
              if LibraryImages.image(named: version.performer.imageName) != nil {
                ArchiveImage(
                  name: version.performer.imageName, label: version.performer.name, kind: .portrait)
              }
              VersionSelection(work: work, selectedVersion: version) { selectedVersionID = $0.id }
            }
          }

          EditorialSection(eyebrow: "LISTEN CLOSER", title: "聆聽線索") {
            ForEach(Array(work.listeningNotes.enumerated()), id: \.offset) { index, note in
              HStack(alignment: .top, spacing: 16) {
                Text(String(format: "%02d", index + 1))
                  .font(.system(.caption, design: .monospaced))
                  .foregroundStyle(.secondary)
                  .padding(.top, 4)
                Text(note).lineSpacing(5)
              }
              if index < work.listeningNotes.count - 1 { Divider() }
            }
          }

          if let composer = work.composerProfile {
            EditorialSection(eyebrow: "THE COMPOSER", title: "作曲家") {
              NavigationLink {
                ComposerPage(composer: composer)
              } label: {
                ComposerRow(composer: composer)
              }
              .buttonStyle(.plain)
            }
          }

          if !work.performers.isEmpty {
            EditorialSection(
              eyebrow: "CONNECTIONS", title: "繼續探索"
            ) {
              NavigationLink {
                ConnectionsView(work: work)
              } label: {
                HStack {
                  VStack(alignment: .leading, spacing: 6) {
                    Text("演奏家與作品關聯")
                    Text(work.performers.map(\.name).joined(separator: " · "))
                      .font(.caption).foregroundStyle(.secondary)
                  }
                  Spacer()
                  Image(systemName: "arrow.right")
                }
                .padding(.vertical, 12)
              }
            }
          }

          Link(destination: URL(string: work.source)!) {
            Label("作品資料參考", systemImage: "text.book.closed")
              .font(.caption)
          }
          .foregroundStyle(.secondary)
        }
        .frame(maxWidth: 680, alignment: .leading)
        .padding(.horizontal, 24)
        .padding(.bottom, 32)
        .frame(maxWidth: .infinity)
      }
      .onChange(of: work.id) { _, _ in proxy.scrollTo("top", anchor: .top) }
    }
  }
}

private struct ConnectionsView: View {
  let work: MusicalWork

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 28) {
        Text(work.title).font(.system(.title, design: .serif))
        Text("演奏版本與題獻人物")
          .foregroundStyle(.secondary)
        ForEach(work.performers) { performer in
          NavigationLink {
            PerformerPage(performer: performer)
          } label: {
            VStack(alignment: .leading, spacing: 8) {
              PerformerRow(performer: performer)
              if !work.versions.contains(where: { $0.performerID == performer.id }) {
                Text("作品歷史關聯").font(.caption).foregroundStyle(.secondary)
              }
            }
          }
          .buttonStyle(.plain)
          Divider()
        }
      }
      .padding(24).frame(maxWidth: 680).frame(maxWidth: .infinity)
    }
    .navigationTitle("Connections")
  }
}
