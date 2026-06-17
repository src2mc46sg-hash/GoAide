import SwiftUI
import AuthenticationServices

struct AuthView: View {
    @State private var showProfileCreation = false
    @State private var selectedMethod: AuthMethod?
    @State private var selectedRole = "J'ai besoin d'aide"
    let onConnected: () -> Void

    var body: some View {
        Group {
            if showProfileCreation {
                ProfileCreationView {
                    onConnected()
                }
            } else if let selectedMethod {
                AuthMethodView(
                    method: selectedMethod,
                    selectedRole: selectedRole
                ) {
                    showProfileCreation = true
                }
            } else {
                ScrollView {
                    VStack(spacing: 16) {
                        Spacer()

                        Text("Bienvenue !")
                            .font(.system(size: 24, weight: .bold))

                        LogoView(compact: true)
                            .padding(.bottom, 16)

                        AuthButton(title: "Continuer avec Apple", icon: "apple.logo", color: .black) {
                            selectedMethod = .apple
                        }

                        AuthButton(title: "Continuer avec Google", icon: "g.circle.fill", color: .white) {
                            selectedMethod = .google
                        }

                        AuthButton(title: "Continuer avec email", icon: "envelope.fill", color: GOAideColors.card) {
                            selectedMethod = .email
                        }

                        AuthButton(title: "Continuer avec téléphone", icon: "phone.fill", color: GOAideColors.card) {
                            selectedMethod = .phone
                        }

                        Text("Choisissez votre profil")
                            .font(.system(size: 14, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 8)

                        RoleChoiceRow(
                            icon: "person.fill",
                            title: "J'ai besoin d'aide",
                            selected: selectedRole == "J'ai besoin d'aide"
                        ) {
                            selectedRole = "J'ai besoin d'aide"
                        }

                        RoleChoiceRow(
                            icon: "heart.fill",
                            title: "Je souhaite aider",
                            subtitle: "Bénévole",
                            selected: selectedRole == "Je souhaite aider"
                        ) {
                            selectedRole = "Je souhaite aider"
                        }

                        RoleChoiceRow(
                            icon: "building.2.fill",
                            title: "Je représente une association",
                            selected: selectedRole == "Je représente une association"
                        ) {
                            selectedRole = "Je représente une association"
                        }
                    }
                    .padding(24)
                }
            }
        }
        .background(GOAideColors.background)
    }
}

enum AuthMethod {
    case apple
    case google
    case email
    case phone
}

struct AuthMethodView: View {
    let method: AuthMethod
    let selectedRole: String
    let onContinue: () -> Void

    @State private var email = ""
    @State private var password = ""
    @State private var phone = ""
    @State private var code = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                Image(systemName: iconName())
                    .font(.system(size: 64, weight: .semibold))
                    .foregroundStyle(iconColor())
                    .padding(.top, 50)

                Text(screenTitle())
                    .font(.system(size: 22, weight: .bold))
                    .multilineTextAlignment(.center)

                Text(screenSubtitle())
                    .font(.system(size: 14))
                    .foregroundStyle(GOAideColors.muted)
                    .multilineTextAlignment(.center)

                Text("Profil choisi : \(selectedRole)")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(GOAideColors.brightBlue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(12)
                    .background(GOAideColors.card)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.top, 8)

                if method == .email {
                    LabeledTextField(label: "Adresse email", text: $email)
                    LabeledTextField(label: "Mot de passe", text: $password)
                }

                if method == .phone {
                    LabeledTextField(label: "Numéro de téléphone", text: $phone)
                    LabeledTextField(label: "Code reçu par SMS", text: $code)
                }

                if method == .apple || method == .google {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Ce compte servira à :")
                            .font(.system(size: 15, weight: .bold))

                        AuthInfoRow(icon: "checkmark.shield.fill", title: "Sécuriser votre profil")
                        AuthInfoRow(icon: "person.crop.circle.fill", title: "Retrouver vos informations")
                        AuthInfoRow(icon: "bell.fill", title: "Recevoir les suivis importants")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(16)
                    .background(GOAideColors.card)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }

