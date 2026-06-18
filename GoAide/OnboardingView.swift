import SwiftUI

struct OnboardingView: View {
    @State private var index = 0
    let onFinish: () -> Void

    private let pages = [
        OnboardingPage(title: "Trouver de l'aide,\nrapidement et en\ntoute confiance", subtitle: "", image: "logo"),
        OnboardingPage(title: "Entraide locale", subtitle: "Trouver de l'aide ou proposer votre aide autour de vous.", image: "onboarding_entraide_figma"),
        OnboardingPage(title: "Géolocalisation", subtitle: "Nous utilisons votre position pour vous montrer l'aide la plus proche.", image: "mappin.and.ellipse"),
        OnboardingPage(title: "Sécurité", subtitle: "Votre sécurité est notre priorité. Nous mettons tout en oeuvre pour vous protéger.", image: "shield.checkered")
    ]

    var body: some View {
        VStack {
            Spacer()
            if pages[index].image == "logo" {
                LogoView()
                    .padding(.bottom, 52)
            } else if index == 1 {
                Image(pages[index].image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 310, maxHeight: 210)
            } else {
                Image(systemName: pages[index].image)
                    .font(.system(size: 92, weight: .bold))
                    .foregroundStyle(index == 3 ? GOAideColors.brightBlue : GOAideColors.orange)
                    .frame(height: 170)
            }
            Text(pages[index].title)
                .font(.system(size: index == 0 ? 28 : 24, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundStyle(GOAideColors.blue)
                .lineSpacing(4)
            if !pages[index].subtitle.isEmpty {
                Text(pages[index].subtitle)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(GOAideColors.text)
                    .padding(.top, 10)
                    .padding(.horizontal, 32)
            }
            Spacer()
            PageDots(current: index, total: pages.count)
                .padding(.bottom, 28)
            if index == pages.count - 1 {
                PrimaryButton(title: "Suivre") {
                    onFinish()
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if index < pages.count - 1 {
                withAnimation(.easeInOut) {
                    index += 1
                }
            }
        }
    }
}

struct OnboardingPage {
    let title: String
    let subtitle: String
    let image: String
}
