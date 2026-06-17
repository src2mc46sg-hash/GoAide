import SwiftUI

struct RequestDescriptionView: View {
    @Binding var isConnected: Bool
    @State private var mainNeed: String
    @State private var details: String

    init(
        isConnected: Binding<Bool>,
        sosNeed: String? = nil,
        sosUrgency: String? = nil,
        sosSituation: String? = nil,
        sosMobility: String? = nil,
        sosLocation: String? = nil,
        sosContact: String? = nil
    ) {
        _isConnected = isConnected
        _mainNeed = State(initialValue: RequestDescriptionView.mainText(
            need: sosNeed,
            urgency: sosUrgency,
            location: sosLocation
        ))
        _details = State(initialValue: RequestDescriptionView.detailText(
            need: sosNeed,
            situation: sosSituation,
            mobility: sosMobility,
            contact: sosContact
        ))
    }

    var body: some View {
        VStack(spacing: 16) {
            Text("Vous pouvez modifier le texte avant de continuer.")
                .font(.system(size: 13))
                .foregroundStyle(GOAideColors.muted)
                .frame(maxWidth: .infinity, alignment: .leading)

            TextEditor(text: $mainNeed)
                .frame(height: 130)
                .padding(10)
                .background(GOAideColors.card)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            TextEditor(text: $details)
                .frame(height: 150)
                .padding(10)
                .background(GOAideColors.card)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            Spacer()
            NavigationLink(destination: RequestLocationView(isConnected: $isConnected)) {
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
        .background(GOAideColors.background)
        .navigationTitle("Décrivez votre besoin")
        .navigationBarTitleDisplayMode(.inline)
    }

    static func mainText(need: String?, urgency: String?, location: String?) -> String {
        guard let need else {
            return "J'ai besoin d'aide pour faire mes courses au supermarché cet après-midi"
        }

        var text = "J'ai besoin d'aide"

        if need == "Courses ou produits essentiels" {
            text = "J'ai besoin d'aide pour récupérer des courses ou des produits essentiels"
        } else if need == "Médicaments ou pharmacie" {
            text = "J'ai besoin d'aide pour récupérer des médicaments ou aller à la pharmacie"
        } else if need == "Transport urgent" {
            text = "J'ai besoin d'aide pour un déplacement important"
        } else if need == "Compagnie / présence" {
            text = "J'ai besoin d'une présence ou d'une personne avec qui échanger"
        } else if need == "Aide administrative" {
            text = "J'ai besoin d'aide pour une démarche administrative"
        } else if need == "Aide numérique" {
            text = "J'ai besoin d'aide avec un téléphone, un ordinateur ou une démarche en ligne"
        } else if need == "Contacter une association" {
            text = "J'ai besoin d'être orienté vers une association adaptée"
        }

        if let location {
            text += " \(location.lowercased())"
        }

        if let urgency {
            text += ". Urgence : \(urgency.lowercased())."
        }

        return text
    }

    static func detailText(need: String?, situation: String?, mobility: String?, contact: String?) -> String {
        guard let need else {
            return "Je ne peux pas porter de charges lourdes."
        }

        var text = ""

        if let situation {
            text += "Situation : \(situation). "
        }

        if let mobility {
            text += "Déplacement : \(mobility). "
        }

        if need == "Courses ou produits essentiels" {
            text += "Il faudrait une aide pour récupérer quelques produits et les déposer au bon endroit."
        } else if need == "Médicaments ou pharmacie" {
            text += "Il faudrait une aide pour aller à la pharmacie ou récupérer un traitement."
        } else if need == "Transport urgent" {
            text += "Il faudrait une personne disponible pour accompagner ou aider au trajet."
        } else if need == "Compagnie / présence" {
            text += "Il faudrait une présence rassurante, un échange ou une visite."
        } else if need == "Aide administrative" {
            text += "Il faudrait une aide pour comprendre ou remplir une démarche."
        } else if need == "Aide numérique" {
            text += "Il faudrait une aide pour utiliser un appareil ou faire une démarche en ligne."
        } else if need == "Contacter une association" {
            text += "Il faudrait être orienté vers une structure proche et adaptée."
        } else {
            text += "Il faudrait une aide adaptée à la situation."
        }

        if let contact {
            text += " Contact souhaité : \(contact.lowercased())."
        }

        return text
    }
}
