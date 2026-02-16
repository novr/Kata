import SwiftUI

// MARK: - Kata Text Field (DemoApp Components)
// Single-line text input using theme tokens.

struct KataTextField: View {
    @Environment(\.theme) private var theme

    let placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .textStyle(\.body)
            .padding(\.sm)
            .background(\.surfaceVariant)
            .cornerRadius(\.sm)
            .overlay(KataTextFieldBorderOverlay())
    }
}

private struct KataTextFieldBorderOverlay: View {
    @Environment(\.theme) private var theme

    var body: some View {
        RoundedRectangle(cornerRadius: theme.radius.sm)
            .strokeBorder(lineWidth: theme.spacing.hairline)
            .foreground(\.outline)
    }
}

// MARK: - Previews

#Preview("Placeholder") {
    KataTextField(placeholder: "Enter text...", text: .constant(""))
        .padding(\.md)
        .background(\.background)
}

#Preview("With text") {
    KataTextField(placeholder: "Search", text: .constant("Hello"))
        .padding(\.md)
        .background(\.background)
}
