import SwiftUI

struct AcceptMissionView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(systemName: "hands.clap.fill")
                    .font(.system(size: 72, weight: .bold))
                    .foregroundStyle(GOAideColors.orange)
                    .padding(.top, 80)
                Text("Vous êtes sur le point d'accepter cette mission")
                    .font(.system(size: 22, weight: .bold))
                    .multilineTextAlignment(.center)
                Text("Prenez le temps de lire les détails et assurez-vous d'être disponible.")
                    .font(.system(size: 14))
                    .foregroundStyle(GOAideColors.muted)
                    .multilineTextAlignment(.center)
                NavigationLink(destination: ChatView()) {
                    Text("Accepter la mission")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .foregroundStyle(.white)
                        .background(GOAideColors.brightBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.top, 80)
                SecondaryButton(title: "Annuler") {}
            }
            .padding(20)
        }
        .background(GOAideColors.background)
    }
}
