import SwiftUI

struct MyMissionsView: View {
    var body: some View {
        List {
            Section("En cours") {
                NavigationLink(destination: MissionInProgressView()) {
                    RequestCard(title: "Aider Marie D.", person: "Courses", distance: "15:30", urgency: "Prévue", color: GOAideColors.brightBlue)
                }
            }
            Section("Terminées") {
                NavigationLink(destination: ReviewView()) {
                    RequestCard(title: "Accompagnement pharmacie", person: "Kola", distance: "Hier", urgency: "Avis", color: GOAideColors.green)
                }
            }
        }
        .navigationTitle("Mes missions")
    }
}

struct MissionInProgressView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ScreenHeader(title: "Mission en cours", subtitle: "Aider Marie D. pour ses courses")
                AppointmentRow(icon: "calendar", title: "Date", value: "Aujourd'hui")
                AppointmentRow(icon: "clock", title: "Heure", value: "15:30")
                AppointmentRow(icon: "mappin", title: "Lieu", value: "Supermarché Centre-ville")
                NavigationLink(destination: ChatView()) {
                    Text("Contacter Marie")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .foregroundStyle(.white)
                        .background(GOAideColors.brightBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                NavigationLink(destination: MissionCompleteView()) {
                    Text("Terminer la mission")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .foregroundStyle(.white)
                        .background(GOAideColors.green)
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
        .navigationTitle("Mission")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MissionCompleteView: View {
    @Environment(\.returnToHome) private var returnToHome

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 82, weight: .bold))
                    .foregroundStyle(GOAideColors.green)
                    .padding(.top, 60)
                Text("Mission terminée")
                    .font(.system(size: 24, weight: .bold))
                Text("Merci pour votre aide. Vous pouvez maintenant laisser un avis ou un mot de remerciement.")
                    .font(.system(size: 14))
                    .foregroundStyle(GOAideColors.muted)
                    .multilineTextAlignment(.center)
                NavigationLink(destination: ReviewView()) {
                    Text("Laisser un avis")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .foregroundStyle(.white)
                        .background(GOAideColors.brightBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                SecondaryButton(title: "Retour à l'accueil") {
                    returnToHome()
                }
            }
            .padding(20)
        }
        .background(GOAideColors.background)
        .navigationTitle("Fin de mission")
        .navigationBarTitleDisplayMode(.inline)
    }
}
