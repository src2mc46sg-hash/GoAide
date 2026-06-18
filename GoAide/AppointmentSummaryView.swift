import SwiftUI

struct AppointmentSummaryView: View {
    @Environment(\.returnToHome) private var returnToHome

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                AppointmentRow(icon: "calendar", title: "Date", value: "Aujourd'hui")
                AppointmentRow(icon: "clock", title: "Heure", value: "15:30")
                AppointmentRow(icon: "mappin", title: "Lieu", value: "Supermarché Centre-ville")
                PrimaryButton(title: "Confirmer le rendez-vous") {
                    returnToHome()
                }
                    .padding(.top, 40)
            }
            .padding(20)
        }
        .background(GOAideColors.background)
        .navigationTitle("Récapitulatif")
        .navigationBarTitleDisplayMode(.inline)
    }
}
