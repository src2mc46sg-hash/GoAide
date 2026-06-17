import SwiftUI

struct ChatView: View {
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 12) {
                    ChatBubble(text: "Bonjour !", isMine: false)
                    ChatBubble(text: "Avec plaisir, je peux vous aider.", isMine: true)
                    ChatBubble(text: "Super, merci.", isMine: false)
                    ChatBubble(text: "Localisation partagée", isMine: true)
                }
                .padding(16)
            }
            HStack(spacing: 10) {
                TextField("Écrire un message...", text: .constant(""))
                    .padding(12)
                    .background(GOAideColors.card)
                    .clipShape(Capsule())
                Button {
                } label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundStyle(.white)
                        .frame(width: 42, height: 42)
                        .background(GOAideColors.brightBlue)
                        .clipShape(Circle())
                }
            }
            .padding()
            NavigationLink(destination: AppointmentView()) {
                Text("Organiser le rendez-vous")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .foregroundStyle(.white)
                    .background(GOAideColors.brightBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .background(GOAideColors.background)
        .navigationTitle("Marie D.")
        .navigationBarTitleDisplayMode(.inline)
    }
}
