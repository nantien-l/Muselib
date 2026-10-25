import SwiftUI

#if canImport(UIKit)
  import UIKit
#elseif canImport(AppKit)
  import AppKit
#endif

/// Asset names are shared by the app and PHOTO_ASSETS.md. Missing photographs
/// have a typographic fallback so incomplete image sets never produce blank UI.
struct ArchiveImage: View {
  enum Kind { case portrait, violin, bow }
  let name: String
  let label: String
  let kind: Kind
  var compact = false

  private var photograph: Image? {
    let assetName = compact && kind == .portrait ? name + "-thumbnail" : name
    return LibraryImages.image(named: assetName) ?? LibraryImages.image(named: name)
  }

  private var ratio: CGFloat { compact ? 1 : (kind == .portrait ? 4.0 / 3.0 : 3.0 / 2.0) }

  var body: some View {
    ZStack {
      Rectangle().fill(.quaternary.opacity(0.45))
      if let photograph {
        if kind == .portrait {
          Color.clear.overlay {
            photograph.resizable().scaledToFill()
          }
          .clipped()
        } else {
          photograph.resizable().scaledToFit().padding(compact ? 4 : 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
        }
      } else {
        VStack(spacing: 12) {
          Text(initials)
            .font(.system(compact ? .title3 : .largeTitle, design: .serif))
          if !compact {
            Text(label).font(.subheadline).multilineTextAlignment(.center)
            Text("PHOTOGRAPH FORTHCOMING")
              .font(.caption2).tracking(2).foregroundStyle(.secondary)
          }
        }
        .padding(compact ? 4 : 24)
      }
    }
    .aspectRatio(ratio, contentMode: .fit)
    .clipShape(RoundedRectangle(cornerRadius: 4))
    .accessibilityLabel(label)
  }

  private var initials: String {
    label.split(separator: " ").prefix(2).compactMap(\.first).map(String.init).joined()
  }
}

/// Local asset lookup is shared by portrait fallbacks and optional composer art.
enum LibraryImages {
  static func image(named name: String) -> Image? {
    #if canImport(UIKit)
      guard let image = UIImage(named: name) else { return nil }
      return Image(uiImage: image)
    #elseif canImport(AppKit)
      guard let image = NSImage(named: NSImage.Name(name)) else { return nil }
      return Image(nsImage: image)
    #else
      return nil
    #endif
  }
}
