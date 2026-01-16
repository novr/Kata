import SwiftUI

extension View {
    public func foreground(_ keyPath: KeyPath<Colors, Color>) -> some View {
        modifier(ForegroundModifier(keyPath: keyPath))
    }

    public func background(_ keyPath: KeyPath<Colors, Color>) -> some View {
        modifier(BackgroundModifier(keyPath: keyPath))
    }

    public func tint(_ keyPath: KeyPath<Colors, Color>) -> some View {
        modifier(TintModifier(keyPath: keyPath))
    }

    public func overlay(_ keyPath: KeyPath<Colors, Color>) -> some View {
        modifier(OverlayModifier(keyPath: keyPath))
    }

    public func border(_ keyPath: KeyPath<Colors, Color>, width: CGFloat = 1) -> some View {
        modifier(BorderModifier(keyPath: keyPath, width: width))
    }
}

private struct ForegroundModifier: ViewModifier {
    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme
    let keyPath: KeyPath<Colors, Color>

    func body(content: Content) -> some View {
        content.foregroundStyle(theme.colors(for: colorScheme)[keyPath: keyPath])
    }
}

private struct BackgroundModifier: ViewModifier {
    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme
    let keyPath: KeyPath<Colors, Color>

    func body(content: Content) -> some View {
        content.background(theme.colors(for: colorScheme)[keyPath: keyPath])
    }
}

private struct TintModifier: ViewModifier {
    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme
    let keyPath: KeyPath<Colors, Color>

    func body(content: Content) -> some View {
        content.tint(theme.colors(for: colorScheme)[keyPath: keyPath])
    }
}

private struct OverlayModifier: ViewModifier {
    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme
    let keyPath: KeyPath<Colors, Color>

    func body(content: Content) -> some View {
        content.overlay(theme.colors(for: colorScheme)[keyPath: keyPath])
    }
}

private struct BorderModifier: ViewModifier {
    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme
    let keyPath: KeyPath<Colors, Color>
    let width: CGFloat

    func body(content: Content) -> some View {
        content.border(theme.colors(for: colorScheme)[keyPath: keyPath], width: width)
    }
}
