import SwiftUI

struct SOSResultView: View {
    let need: String
    let urgency: String
    let situation: String
    let mobility: String
    let location: String
    let contact: String
    let isConnected: Bool

    @State private var showAuth = false
    @State private var canCreateRequest = false
    @State private var tempConnected = true

    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                Text("Proposition adaptée")
                    .font(.system(size: 22, weight: .bold))
                    .multilineTextAlignment(.center)

                Text("GO'AIDE vous propose le parcours le plus adapté à vos réponses.")
                    .font(.system(size: 14))
                    .foregroundStyle(GOAideColors.muted)
                    .multilineTextAlignment(.center)

                Image(systemName: resultIcon())
                    .font(.system(size: 74, weight: .bold))
                    .foregroundStyle(resultColor())
                    .padding(.top, 22)

                Text(resultTitle())
                    .font(.system(size: 20, weight: .bold))

                Text(resultDescription())
                    .font(.system(size: 14))
                    .foregroundStyle(GOAideColors.muted)
                    .multilineTextAlignment(.center)

                VStack(spacing: 10) {
                    InfoLine(title: "Besoin", value: need)
                    InfoLine(title: "Urgence", value: urgency)
                    InfoLine(title: "Lieu", value: location)
                    InfoLine(title: "Contact", value: contact)
                }
                .padding(.top, 12)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Ce que l'application va faire")
                        .font(.system(size: 16, weight: .bold))

                    Text(resultAction())
                        .font(.system(size: 14))
                        .foregroundStyle(GOAideColors.text)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
                .background(GOAideColors.card)
                .clipShape(RoundedRectangle(cornerRadius: 8))

                Button {
                    if isConnected {
                        canCreateRequest = true
                    } else {
                        showAuth = true
                    }
                } label: {
                    Text(isConnected ? "Créer cette demande" : "Se connecter pour créer la demande")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .foregroundStyle(.white)
                        .background(GOAideColors.green)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.top, 24)

                NavigationLink(
                    destination: RequestDescriptionView(
                        isConnected: $tempConnected,
                        sosNeed: need,
                        sosUrgency: urgency,
                        sosSituation: situation,
                        sosMobility: mobility,
                        sosLocation: location,
                        sosContact: contact
                    ),
                    isActive: $canCreateRequest
                ) {
                    EmptyView()
                }
            }
            .padding(20)
        }
        .background(GOAideColors.background)
        .navigationDestination(isPresented: $showAuth) {
            AuthView {
                canCreateRequest = true
            }
        }
    }

    func resultTitle() -> String {
        if need == "Courses ou produits essentiels" {
            return "Demande de courses"
        } else if need == "Médicaments ou pharmacie" {
            return "Aide pharmacie"
        } else if need == "Transport urgent" {
            return "Transport accompagné"
        } else if need == "Compagnie / présence" {
            return "Présence solidaire"
        } else if need == "Aide administrative" {
            return "Aide administrative"
        } else if need == "Aide numérique" {
            return "Aide numérique"
        } else if need == "Contacter une association" {
            return "Mise en relation avec une association"
        } else {
            return "Demande d'aide générale"
        }
    }

    func resultDescription() -> String {
        var text = ""

        if urgency == "Maintenant" {
            text = "Votre besoin semble urgent. La demande sera mise en avant pour trouver une aide rapidement."
        } else if urgency == "Aujourd'hui" {
            text = "Votre demande sera proposée en priorité aux personnes disponibles aujourd'hui."
        } else {
            text = "Votre demande peut être organisée avec un peu plus de temps."
        }

        if mobility == "Non, j'ai besoin qu'on vienne à moi" {
            text += " Comme vous ne pouvez pas vous déplacer, l'aide sera orientée vers votre lieu."
        }

        if situation == "Je réponds pour quelqu'un d'autre" {
            text += " Vous pourrez préciser les informations de la personne concernée."
        }

        return text
    }

    func resultAction() -> String {
        if need == "Médicaments ou pharmacie" {
            return "On va créer une demande claire avec la pharmacie, le niveau d'urgence et le moyen de contact choisi."
        } else if need == "Transport urgent" {
            return "On va préparer une demande de transport avec le lieu de départ, le lieu d'arrivée et l'urgence."
        } else if need == "Compagnie / présence" {
            return "On va chercher une personne disponible pour discuter, passer voir la personne ou proposer une présence rassurante."
        } else if need == "Aide administrative" {
            return "On va orienter la demande vers une personne ou une association capable d'aider avec les démarches."
        } else if need == "Aide numérique" {
            return "On va créer une demande pour être aidé avec un téléphone, un ordinateur ou une démarche en ligne."
        } else if need == "Contacter une association" {
            return "On va proposer les associations proches qui correspondent à votre situation."
        } else {
            return "On va transformer vos réponses en demande simple, puis la publier aux bénévoles proches."
        }
    }

    func resultIcon() -> String {
        if need == "Courses ou produits essentiels" {
            return "basket.fill"
        } else if need == "Médicaments ou pharmacie" {
            return "cross.case.fill"
        } else if need == "Transport urgent" {
            return "car.fill"
        } else if need == "Compagnie / présence" {
            return "person.2.fill"
        } else if need == "Aide administrative" {
            return "doc.text.fill"
        } else if need == "Aide numérique" {
            return "laptopcomputer"
        } else if need == "Contacter une association" {
            return "building.2.fill"
        } else {
            return "heart.fill"
        }
    }

    func resultColor() -> Color {
        if urgency == "Maintenant" {
            return GOAideColors.red
        } else if urgency == "Aujourd'hui" {
            return GOAideColors.orange
        } else {
            return GOAideColors.green
        }
    }
}

struct InfoLine: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(GOAideColors.muted)
            Spacer()
            Text(value)
                .font(.system(size: 13, weight: .medium))
                .multilineTextAlignment(.trailing)
        }
        .padding(12)
        .background(GOAideColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
