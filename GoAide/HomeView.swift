import SwiftUI

struct HomeView: View {
    @Binding var isConnected: Bool
    @State private var showCreateRequest = false
    @State private var showSOS = false
    @State private var showNotifications = false
    @State private var showMap = false
    @State private var showRequests = false
    @State private var showAssociations = false
    @State private var showChat = false
    @State private var showSettings = false

    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                HStack {
                    ScreenHeader(title: "Bonjour, Inès !")
                    Button {
                        showNotifications = true
                    } label: {
                        Image(systemName: "bell")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(GOAideColors.text)
                    }
                }
                VStack(spacing: 10) {
                    PrimaryButton(title: "Déposer une demande") {
                        showCreateRequest = true
                    }
                    PrimaryButton(title: "SOS Social", color: GOAideColors.green) {
                        showSOS = true
                    }
                    HStack(spacing: 10) {
                        Button {
                            showMap = true
                        } label: {
                            QuickAction(title: "Carte interactive", icon: "map.fill", color: GOAideColors.brightBlue)
                        }
                        Button {
                            showAssociations = true
                        } label: {
                            QuickAction(title: "Associations", icon: "building.2.fill", color: GOAideColors.green)
                        }
                    }
                }
                SectionTitle(title: "Demandes rapides", action: "Voir tout")
                Button {
                    showRequests = true
                } label: {
                    RequestCard(title: "Demandes autour de vous", person: "Voir les personnes qui ont besoin d'aide", distance: "Proche de vous", urgency: "Voir", color: GOAideColors.brightBlue)
                }
                Button {
                    showMap = true
                } label: {
                    RequestCard(title: "Carte interactive", person: "Voir les demandes, bénévoles et associations proches", distance: "Autour de vous", urgency: "Ouvrir", color: GOAideColors.green)
                }
                SectionTitle(title: "Activités solidaires", action: "Voir tout")
                Button {
                    showAssociations = true
                } label: {
                    RequestCard(title: "Associations", person: "Trouver une structure proche", distance: "Annuaire", urgency: "Voir", color: GOAideColors.green)
                }
                Button {
                    showChat = true
                } label: {
                    RequestCard(title: "Messagerie", person: "Marie D.", distance: "Écran 12", urgency: "Chat", color: GOAideColors.purple)
                }
                Button {
                    showSettings = true
                } label: {
                    RequestCard(title: "Paramètres", person: "Compte", distance: "Écran 17", urgency: "Réglages", color: GOAideColors.orange)
                }
            }
            .padding(20)
        }
        .background(GOAideColors.background)
        .navigationDestination(isPresented: $showCreateRequest) {
            RequestTypeView(isConnected: $isConnected)
        }
        .navigationDestination(isPresented: $showSOS) {
            SOSStartView(isConnected: $isConnected)
        }
        .navigationDestination(isPresented: $showNotifications) {
            NotificationsView()
        }
        .navigationDestination(isPresented: $showMap) {
            MapView()
        }
        .navigationDestination(isPresented: $showRequests) {
            RequestsListView()
        }
        .navigationDestination(isPresented: $showAssociations) {
            AssociationsView()
        }
        .navigationDestination(isPresented: $showChat) {
            ChatView()
        }
        .navigationDestination(isPresented: $showSettings) {
            SettingsView()
        }
    }
}
