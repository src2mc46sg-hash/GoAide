import SwiftUI

struct AssociationDetailView: View {
    let name: String

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Image(systemName: "cross.case.fill")
                    .font(.system(size: 72, weight: .bold))
                    .foregroundStyle(GOAideColors.red)
                Text(name)
                    .font(.system(size: 24, weight: .bold))
                InfoBlock(title: "Adresse", text: "12 rue Nationale, Lyon")
                InfoBlock(title: "À propos", text: "Association locale proposant écoute, orientation et aide matérielle.")
                InfoBlock(title: "Actions proposées", text: "Courses solidaires, accompagnement, démarches administratives.")
                NavigationLink(destination: MapView()) {
                    Text("Voir les itinéraires")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .foregroundStyle(.white)
                        .background(GOAideColors.brightBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding(20)
        }
        .background(GOAideColors.background)
        .navigationTitle("Détail association")
        .navigationBarTitleDisplayMode(.inline)
    }
}
