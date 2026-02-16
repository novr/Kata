import SwiftUI

// MARK: - Kata Button Styles (DemoApp Components)
// Token-based button styles. No magic numbers.

/// Filled button style using a theme color token.
struct KataFilledButtonStyle: ButtonStyle {
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

/// Outline button style using a theme color token.
struct KataOutlineButtonStyle: ButtonStyle {
    let color: KeyPath<Colors, Color>

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textStyle(\.callout)
            .foreground(color)
            .padding(\.sm, edges: .horizontal)
            .padding(\.xs, edges: .vertical)
            .background(\.surface)
            .cornerRadius(\.sm)
            .overlay(KataOutlineOverlay(color: color))
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

private struct KataOutlineOverlay: View {
    @Environment(\.theme) private var theme
    let color: KeyPath<Colors, Color>

    var body: some View {
        RoundedRectangle(cornerRadius: theme.radius.sm)
            .strokeBorder(lineWidth: theme.spacing.hairline)
            .foreground(color)
    }
}

// MARK: - Previews

#Preview("Filled") {
    KataButtonFilledPreviewContent()
}

#Preview("Outline") {
    KataButtonOutlinePreviewContent()
}

private struct KataButtonFilledPreviewContent: View {
    @Environment(\.theme) private var theme
    var body: some View {
        HStack(spacing: theme.spacing.sm) {
            Button("Primary") {}.buttonStyle(KataFilledButtonStyle(color: \.primary))
            Button("Success") {}.buttonStyle(KataFilledButtonStyle(color: \.success))
        }
        .padding(\.md)
        .background(\.background)
    }
}

private struct KataButtonOutlinePreviewContent: View {
    @Environment(\.theme) private var theme
    var body: some View {
        HStack(spacing: theme.spacing.sm) {
            Button("Primary") {}.buttonStyle(KataOutlineButtonStyle(color: \.primary))
            Button("Error") {}.buttonStyle(KataOutlineButtonStyle(color: \.error))
        }
        .padding(\.md)
        .background(\.background)
    }
}
