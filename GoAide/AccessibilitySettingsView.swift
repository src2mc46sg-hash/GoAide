import SwiftUI

struct AccessibilitySettingsView: View {
    @State private var largeText = false
    @State private var highContrast = false

    var body: some View {
        Form {
            Toggle("Texte plus grand", isOn: $largeText)
            Toggle("Contraste renforcé", isOn: $highContrast)
        }
        .navigationTitle("Accessibilité")
    }
}
