import SwiftUI

struct ReportView: View {
    @Environment(\.returnToHome) private var returnToHome
    @State private var reason = "Comportement inapproprié"
    @State private var details = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ScreenHeader(title: "Signalement", subtitle: "Votre sécurité est prioritaire.")
                PickerField(title: "Raison", value: $reason, options: ["Comportement inapproprié", "Absence au rendez-vous", "Message inquiétant", "Autre"])
                TextEditor(text: $details)
                    .frame(height: 170)
                    .padding(10)
                    .background(GOAideColors.card)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                PrimaryButton(title: "Envoyer le signalement", color: GOAideColors.red) {
                    returnToHome()
                }
            }
            .padding(20)
        }
        .background(GOAideColors.background)
        .navigationTitle("Sécurité")
        .navigationBarTitleDisplayMode(.inline)
    }
}
