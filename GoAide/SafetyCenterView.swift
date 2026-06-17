import SwiftUI

struct SafetyCenterView: View {
    var body: some View {
        List {
            NavigationLink("Signaler un problème", destination: ReportView())
            NavigationLink("Contacts de confiance", destination: Text("Contacts de confiance"))
            NavigationLink("Conseils de sécurité", destination: Text("Conseils de sécurité"))
        }
        .navigationTitle("Sécurité")
    }
}
