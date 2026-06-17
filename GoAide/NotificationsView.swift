import SwiftUI

struct NotificationsView: View {
    var body: some View {
        List {
            NotificationRow(icon: "checkmark.circle.fill", title: "Nouvelle demande près de chez vous", time: "Il y a 1 min", color: GOAideColors.green)
            NotificationRow(icon: "message.fill", title: "Nouveau message de Marie", time: "Il y a 12 min", color: GOAideColors.brightBlue)
            NotificationRow(icon: "calendar", title: "Rappel rendez-vous", time: "Aujourd'hui", color: GOAideColors.orange)
            NotificationRow(icon: "heart.fill", title: "Badge solidaire gagné", time: "Hier", color: GOAideColors.red)
        }
        .navigationTitle("Notifications")
    }
}
