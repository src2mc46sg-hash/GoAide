import SwiftUI

struct ReviewView: View {
    @Environment(\.returnToHome) private var returnToHome
    @State private var rating = 5
    @State private var comment = "Merci beaucoup pour votre aide."

    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                ScreenHeader(title: "Votre avis", subtitle: "Aidez-nous à garder une communauté de confiance.")
                HStack(spacing: 8) {
                    ForEach(1...5, id: \.self) { star in
                        Button {
                            rating = star
                        } label: {
                            Image(systemName: star <= rating ? "star.fill" : "star")
                                .font(.system(size: 30))
                                .foregroundStyle(GOAideColors.orange)
                        }
                    }
                }
                TextEditor(text: $comment)
                    .frame(height: 160)
                    .padding(10)
                    .background(GOAideColors.card)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                PrimaryButton(title: "Envoyer l'avis") {
                    returnToHome()
                }
            }
            .padding(20)
        }
        .background(GOAideColors.background)
        .navigationTitle("Avis")
        .navigationBarTitleDisplayMode(.inline)
    }
}
