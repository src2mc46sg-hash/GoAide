import SwiftUI

struct AssociationsView: View {
    var body: some View {
        List {
            TextField("Rechercher une association", text: .constant(""))
                .padding(10)
                .background(GOAideColors.background)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            NavigationLink(destination: AssociationDetailView(name: "Secours Populaire")) {
                AssociationRow(name: "Secours Populaire", distance: "0,7 km", color: GOAideColors.red)
            }
            NavigationLink(destination: AssociationDetailView(name: "Croix-Rouge française")) {
                AssociationRow(name: "Croix-Rouge française", distance: "1,2 km", color: GOAideColors.red)
            }
            NavigationLink(destination: AssociationDetailView(name: "Emmaüs")) {
                AssociationRow(name: "Emmaüs", distance: "2,0 km", color: GOAideColors.blue)
            }
        }
        .navigationTitle("Associations")
    }
}
