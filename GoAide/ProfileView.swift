import SwiftUI

struct ProfileView: View {
    var body: some View {
        List {
            HStack(spacing: 14) {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 58))
                    .foregroundStyle(GOAideColors.brightBlue)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Inès")
                        .font(.system(size: 22, weight: .bold))
                    Text("Membre vérifié")
                        .font(.system(size: 13))
                        .foregroundStyle(GOAideColors.muted)
                }
            }
            Section("Mes espaces") {
                NavigationLink("Mes demandes", destination: MyRequestsView())
                NavigationLink("Mes missions", destination: MyMissionsView())
                NavigationLink("Mes favoris", destination: AssociationsView())
            }
            Section("Compte") {
                NavigationLink("Modifier mon profil", destination: EditProfileView())
                NavigationLink("Notifications", destination: NotificationsView())
                NavigationLink("Paramètres", destination: SettingsView())
            }
        }
        .navigationTitle("Profil")
    }
}
