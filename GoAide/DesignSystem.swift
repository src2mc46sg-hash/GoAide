import SwiftUI

enum GOAideColors {
    static let blue = Color(red: 0.0, green: 0.23, blue: 0.57)
    static let brightBlue = Color(red: 0.0, green: 0.39, blue: 0.86)
    static let green = Color(red: 0.05, green: 0.65, blue: 0.28)
    static let red = Color(red: 0.92, green: 0.12, blue: 0.14)
    static let orange = Color(red: 0.96, green: 0.48, blue: 0.12)
    static let purple = Color(red: 0.43, green: 0.32, blue: 0.74)
    static let background = Color(.systemGroupedBackground)
    static let card = Color(.systemBackground)
    static let text = Color(.label)
    static let muted = Color(.secondaryLabel)
    static let border = Color(.separator).opacity(0.35)
}

struct PrimaryButton: View {
    let title: String
    var color: Color = GOAideColors.brightBlue
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 15, weight: .semibold))
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .foregroundStyle(.white)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct SecondaryButton: View {
    let title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .foregroundStyle(GOAideColors.text)
                .background(GOAideColors.card)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(GOAideColors.border, lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct ScreenHeader: View {
    let title: String
    var subtitle: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 24, weight: .bold))
            if let subtitle {
                Text(subtitle)
                    .font(.system(size: 14))
                    .foregroundStyle(GOAideColors.muted)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct LogoView: View {
    var compact = false

    var body: some View {
        Image("logo_goaide_figma")
            .resizable()
            .scaledToFit()
            .frame(width: compact ? 118 : 220)
            .accessibilityLabel("GO'AIDE")
    }
}

struct PageDots: View {
    let current: Int
    let total: Int

    var body: some View {
        HStack(spacing: 7) {
            ForEach(0..<total, id: \.self) { index in
                Circle()
                    .fill(index == current ? GOAideColors.brightBlue : Color.blue.opacity(0.2))
                    .frame(width: 7, height: 7)
            }
        }
    }
}

struct CategoryRow: View {
    let icon: String
    let title: String
    var color: Color = GOAideColors.brightBlue

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(color)
                .frame(width: 28)
            Text(title)
                .font(.system(size: 15, weight: .medium))
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(GOAideColors.muted)
        }
        .padding(14)
        .background(GOAideColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct RequestCard: View {
    let title: String
    let person: String
    let distance: String
    let urgency: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Circle()
                    .fill(color.opacity(0.15))
                    .frame(width: 36, height: 36)
                    .overlay(Image(systemName: "hand.raised.fill").foregroundStyle(color))
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 14, weight: .semibold))
                    Text("\(person) · \(distance)")
                        .font(.system(size: 12))
                        .foregroundStyle(GOAideColors.muted)
                }
                Spacer()
                Text(urgency)
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(color)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 5)
                    .background(color.opacity(0.12))
                    .clipShape(Capsule())
            }
        }
        .padding(14)
        .background(GOAideColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct MapPlaceholder: View {
    var body: some View {
        ZStack {
            Color(red: 0.93, green: 0.94, blue: 0.91)
            VStack(spacing: 12) {
                Image(systemName: "mappin.circle.fill")
                    .font(.system(size: 42, weight: .bold))
                    .foregroundStyle(GOAideColors.red)
                Text("Carte du quartier")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(GOAideColors.muted)
            }
            Path { path in
                path.move(to: CGPoint(x: 0, y: 55))
                path.addLine(to: CGPoint(x: 340, y: 120))
                path.move(to: CGPoint(x: 40, y: 0))
                path.addLine(to: CGPoint(x: 260, y: 250))
                path.move(to: CGPoint(x: 210, y: 0))
                path.addLine(to: CGPoint(x: 80, y: 250))
            }
            .stroke(.white.opacity(0.9), lineWidth: 8)
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct LabeledTextField: View {
    let label: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(GOAideColors.muted)
            TextField(label, text: $text)
                .textFieldStyle(.plain)
                .padding(12)
                .background(GOAideColors.card)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct QuickAction: View {
    let title: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 22, weight: .bold))
                .foregroundStyle(color)
            Text(title)
                .font(.system(size: 12, weight: .semibold))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 86)
        .background(GOAideColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct SectionTitle: View {
    let title: String
    let action: String

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 18, weight: .bold))
            Spacer()
            Text(action)
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(GOAideColors.brightBlue)
        }
    }
}

struct FilterChip: View {
    let title: String
    let selected: Bool

    var body: some View {
        Text(title)
            .font(.system(size: 12, weight: .semibold))
            .foregroundStyle(selected ? .white : GOAideColors.text)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(selected ? GOAideColors.brightBlue : GOAideColors.card)
            .clipShape(Capsule())
    }
}

struct InfoBlock: View {
    let title: String
    let text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 15, weight: .bold))
            Text(text)
                .font(.system(size: 14))
                .foregroundStyle(GOAideColors.text)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(GOAideColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct StatBox: View {
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: 20, weight: .bold))
            Text(label)
                .font(.system(size: 12))
                .foregroundStyle(GOAideColors.muted)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(GOAideColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct ChatBubble: View {
    let text: String
    let isMine: Bool

    var body: some View {
        HStack {
            if isMine { Spacer() }
            Text(text)
                .font(.system(size: 14))
                .padding(12)
                .foregroundStyle(isMine ? .white : GOAideColors.text)
                .background(isMine ? GOAideColors.brightBlue : GOAideColors.card)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            if !isMine { Spacer() }
        }
    }
}

struct AppointmentRow: View {
    let icon: String
    let title: String
    let value: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundStyle(GOAideColors.brightBlue)
                .frame(width: 28)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 13, weight: .semibold))
                Text(value)
                    .font(.system(size: 14))
                    .foregroundStyle(GOAideColors.muted)
            }
            Spacer()
        }
        .padding()
        .background(GOAideColors.card)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct PickerField: View {
    let title: String
    @Binding var value: String
    let options: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 13, weight: .semibold))
            Picker(title, selection: $value) {
                ForEach(options, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
            .pickerStyle(.menu)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(GOAideColors.card)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct AssociationRow: View {
    let name: String
    let distance: String
    let color: Color

    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 8)
                .fill(color.opacity(0.14))
                .frame(width: 46, height: 46)
                .overlay(Image(systemName: "cross.case.fill").foregroundStyle(color))
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.system(size: 15, weight: .semibold))
                Text(distance)
                    .font(.system(size: 12))
                    .foregroundStyle(GOAideColors.muted)
            }
        }
    }
}

struct NotificationRow: View {
    let icon: String
    let title: String
    let time: String
    let color: Color

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundStyle(color)
                .frame(width: 28)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                Text(time)
                    .font(.system(size: 12))
                    .foregroundStyle(GOAideColors.muted)
            }
        }
        .padding(.vertical, 6)
    }
}
