import SwiftUI

struct RequestDetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                HStack(spacing: 12) {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 54))
                        .foregroundStyle(GOAideColors.brightBlue)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Alix")
                            .font(.system(size: 20, weight: .bold))
                        Text("À 450 m de vous")
                            .font(.system(size: 13))
                            .foregroundStyle(GOAideColors.muted)
                    }
                    Spacer()
                    Text("Urgent")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(GOAideColors.red)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(GOAideColors.red.opacity(0.12))
                        .clipShape(Capsule())
                }
                InfoBlock(title: "Besoin", text: "J'ai besoin d'aide pour faire les courses au supermarché cet après-midi.")
                InfoBlock(title: "Adresse", text: "23 rue de la République, 69001 Lyon")
                NavigationLink(destination: RequesterProfileView()) {
                    CategoryRow(icon: "person.fill", title: "Voir le profil demandeur")
                }
                NavigationLink(destination: AcceptMissionView()) {
                    Text("Je peux aider")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .foregroundStyle(.white)
                        .background(GOAideColors.brightBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding(20)
        }
        .background(GOAideColors.background)
        .navigationTitle("Détail de la demande")
        .navigationBarTitleDisplayMode(.inline)
    }
}
