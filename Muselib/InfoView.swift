import SwiftUI

struct InfoView: View {
    let violin: Violin

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("INSTRUMENT PROFILE")
                .font(.caption.weight(.semibold))
                .tracking(1.4)
                .foregroundStyle(.secondary)
                .padding(.bottom, 16)

            VStack(spacing: 0) {
                InfoRow(label: "Maker", value: violin.maker)
                Divider()
                InfoRow(label: "Year", value: violin.year)
            }
            .padding(.horizontal, 18)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 18))

            VStack(alignment: .leading, spacing: 10) {
                Text("Story")
                    .font(.headline)

                Text(violin.description)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.top, 22)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct InfoRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(label.uppercased())
                .font(.caption.weight(.semibold))
                .foregroundStyle(.secondary)
                .frame(width: 72, alignment: .leading)

            Text(value)
                .font(.body.weight(.medium))
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    InfoView(violin: violins[0])
        .padding()
}
