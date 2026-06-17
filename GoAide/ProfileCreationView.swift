import SwiftUI

struct ProfileCreationView: View {
    @State private var firstName = "Inès"
    @State private var lastName = "Dupont"
    @State private var birthDate = "17/04/1980"
    @State private var city = "Lyon"
    let onFinish: () -> Void

    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                Image(systemName: "person.crop.circle.badge.plus")
                    .font(.system(size: 78))
                    .foregroundStyle(GOAideColors.text)
                Text("Ajouter votre photo")
                    .font(.system(size: 13, weight: .semibold))
                LabeledTextField(label: "Prénom", text: $firstName)
                LabeledTextField(label: "Nom", text: $lastName)
                LabeledTextField(label: "Date de naissance", text: $birthDate)
                LabeledTextField(label: "Ville", text: $city)
                HStack(spacing: 12) {
                    Image(systemName: "checkmark.shield.fill")
                        .foregroundStyle(GOAideColors.brightBlue)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Vérification de votre identité")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Nous vous aidons à garder un espace de confiance.")
                            .font(.system(size: 12))
                            .foregroundStyle(GOAideColors.muted)
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(GOAideColors.muted)
                }
                .padding()
                .background(GOAideColors.card)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                PrimaryButton(title: "Continuer", action: onFinish)
            }
            .padding(24)
        }
        .background(GOAideColors.background)
        .navigationTitle("Création du profil")
        .navigationBarTitleDisplayMode(.inline)
    }
}
