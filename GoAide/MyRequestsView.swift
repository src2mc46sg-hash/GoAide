import SwiftUI

struct MyRequestsView: View {
    var body: some View {
        List {
            Section("En cours") {
                NavigationLink(destination: MyRequestDetailView(status: "En attente d'un bénévole")) {
                    RequestCard(title: "Courses au supermarché", person: "Moi", distance: "Aujourd'hui", urgency: "En attente", color: GOAideColors.orange)
                }
            }
            Section("Terminées") {
                NavigationLink(destination: MyRequestDetailView(status: "Terminée")) {
                    RequestCard(title: "Aide administrative", person: "Moi", distance: "Hier", urgency: "Terminée", color: GOAideColors.green)
                }
            }
        }
        .navigationTitle("Mes demandes")
    }
}

struct MyRequestDetailView: View {
    let status: String

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                InfoBlock(title: "Statut", text: status)
                InfoBlock(title: "Besoin", text: "J'ai besoin d'aide pour faire mes courses au supermarché cet après-midi.")
                InfoBlock(title: "Adresse", text: "23 rue de la République, 69001 Lyon")
                InfoBlock(title: "Réponse", text: "Marie D. peut vous aider.")
                NavigationLink(destination: ChatView()) {
                    Text("Ouvrir la conversation")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .foregroundStyle(.white)
                        .background(GOAideColors.brightBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                NavigationLink(destination: ReportView()) {
                    Text("Signaler un problème")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .foregroundStyle(GOAideColors.red)
                        .background(GOAideColors.card)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding(20)
        }
        .background(GOAideColors.background)
        .navigationTitle("Détail demande")
        .navigationBarTitleDisplayMode(.inline)
    }
}
