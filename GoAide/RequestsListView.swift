import SwiftUI

struct RequestsListView: View {
    var body: some View {
        List {
            NavigationLink(destination: RequestDetailView()) {
                RequestCard(title: "Aide pour courses", person: "Alix", distance: "450 m", urgency: "Urgent", color: GOAideColors.red)
            }
            NavigationLink(destination: RequestDetailView()) {
                RequestCard(title: "Aide pour courrier", person: "Marie", distance: "800 m", urgency: "Normal", color: GOAideColors.brightBlue)
            }
            NavigationLink(destination: RequestDetailView()) {
                RequestCard(title: "Promenade accompagnée", person: "Kola", distance: "1,1 km", urgency: "Normal", color: GOAideColors.green)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Demandes autour de vous")
    }
}
