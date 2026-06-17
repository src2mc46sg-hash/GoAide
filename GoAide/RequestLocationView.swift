import SwiftUI

struct RequestLocationView: View {
    @Binding var isConnected: Bool
    @State private var address = "23 rue de la République, 69001 Lyon"
    @State private var urgency = "Normal"
    @State private var showReady = false
    @State private var showAuth = false

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                LabeledTextField(label: "Adresse", text: $address)
                MapPlaceholder()
                    .frame(height: 180)
                Picker("Niveau d'urgence", selection: $urgency) {
                    Text("Normal").tag("Normal")
                    Text("Prioritaire").tag("Prioritaire")
                    Text("Urgent").tag("Urgent")
                }
                .pickerStyle(.segmented)
                Button {
                    if isConnected {
                        showReady = true
                    } else {
                        showAuth = true
                    }
                } label: {
                    Text("Continuer")
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
        .navigationTitle("Où avez-vous besoin d'aide ?")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $showReady) {
            RequestReadyView()
        }
        .navigationDestination(isPresented: $showAuth) {
            AuthThenRequestReadyView(isConnected: $isConnected)
        }
    }
}
