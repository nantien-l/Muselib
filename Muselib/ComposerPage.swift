import SwiftUI

struct ComposerPage: View {
  let composer: ComposerProfile

  var body: some View {
    ArchivePage {
      header

      EditorialSection(eyebrow: "LIFE & MUSIC", title: "人生與創作") {
        ForEach(composer.chapters) { chapter in
          VStack(alignment: .leading, spacing: 10) {
            Text(chapter.title).font(.headline)
            Text(chapter.text).lineSpacing(7)
          }
          .padding(.bottom, 8)
        }
      }

      EditorialSection(eyebrow: "TIMELINE", title: "重要年份") {
        ForEach(composer.milestones) { milestone in
          ComposerMilestoneRow(milestone: milestone)
        }
      }

      EditorialSection(eyebrow: "WORKS", title: "作品") {
        ForEach(orderedWorks) { work in
          NavigationLink {
            WorkDetailView(work: work)
          } label: {
            VStack(alignment: .leading, spacing: 8) {
              if orderedWorks.count > 1 && work.id == composer.entryWorkID {
                Text("從這首開始").font(.caption).foregroundStyle(.secondary)
              }
              WorkRow(work: work, showsComposer: false)
            }
          }
          .buttonStyle(.plain)
          Divider()
        }
      }

      ArchiveSources(sources: composer.sources)
    }
    .navigationTitle(composer.name)
  }

  private var orderedWorks: [MusicalWork] {
    let entry = composer.entryWork.map { [$0] } ?? []
    return entry + composer.works.filter { $0.id != composer.entryWorkID }
  }

  private var header: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("THE COMPOSER")
        .font(.caption.weight(.medium)).tracking(3)
        .foregroundStyle(.secondary)
      Text(composer.name).font(.system(.largeTitle, design: .serif))
      Text(composer.lifespan).font(.title3).monospacedDigit()
        .foregroundStyle(.secondary)
      Text(composer.places).font(.subheadline).foregroundStyle(.secondary)
      if LibraryImages.image(named: composer.imageName) != nil {
        ArchiveImage(name: composer.imageName, label: composer.name, kind: .portrait)
      }
      Divider()
      Text(composer.invitation).font(.system(.title2, design: .serif))
        .fixedSize(horizontal: false, vertical: true)
      Text(composer.introduction).lineSpacing(7)
    }
    .padding(24)
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(.quaternary.opacity(0.35), in: RoundedRectangle(cornerRadius: 4))
  }
}

struct ComposerRow: View {
  let composer: ComposerProfile

  var body: some View {
    HStack(spacing: 16) {
      ArchiveImage(name: composer.imageName, label: composer.name, kind: .portrait, compact: true)
        .frame(width: 64)
      VStack(alignment: .leading, spacing: 8) {
        Text(composer.name).font(.system(.title3, design: .serif))
        Text("\(composer.lifespan) · \(composer.works.count) 首已收錄作品")
          .font(.caption).foregroundStyle(.secondary)
      }
      Spacer(minLength: 0)
      Image(systemName: "arrow.up.right").font(.caption).foregroundStyle(.secondary)
    }
    .padding(.vertical, 10)
    .contentShape(Rectangle())
  }
}

/// Names stay plain when their full editorial profile has not been published.
struct ComposerNameLink: View {
  let composerID: ComposerID

  var body: some View {
    Group {
      if let composer = composerID.profile {
        NavigationLink {
          ComposerPage(composer: composer)
        } label: {
          HStack(alignment: .firstTextBaseline, spacing: 8) {
            Text(composer.name.uppercased()).tracking(2)
            Image(systemName: "arrow.up.right")
          }
        }
        .buttonStyle(.plain)
        .accessibilityHint("認識作曲家與已收錄作品")
      } else {
        Text(composerID.name.uppercased()).tracking(2)
      }
    }
    .font(.caption.weight(.medium))
    .foregroundStyle(.secondary)
  }
}

private struct ComposerMilestoneRow: View {
  let milestone: ComposerMilestone

  var body: some View {
    HStack(alignment: .top, spacing: 18) {
      VStack(spacing: 8) {
        Circle().fill(.secondary).frame(width: 7, height: 7)
        Rectangle().fill(.quaternary).frame(width: 1)
      }
      .padding(.top, 6)
      .accessibilityHidden(true)

      VStack(alignment: .leading, spacing: 10) {
        Text(milestone.date).font(.system(.subheadline, design: .monospaced))
          .foregroundStyle(.secondary)
        Text(milestone.title).font(.headline)
        Text(milestone.detail).lineSpacing(5)
        if let url = URL(string: milestone.source.url) {
          Link("資料來源", destination: url)
            .font(.caption)
            .accessibilityLabel("\(milestone.title)的資料來源")
        }
      }
      .padding(.bottom, 24)
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .fixedSize(horizontal: false, vertical: true)
  }
}

#Preview {
  NavigationStack {
    ComposerPage(composer: composerProfiles[0])
  }
}
