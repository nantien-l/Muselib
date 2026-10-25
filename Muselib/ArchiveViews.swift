import SwiftUI

struct PerformerRow: View {
  let performer: Performer

  var body: some View {
    HStack(spacing: 18) {
      ArchiveImage(name: performer.imageName, label: performer.name, kind: .portrait, compact: true)
        .frame(width: 72)
      VStack(alignment: .leading, spacing: 8) {
        Text(performer.name).font(.system(.title3, design: .serif))
        Text(performer.headline).font(.caption).foregroundStyle(.secondary)
      }
      Spacer(minLength: 0)
      Image(systemName: "chevron.right").font(.caption).foregroundStyle(.secondary)
    }
    .padding(.vertical, 6)
    .contentShape(Rectangle())
  }
}

struct PerformerPage: View {
  let performer: Performer

  var body: some View {
    ArchivePage {
      Text("THE PERFORMER").font(.caption).tracking(3).foregroundStyle(.secondary)
      Text(performer.name).font(.system(.largeTitle, design: .serif))
      Text(performer.headline).foregroundStyle(.secondary)
      if LibraryImages.image(named: performer.imageName) != nil {
        ArchiveImage(name: performer.imageName, label: performer.name, kind: .portrait)
      }
      EditorialSection(eyebrow: "LIFE & MUSIC", title: "關於演奏家") {
        Text(performer.biography).lineSpacing(7)
      }
      equipmentSection(kind: .violin, eyebrow: "VIOLIN", title: "小提琴")
      equipmentSection(kind: .bow, eyebrow: "BOW", title: "琴弓")
      EditorialSection(eyebrow: "REPERTOIRE", title: "作品") {
        ForEach(performer.works) { work in
          NavigationLink {
            WorkDetailView(work: work, preferredPerformerID: performer.id)
          } label: {
            VStack(alignment: .leading, spacing: 6) {
              WorkRow(work: work)
              if !work.versions.contains(where: { $0.performerID == performer.id }) {
                Text("題獻與歷史關聯").font(.caption).foregroundStyle(.secondary)
              }
            }
          }
          Divider()
        }
      }
      ArchiveSources(sources: performer.sources)
    }
    .navigationTitle(performer.name)
  }

  @ViewBuilder
  private func equipmentSection(kind: Equipment.Kind, eyebrow: String, title: String) -> some View {
    let items = performer.equipment.filter { $0.kind == kind }
    if !items.isEmpty {
      EditorialSection(eyebrow: eyebrow, title: title) {
        ForEach(items) { item in
          NavigationLink {
            EquipmentPage(equipment: item)
          } label: {
            HStack(alignment: .top, spacing: 16) {
              ArchiveImage(
                name: item.imageName, label: item.name, kind: kind == .violin ? .violin : .bow,
                compact: true
              )
              .frame(width: 72)
              VStack(alignment: .leading, spacing: 6) {
                Text(item.name).font(.system(.headline, design: .serif))
                Text(item.maker).font(.subheadline)
                if let date = item.date {
                  Text(date).font(.caption).foregroundStyle(.secondary)
                }
              }
              Spacer(minLength: 0)
              Image(systemName: "chevron.right").font(.caption)
            }
            .padding(.vertical, 8)
          }
          .buttonStyle(.plain)
          Divider()
        }
      }
    }
  }
}

struct EquipmentPage: View {
  let equipment: Equipment

  var body: some View {
    ArchivePage {
      Text(equipment.kind.rawValue.uppercased()).font(.caption).tracking(3).foregroundStyle(
        .secondary)
      Text(equipment.name).font(.system(.largeTitle, design: .serif))
      if LibraryImages.image(named: equipment.imageName) != nil {
        ArchiveImage(
          name: equipment.imageName, label: equipment.name,
          kind: equipment.kind == .violin ? .violin : .bow)
      }
      if ["lord-dunn-raven", "ysaye"].contains(equipment.id) {
        Text("琴身細節").font(.caption).foregroundStyle(.secondary)
      }
      if equipment.id == "auer-heifetz" {
        Text("弓頭與弓根細節").font(.caption).foregroundStyle(.secondary)
      } else if equipment.id == "ysaye-stern-tourte" {
        Text("弓頭細節").font(.caption).foregroundStyle(.secondary)
      }
      VStack(alignment: .leading, spacing: 12) {
        LabeledContent("Maker", value: equipment.maker)
        if let date = equipment.date {
          Divider()
          LabeledContent("Date / Record", value: date)
        }
      }
      EditorialSection(eyebrow: "THE STORY", title: "使用與流傳") {
        Text(equipment.story).lineSpacing(7)
      }
      EditorialSection(eyebrow: "CONNECTED LIVES", title: "相關演奏家") {
        ForEach(equipment.performers) { person in
          NavigationLink {
            PerformerPage(performer: person)
          } label: {
            PerformerRow(performer: person)
          }.buttonStyle(.plain)
        }
      }
      if equipment.sources.isEmpty {
        Text("使用關係由專案提供，尚未附公開來源。")
          .font(.footnote).foregroundStyle(.secondary)
      } else {
        ArchiveSources(sources: equipment.sources)
      }
    }
    .navigationTitle(equipment.kind.rawValue)
  }
}
