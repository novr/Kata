import SwiftUI

extension View {
    public func elevation(_ keyPath: KeyPath<Elevation, Shadow>) -> some View {
        modifier(ElevationModifier(keyPath: keyPath))
    }
}

private struct ElevationModifier: ViewModifier {
    @Environment(\.theme) private var theme
    let keyPath: KeyPath<Elevation, Shadow>

    func body(content: Content) -> some View {
        let shadow = theme.elevation[keyPath: keyPath]
        content.shadow(
            color: shadow.color,
            radius: shadow.radius,
            x: shadow.x,
            y: shadow.y
        )
    }
}
