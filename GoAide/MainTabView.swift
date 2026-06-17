import SwiftUI

struct MainTabView: View {
    @State private var isConnected = false

    var body: some View {
        TabView {
            NavigationStack { HomeView(isConnected: $isConnected) }
                .tabItem { Label("Accueil", systemImage: "house") }
            NavigationStack { MapView() }
                .tabItem { Label("Carte", systemImage: "map") }
            NavigationStack { AssociationsView() }
                .tabItem { Label("Aides", systemImage: "cross.case") }
            NavigationStack { ProfileView() }
                .tabItem { Label("Profil", systemImage: "person") }
        }
        .tint(GOAideColors.brightBlue)
    }
}