                if method == .apple {
                    SignInWithAppleButton(.continue) { request in
                        request.requestedScopes = [.fullName, .email]
                    } onCompletion: { result in
                        if case .success = result {
                            onContinue()
                        }
                    }
                    .signInWithAppleButtonStyle(.black)
                    .frame(height: 48)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.top, 22)
                } else {
                    PrimaryButton(title: buttonTitle(), color: buttonColor()) {
                        onContinue()
                    }
                    .padding(.top, 22)
                }
            }
            .padding(24)
        }
        .background(GOAideColors.background)
        .navigationTitle("Connexion")
        .navigationBarTitleDisplayMode(.inline)
    }

    func screenTitle() -> String {
        if method == .apple {
            return "Connexion avec Apple"
        } else if method == .google {
            return "Connexion avec Google"
        } else if method == .email {
            return "Connexion par email"
        } else {
            return "Connexion par téléphone"
        }
    }

    func screenSubtitle() -> String {
        if method == .apple {
            return "Utilisez votre identifiant Apple pour créer ou retrouver votre compte GO'AIDE."
        } else if method == .google {
            return "Utilisez votre compte Google pour accéder rapidement à votre profil."
        } else if method == .email {
            return "Entrez votre email et un mot de passe pour continuer."
        } else {
            return "Entrez votre numéro puis le code reçu par SMS."
        }
    }

    func buttonTitle() -> String {
        if method == .apple {
            return "Continuer avec Apple"
        } else if method == .google {
            return "Continuer avec Google"
        } else if method == .email {
            return "Valider l'email"
        } else {
            return "Valider le téléphone"
        }
    }

    func iconName() -> String {
        if method == .apple {
            return "apple.logo"
        } else if method == .google {
            return "g.circle.fill"
        } else if method == .email {
            return "envelope.fill"
        } else {
            return "phone.fill"
        }
    }

    func iconColor() -> Color {
        if method == .apple {
            return .black
        } else if method == .google {
            return GOAideColors.red
        } else {
            return GOAideColors.brightBlue
        }
    }

    func buttonColor() -> Color {
        if method == .apple {
            return .black
        } else {
            return GOAideColors.brightBlue
        }
    }
}

struct AuthButton: View {
    let title: String
    let icon: String
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .semibold))
                Text(title)
                    .font(.system(size: 15, weight: .semibold))
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 48)
            .padding(.horizontal, 16)
            .foregroundStyle(color == .black ? .white : GOAideColors.text)
            .background(color)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(GOAideColors.border, lineWidth: color == .black ? 0 : 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct AuthInfoRow: View {
    let icon: String
    let title: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: icon)
                .foregroundStyle(GOAideColors.green)
                .frame(width: 22)
            Text(title)
                .font(.system(size: 14))
            Spacer()
        }
    }
}

struct RoleChoiceRow: View {
    let icon: String
    let title: String
    var subtitle: String?
    let selected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(selected ? GOAideColors.brightBlue : GOAideColors.muted)
                    .frame(width: 30)
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(GOAideColors.text)
                    if let subtitle {
                        Text(subtitle)
                            .font(.system(size: 12))
                            .foregroundStyle(GOAideColors.muted)
                    }
                }
                Spacer()
                if selected {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(GOAideColors.brightBlue)
                }
            }
            .padding(13)
            .background(GOAideColors.card)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(selected ? GOAideColors.brightBlue.opacity(0.35) : GOAideColors.border, lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct AuthThenRequestReadyView: View {
    @Binding var isConnected: Bool
    @State private var didFinishAuth = false

    var body: some View {
        if didFinishAuth {
            RequestReadyView()
        } else {
            AuthView {
                isConnected = true
                didFinishAuth = true
            }
        }
    }
}
