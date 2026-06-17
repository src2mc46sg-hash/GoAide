import SwiftUI

struct AppRootView: View {
    @State private var hasFinishedOnboarding = false

    var body: some View {
        if !hasFinishedOnboarding {
            OnboardingView {
                hasFinishedOnboarding = true
            }
        } else {
            MainTabView()
        }
    }
}
