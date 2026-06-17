import SwiftUI

struct PrivacyView: View {
    @State private var shareLocation = true
    @State private var showProfile = true

    var body: some View {
        Form {
            Toggle("Partager ma localisation pendant une demande", isOn: $shareLocation)
            Toggle("Afficher mon profil aux bénévoles", isOn: $showProfile)
        }
        .navigationTitle("Confidentialité")
    }
}
