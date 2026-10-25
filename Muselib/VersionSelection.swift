import SwiftUI

struct VersionSelection: View {
  let work: MusicalWork
  let selectedVersion: PerformanceVersion
  let onSelect: (PerformanceVersion) -> Void

  var body: some View {
    VStack(alignment: .leading, spacing: 18) {
      Divider()
      HStack(alignment: .firstTextBaseline) {
        Text("演奏版本").font(.caption).tracking(2).foregroundStyle(.secondary)
        Spacer()
        if work.versions.count > 1 {
          Text("\(work.versions.count) 個版本").font(.caption).foregroundStyle(.secondary)
        }
      }
      VStack(alignment: .leading, spacing: 8) {
        NavigationLink {
          PerformerPage(performer: selectedVersion.performer)
        } label: {
          HStack(spacing: 8) {
            Text(selectedVersion.performer.name).font(.system(.title2, design: .serif))
            Image(systemName: "arrow.up.right").font(.caption)
          }
        }
        .buttonStyle(.plain)
        Text(selectedVersion.title).font(.subheadline)
        if !selectedVersion.collaborators.isEmpty {
          Text(selectedVersion.collaborators).font(.subheadline).foregroundStyle(.secondary)
        }
        HStack {
          Text(selectedVersion.kind.rawValue)
          if let year = selectedVersion.year { Text(String(year)) }
        }
        .font(.caption).foregroundStyle(.secondary)
      }
      if work.canChangePerformer {
        Button {
          if let next = work.randomVersion(excludingPerformerID: selectedVersion.performerID) {
            onSelect(next)
          }
        } label: {
          Label("換個人聽這首", systemImage: "arrow.triangle.2.circlepath")
        }
        .buttonStyle(.bordered)
        .accessibilityHint("保留曲目，隨機選擇另一位演奏家")
      }
      if let playback = selectedVersion.playback {
        Link(destination: playback.url) {
          Label("觀看比賽演出", systemImage: "play.rectangle.fill")
            .frame(maxWidth: .infinity)
            .padding(.vertical, 6)
        }
        .buttonStyle(.borderedProminent)
        .accessibilityHint(
          playback.startTimeLabel.map { "在 YouTube 從 \($0) 開始" } ?? "開啟這場演出的官方個人影片")
        Text("\(playback.publisher) · YouTube")
          .font(.caption).foregroundStyle(.secondary)
        if let time = playback.startTimeLabel {
          Text("從 \(time) 開始")
            .font(.footnote).foregroundStyle(.secondary)
        }
      } else if let broadcast = selectedVersion.broadcast, let url = URL(string: broadcast.url) {
        Link(destination: url) {
          Label("觀看演出轉播", systemImage: "play.rectangle")
        }
        .buttonStyle(.borderedProminent)
        Text(broadcast.title).font(.caption).foregroundStyle(.secondary)
        Text("完整場次，請自行選擇曲目段落；平台可能需要登入。")
          .font(.footnote).foregroundStyle(.secondary)
      } else {
        Link(destination: selectedVersion.searchURL) {
          Label("在 Apple Music 搜尋此版本", systemImage: "magnifyingglass")
        }
        .font(.subheadline)
        Text("依演奏家與合作音樂家核對搜尋結果。")
          .font(.footnote).foregroundStyle(.secondary)
      }
      Link(destination: URL(string: selectedVersion.source.url)!) {
        Label("版本資料", systemImage: "arrow.up.right")
      }
      .font(.subheadline)

      if work.versions.count > 1 {
        DisclosureGroup("挑選演奏版本") {
          VStack(alignment: .leading, spacing: 0) {
            ForEach(work.versions) { version in
              Button {
                onSelect(version)
              } label: {
                HStack(alignment: .top, spacing: 12) {
                  ArchiveImage(
                    name: version.performer.imageName, label: version.performer.name,
                    kind: .portrait, compact: true
                  )
                  .frame(width: 48)
                  VStack(alignment: .leading, spacing: 5) {
                    Text(version.performer.name).font(.subheadline.weight(.medium))
                    Text(version.title).font(.caption).foregroundStyle(.secondary)
                    if version.playback != nil {
                      Label("官方演出影片", systemImage: "play.rectangle")
                        .font(.caption).foregroundStyle(.secondary)
                    }
                    if !version.collaborators.isEmpty {
                      Text(version.collaborators).font(.caption).foregroundStyle(.secondary)
                    }
                  }
                  Spacer(minLength: 0)
                  if version.id == selectedVersion.id {
                    Image(systemName: "checkmark").accessibilityLabel("已選取")
                  }
                }
                .padding(.vertical, 12)
                .contentShape(Rectangle())
              }
              .buttonStyle(.plain)
              .accessibilityAddTraits(version.id == selectedVersion.id ? [.isSelected] : [])
              Divider()
            }
          }
        }
        .font(.subheadline)
      }
    }
  }
}
