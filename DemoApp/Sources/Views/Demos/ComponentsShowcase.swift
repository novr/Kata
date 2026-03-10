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

#Preview {
    NavigationStack { ComponentsShowcase() }
}
