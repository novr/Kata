import SwiftUI

struct ComponentsShowcase: View {
    @Environment(\.theme) private var theme
    @State private var textFieldValue = ""
    @State private var toggleValue = false
    @State private var sliderValue: Double = 0.5

    var body: some View {
        ScrollView {
            VStack(spacing: theme.spacing.none) {
                componentSection("Buttons (System)") { systemButtonsDemo }
                componentSection("Buttons (Custom Style)") { customButtonsDemo }
                componentSection("Cards") { cardsDemo }
                componentSection("Inputs") { inputsDemo }
                componentSection("Status Messages") { alertsDemo }
            }
            .padding(\.md)
        }
        .background(\.background)
        .navigationTitle("Components")
    }

    @ViewBuilder
    private func componentSection<Content: View>(
        _ title: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: theme.spacing.none) {
            Text(title)
                .textStyle(\.title3)
                .foreground(\.primary)
                .padding(\.sm)

            content().padding(\.sm, edges: .bottom)
        }
    }

    // MARK: - System Buttons (Recommended)
    // Use .borderedProminent + .tint() for standard buttons.
    // System handles contrast colors automatically.
    private var systemButtonsDemo: some View {
        VStack(spacing: theme.spacing.sm) {
            HStack(spacing: theme.spacing.sm) {
                Button("Primary") {}.buttonStyle(.borderedProminent).tint(\.primary)
                Button("Secondary") {}.buttonStyle(.borderedProminent).tint(\.secondary)
                Button("Tertiary") {}.buttonStyle(.borderedProminent).tint(\.tertiary)
            }

            HStack(spacing: theme.spacing.sm) {
                Button("Success") {}.buttonStyle(.borderedProminent).tint(\.success)
                Button("Error") {}.buttonStyle(.borderedProminent).tint(\.error)
                Button("Warning") {}.buttonStyle(.borderedProminent).tint(\.warning)
            }
        }
        .padding(\.md)
        .background(\.surface)
        .cornerRadius(\.md)
    }

    // MARK: - Custom ButtonStyle
    // Use when system styles don't meet design requirements.
    // Uses .onAccent for text color (HIG: OnAccentColor pattern).
    private var customButtonsDemo: some View {
        VStack(spacing: theme.spacing.sm) {
            HStack(spacing: theme.spacing.sm) {
                Button("Filled") {}.buttonStyle(KataFilledButtonStyle(color: \.primary))
                Button("Outline") {}.buttonStyle(KataOutlineButtonStyle(color: \.primary))
            }
        }
        .padding(\.md)
        .background(\.surface)
        .cornerRadius(\.md)
    }

    private var cardsDemo: some View {
        VStack(spacing: theme.spacing.sm) {
            KataCard {
                CardContent(title: "Standard Card", description: "This is a basic card component using Kata tokens for spacing, colors, and typography.")
            }

            KataCard(variant: .outlined) {
                CardContent(title: "Outlined Card", description: "A card variant with an outline border instead of elevation.")
            }
        }
    }

    private var inputsDemo: some View {
        VStack(spacing: theme.spacing.md) {
            KataTextField(placeholder: "Enter text...", text: $textFieldValue)

            HStack {
                Text("Toggle Option").textStyle(\.headline).foreground(\.primary)
                Spacer()
                Toggle("", isOn: $toggleValue).tint(\.primary)
            }

            SliderRow(title: "Slider Value", value: $sliderValue)
        }
        .padding(\.md)
        .background(\.surface)
        .cornerRadius(\.md)
    }

    private var alertsDemo: some View {
        VStack(spacing: theme.spacing.sm) {
            KataAlert(message: "This is an informational message.", type: .info)
            KataAlert(message: "Operation completed successfully!", type: .success)
            KataAlert(message: "Please review before continuing.", type: .warning)
            KataAlert(message: "An error occurred. Please try again.", type: .error)
        }
    }
}

private struct CardContent: View {
    @Environment(\.theme) private var theme
    let title: String
    let description: String

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.sm) {
            Text(title).textStyle(\.headline).foreground(\.primary)
            Text(description).textStyle(\.body).foreground(\.secondary)
        }
    }
}

private struct SliderRow: View {
    @Environment(\.theme) private var theme
    let title: String
    @Binding var value: Double

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.sm) {
            Text("\(title): \(Int(value * 100))%")
                .textStyle(\.headline).foreground(\.primary)
            Slider(value: $value).tint(\.primary)
        }
    }
}


private struct KataCard<Content: View>: View {
    @Environment(\.theme) private var theme
    enum Variant { case filled, outlined }

    let variant: Variant
    let content: () -> Content

    init(variant: Variant = .filled, @ViewBuilder content: @escaping () -> Content) {
        self.variant = variant
        self.content = content
    }

    var body: some View {
        content()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(\.md)
            .background(\.surface)
            .cornerRadius(\.md)
            .overlay(
                Group {
                    if variant == .outlined {
                        RoundedRectangle(cornerRadius: theme.radius.md)
                            .strokeBorder()
                            .foreground(\.outline)
                    }
                }
            )
    }
}

private struct KataTextField: View {
    @Environment(\.theme) private var theme
    let placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .textStyle(\.body)
            .padding(\.sm)
            .background(\.surfaceVariant)
            .cornerRadius(\.sm)
            .overlay(
                RoundedRectangle(cornerRadius: theme.radius.sm)
                    .strokeBorder()
                    .foreground(\.outline)
            )
    }
}

private struct KataAlert: View {
    @Environment(\.theme) private var theme
    enum AlertType { case info, success, warning, error }

    let message: String
    let type: AlertType

    var body: some View {
        HStack(spacing: theme.spacing.sm) {
            Image(systemName: iconName).foreground(colorKeyPath)
            Text(message).textStyle(\.callout).foreground(\.primary)
            Spacer()
        }
        .padding(\.md)
        .background(\.surface)
        .cornerRadius(\.sm)
        .overlay(
            RoundedRectangle(cornerRadius: theme.radius.sm)
                .strokeBorder()
                .foreground(colorKeyPath)
        )
    }

    private var iconName: String {
        switch type {
        case .info: return "info.circle.fill"
        case .success: return "checkmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .error: return "xmark.circle.fill"
        }
    }

    private var colorKeyPath: KeyPath<Colors, Color> {
        switch type {
        case .info: return \.info
        case .success: return \.success
        case .warning: return \.warning
        case .error: return \.error
        }
    }
}

// MARK: - Custom ButtonStyles

/// Filled button style using Kata tokens
/// No @Environment needed - Kata ViewModifiers handle theme access internally
private struct KataFilledButtonStyle: ButtonStyle {
    let color: KeyPath<Colors, Color>

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textStyle(\.callout)
            .foreground(\.onAccent)
            .padding(\.sm, edges: .horizontal)
            .padding(\.xs, edges: .vertical)
            .background(color)
            .cornerRadius(\.sm)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

/// Outline button style using Kata tokens
private struct KataOutlineButtonStyle: ButtonStyle {
    let color: KeyPath<Colors, Color>

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textStyle(\.callout)
            .foreground(color)
            .padding(\.sm, edges: .horizontal)
            .padding(\.xs, edges: .vertical)
            .background(\.surface)
            .cornerRadius(\.sm)
            .border(color)
            .cornerRadius(\.sm)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

#Preview {
    NavigationStack { ComponentsShowcase() }
}
