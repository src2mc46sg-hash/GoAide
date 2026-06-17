import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            Section {
                NavigationLink("Compte", destination: EditProfileView())
                NavigationLink("Confidentialité", destination: PrivacyView())
                NavigationLink("Accessibilité", destination: AccessibilitySettingsView())
                NavigationLink("Sécurité", destination: SafetyCenterView())
            }
            Section {
                NavigationLink("Informations légales", destination: Text("Informations légales"))
                NavigationLink("Conditions d'utilisation", destination: Text("Conditions d'utilisation"))
            }
            Button(role: .destructive) {
            } label: {
                Text("Déconnexion")
            }
        }
        .navigationTitle("Paramètres")
    }
}
