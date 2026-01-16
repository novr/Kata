import SwiftUI

extension View {
    public func textStyle(_ keyPath: KeyPath<Typography, Font>) -> some View {
        modifier(TypographyModifier(keyPath: keyPath))
    }
}

private struct TypographyModifier: ViewModifier {
    @Environment(\.theme) private var theme
    let keyPath: KeyPath<Typography, Font>

    func body(content: Content) -> some View {
        content.font(theme.typography[keyPath: keyPath])
    }
}
