import SwiftUI

/// The artwork identifies a work, independent of its currently selected performer.
struct WorkCover: View {
  let work: MusicalWork
  private var ink: Color {
    switch work.composerID {
    case .vasks, .sibelius: Color(red: 0.22, green: 0.39, blue: 0.36)
    case .beethoven, .brahms, .bach: Color(red: 0.43, green: 0.30, blue: 0.23)
    case .franck, .tchaikovsky: Color(red: 0.37, green: 0.32, blue: 0.49)
    default: Color(red: 0.28, green: 0.37, blue: 0.47)
    }
  }
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      Rectangle().fill(ink).frame(width: 18, height: 2)
      Spacer(minLength: 0)
      Text(work.catalogue).font(.system(size: 11, weight: .medium, design: .serif))
        .lineLimit(3).minimumScaleFactor(0.8)
      Text("MUSELIB").font(.system(size: 5, weight: .medium)).tracking(1)
    }
    .padding(9)
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    .foregroundStyle(ink)
    .background(Color(red: 0.93, green: 0.90, blue: 0.83))
    .overlay(alignment: .leading) { Rectangle().fill(ink.opacity(0.2)).frame(width: 3) }
    .clipShape(RoundedRectangle(cornerRadius: 2))
    .accessibilityHidden(true)
  }
}
