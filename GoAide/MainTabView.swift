import SwiftUI

struct MainTabView: View {
    @State private var isConnected = false
    @State private var selectedTab = 0
    @State private var navigationResetID = UUID()

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack { HomeView(isConnected: $isConnected) }
                .tabItem { Label("Accueil", systemImage: "house") }
                .tag(0)
            NavigationStack { MapView() }
                .tabItem { Label("Carte", systemImage: "map") }
                .tag(1)
            NavigationStack { AssociationsView() }
                .tabItem { Label("Aides", systemImage: "cross.case") }
                .tag(2)
            NavigationStack { ProfileView() }
                .tabItem { Label("Profil", systemImage: "person") }
                .tag(3)
        }
        .id(navigationResetID)
        .tint(GOAideColors.brightBlue)
        .environment(\.returnToHome) {
            selectedTab = 0
            navigationResetID = UUID()
        }
    }
}
