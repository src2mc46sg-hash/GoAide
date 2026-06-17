import SwiftUI

struct EditProfileView: View {
    @State private var firstName = "Inès"
    @State private var lastName = "Dupont"
    @State private var city = "Lyon"

    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 82))
                    .foregroundStyle(GOAideColors.brightBlue)
                SecondaryButton(title: "Changer la photo") {}
                LabeledTextField(label: "Prénom", text: $firstName)
                LabeledTextField(label: "Nom", text: $lastName)
                LabeledTextField(label: "Ville", text: $city)
                PrimaryButton(title: "Enregistrer") {}
            }
            .padding(20)
        }
        .background(GOAideColors.background)
        .navigationTitle("Modifier le profil")
        .navigationBarTitleDisplayMode(.inline)
    }
}
