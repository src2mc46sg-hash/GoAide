import SwiftUI

struct AppointmentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                AppointmentRow(icon: "calendar", title: "Date", value: "Aujourd'hui")
                AppointmentRow(icon: "clock", title: "Heure", value: "15:30")
                AppointmentRow(icon: "mappin", title: "Point de rencontre", value: "Devant le supermarché")
                NavigationLink(destination: AppointmentSummaryView()) {
                    Text("Confirmer le rendez-vous")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .foregroundStyle(.white)
                        .background(GOAideColors.brightBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.top, 40)
            }
            .padding(20)
        }
        .background(GOAideColors.background)
        .navigationTitle("Organisation du rendez-vous")
        .navigationBarTitleDisplayMode(.inline)
    }
}
