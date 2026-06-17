import SwiftUI

struct SOSFormView: View {
    @Binding var isConnected: Bool
    @State private var need = "Courses ou produits essentiels"
    @State private var urgency = "Aujourd'hui"
    @State private var situation = "Je suis seul(e)"
    @State private var mobility = "Je peux me déplacer difficilement"
    @State private var location = "À mon domicile"
    @State private var contact = "Message dans l'application"

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ScreenHeader(
                    title: "Répondez simplement",
                    subtitle: "Choisissez les réponses qui correspondent le mieux à votre situation."
                )

                PickerField(
                    title: "Quel est votre besoin principal ?",
                    value: $need,
                    options: [
                        "Courses ou produits essentiels",
                        "Médicaments ou pharmacie",
                        "Transport urgent",
                        "Compagnie / présence",
                        "Aide administrative",
                        "Aide numérique",
                        "Contacter une association",
                        "Je ne sais pas"
                    ]
                )

                PickerField(
                    title: "À quel point est-ce urgent ?",
                    value: $urgency,
                    options: [
                        "Maintenant",
                        "Aujourd'hui",
                        "Demain",
                        "Cette semaine",
                        "Ce n'est pas urgent"
                    ]
                )

                PickerField(
                    title: "Quelle est votre situation ?",
                    value: $situation,
                    options: [
                        "Je suis seul(e)",
                        "Je suis avec un proche",
                        "Je suis avec un enfant",
                        "Je suis une personne âgée",
                        "Je suis en situation de handicap",
                        "Je réponds pour quelqu'un d'autre"
                    ]
                )

                PickerField(
                    title: "Pouvez-vous vous déplacer ?",
                    value: $mobility,
                    options: [
                        "Oui, facilement",
                        "Oui, mais difficilement",
                        "Non, j'ai besoin qu'on vienne à moi",
                        "Je ne sais pas"
                    ]
                )

                PickerField(
                    title: "Où avez-vous besoin d'aide ?",
                    value: $location,
                    options: [
                        "À mon domicile",
                        "Dans mon quartier",
                        "Dans un commerce",
                        "À la pharmacie",
                        "À la mairie / administration",
                        "Dans les transports",
                        "Autre lieu"
                    ]
                )

                PickerField(
                    title: "Comment souhaitez-vous être contacté(e) ?",
                    value: $contact,
                    options: [
                        "Message dans l'application",
                        "Appel téléphonique",
                        "SMS",
                        "Contact par une association",
                        "Peu importe"
                    ]
                )

                NavigationLink(
                    destination: SOSResultView(
                        need: need,
                        urgency: urgency,
                        situation: situation,
                        mobility: mobility,
                        location: location,
                        contact: contact,
                        isConnected: isConnected
                    )
                ) {
                    Text("Continuer")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .foregroundStyle(.white)
                        .background(GOAideColors.green)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.top, 24)
            }
            .padding(20)
        }
        .background(GOAideColors.background)
        .navigationTitle("SOS")
        .navigationBarTitleDisplayMode(.inline)
    }
}
