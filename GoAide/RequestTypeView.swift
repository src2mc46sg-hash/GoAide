import SwiftUI

struct RequestTypeView: View {
    @Binding var isConnected: Bool

    var body: some View {
        List {
            NavigationLink(destination: RequestDescriptionView(isConnected: $isConnected)) {
                CategoryRow(icon: "basket.fill", title: "Courses", color: GOAideColors.brightBlue)
            }
            NavigationLink(destination: RequestDescriptionView(isConnected: $isConnected)) {
                CategoryRow(icon: "person.2.fill", title: "Compagnie", color: GOAideColors.purple)
            }
            NavigationLink(destination: RequestDescriptionView(isConnected: $isConnected)) {
                CategoryRow(icon: "message.fill", title: "Discussion", color: GOAideColors.green)
            }
            NavigationLink(destination: RequestDescriptionView(isConnected: $isConnected)) {
                CategoryRow(icon: "laptopcomputer", title: "Aide numérique", color: GOAideColors.orange)
            }
            NavigationLink(destination: RequestDescriptionView(isConnected: $isConnected)) {
                CategoryRow(icon: "doc.text.fill", title: "Aide administrative", color: GOAideColors.brightBlue)
            }
            NavigationLink(destination: RequestDescriptionView(isConnected: $isConnected)) {
                CategoryRow(icon: "car.fill", title: "Transport", color: GOAideColors.red)
            }
            NavigationLink(destination: RequestDescriptionView(isConnected: $isConnected)) {
                CategoryRow(icon: "heart.fill", title: "Activités solidaires", color: GOAideColors.green)
            }
            NavigationLink(destination: RequestDescriptionView(isConnected: $isConnected)) {
                CategoryRow(icon: "ellipsis.circle.fill", title: "Autre", color: GOAideColors.muted)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Que souhaitez-vous demander ?")
        .navigationBarTitleDisplayMode(.inline)
    }
}
