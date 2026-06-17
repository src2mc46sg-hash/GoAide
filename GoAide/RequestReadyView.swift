import SwiftUI

struct RequestReadyView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 22) {
                Image(systemName: "paperplane.fill")
                    .font(.system(size: 76, weight: .bold))
                    .foregroundStyle(GOAideColors.brightBlue)
                    .padding(.top, 80)
                Text("Votre demande est prête !")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                Text("Les bénévoles autour de vous ont été notifiés.")
                    .font(.system(size: 14))
                    .foregroundStyle(GOAideColors.muted)
                    .multilineTextAlignment(.center)
                Button {
                    dismiss()
                } label: {
                    Text("Retour à l'accueil")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .foregroundStyle(.white)
                        .background(GOAideColors.brightBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.top, 80)
            }
            .padding(20)
        }
        .background(GOAideColors.background)
        .navigationTitle("Validation")
        .navigationBarTitleDisplayMode(.inline)
    }
}
