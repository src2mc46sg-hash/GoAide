import SwiftUI

struct SOSStartView: View {
    @Binding var isConnected: Bool

    var body: some View {
        ScrollView {
            VStack(spacing: 22) {
                Circle()
                    .fill(GOAideColors.green)
                    .frame(width: 132, height: 132)
                    .overlay(
                        Text("SOS")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundStyle(.white)
                    )
                    .padding(.top, 80)
                Text("J'ai besoin d'aide")
                    .font(.system(size: 22, weight: .bold))
                Text("Répondez à quelques questions, on s'occupe du reste.")
                    .font(.system(size: 14))
                    .foregroundStyle(GOAideColors.muted)
                    .multilineTextAlignment(.center)
                NavigationLink(destination: SOSFormView(isConnected: $isConnected)) {
                    Text("Commencer")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .foregroundStyle(.white)
                        .background(GOAideColors.green)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.top, 80)
            }
            .padding(20)
        }
        .background(GOAideColors.background)
        .navigationTitle("SOS Social")
        .navigationBarTitleDisplayMode(.inline)
    }
}
