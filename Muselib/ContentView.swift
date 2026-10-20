import SwiftUI

struct ContentView: View {
    @State private var selectedViolinIndex = 0

    private var selectedViolin: Violin {
        violins[selectedViolinIndex]
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    VStack(spacing: 16) {
                        Image(systemName: "music.note")
                            .font(.system(size: 72, weight: .light))
                            .foregroundStyle(.blue)
                            .frame(width: 210, height: 280)
                            .background(.gray.opacity(0.18))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .accessibilityHidden(true)

                        Text(selectedViolin.name)
                            .font(.largeTitle.weight(.semibold))
                            .multilineTextAlignment(.center)
                    }

                    InfoView(violin: selectedViolin)

                    Button("介紹另一把琴") {
                        selectedViolinIndex = Int.random(in: violins.indices)
                    }
                    .buttonStyle(.glass)
                }
                .padding()
            }
            .navigationTitle("名琴介紹")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
