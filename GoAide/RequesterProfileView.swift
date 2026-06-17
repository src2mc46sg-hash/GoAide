import SwiftUI

struct RequesterProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 82))
                    .foregroundStyle(GOAideColors.brightBlue)
                Text("Marie D.")
                    .font(.system(size: 24, weight: .bold))
                Text("82 ans · Lyon")
                    .foregroundStyle(GOAideColors.muted)
                HStack(spacing: 10) {
                    StatBox(value: "12", label: "Demandes")
                    StatBox(value: "6", label: "Aides reçues")
                }
                InfoBlock(title: "À propos", text: "Personne âgée vivant seule. Aime parler et jardiner.")
                InfoBlock(title: "Préférences", text: "Courses, accompagnement, discussion.")
                NavigationLink(destination: AcceptMissionView()) {
                    Text("Continuer")
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
        .navigationTitle("Profil")
        .navigationBarTitleDisplayMode(.inline)
    }
}
