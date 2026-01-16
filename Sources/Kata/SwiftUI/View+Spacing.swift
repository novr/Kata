import SwiftUI

// MARK: - Spacing View Modifiers
// KeyPath-based spacing modifiers for the Kata Design System.

extension View {
    /// Adds padding using a theme spacing token.
    ///
    /// Example:
    /// ```swift
    /// Text("Padded")
    ///     .padding(\.md)
    ///
    /// VStack { ... }
    ///     .padding(\.lg)
    /// ```
    ///
    /// - Parameter keyPath: A key path to the spacing token in `Spacing`.
    /// - Returns: A view with the specified padding on all edges.
    public func padding(_ keyPath: KeyPath<Spacing, CGFloat>) -> some View {
        modifier(PaddingModifier(spacingKeyPath: keyPath, edges: .all))
    }

    /// Adds padding to specific edges using a theme spacing token.
    ///
    /// Example:
    /// ```swift
    /// Text("Padded")
    ///     .padding(\.md, edges: .horizontal)
    ///
    /// VStack { ... }
    ///     .padding(\.sm, edges: .top)
    /// ```
    ///
    /// - Parameters:
    ///   - keyPath: A key path to the spacing token in `Spacing`.
    ///   - edges: The edges to apply padding to.
    /// - Returns: A view with the specified padding on the given edges.
    public func padding(_ keyPath: KeyPath<Spacing, CGFloat>, edges: Edge.Set) -> some View {
        modifier(PaddingModifier(spacingKeyPath: keyPath, edges: edges))
    }

    /// Sets the corner radius using a theme radius token.
    ///
    /// Example:
    /// ```swift
    /// RoundedRectangle(cornerRadius: 0)
    ///     .cornerRadius(\.md)
    ///
    /// Image("avatar")
    ///     .cornerRadius(\.full)
    /// ```
    ///
    /// - Parameter keyPath: A key path to the radius token in `Radius`.
    /// - Returns: A view with the specified corner radius.
    public func cornerRadius(_ keyPath: KeyPath<Radius, CGFloat>) -> some View {
        modifier(CornerRadiusModifier(radiusKeyPath: keyPath))
    }

    /// Adds a frame with width using a theme spacing token.
    ///
    /// Example:
    /// ```swift
    /// Divider()
    ///     .frame(width: \.xl)
    /// ```
    ///
    /// - Parameter width: A key path to the spacing token in `Spacing`.
    /// - Returns: A view with the specified width.
    public func frame(width keyPath: KeyPath<Spacing, CGFloat>) -> some View {
        modifier(FrameWidthModifier(spacingKeyPath: keyPath))
    }

    /// Adds a frame with height using a theme spacing token.
    ///
    /// Example:
    /// ```swift
    /// Divider()
    ///     .frame(height: \.sm)
    /// ```
    ///
    /// - Parameter height: A key path to the spacing token in `Spacing`.
    /// - Returns: A view with the specified height.
    public func frame(height keyPath: KeyPath<Spacing, CGFloat>) -> some View {
        modifier(FrameHeightModifier(spacingKeyPath: keyPath))
    }

    /// Adds a frame with both width and height using theme spacing tokens.
    ///
    /// Example:
    /// ```swift
    /// Circle()
    ///     .frame(width: \.xl, height: \.xl)
    /// ```
    ///
    /// - Parameters:
    ///   - width: A key path to the spacing token for width.
    ///   - height: A key path to the spacing token for height.
    /// - Returns: A view with the specified dimensions.
    public func frame(
        width widthKeyPath: KeyPath<Spacing, CGFloat>,
        height heightKeyPath: KeyPath<Spacing, CGFloat>
    ) -> some View {
        modifier(FrameSizeModifier(widthKeyPath: widthKeyPath, heightKeyPath: heightKeyPath))
    }
}

// MARK: - Spacing Modifiers

private struct PaddingModifier: ViewModifier {
    @Environment(\.theme) private var theme
    let spacingKeyPath: KeyPath<Spacing, CGFloat>
    let edges: Edge.Set

    func body(content: Content) -> some View {
        content.padding(edges, theme.spacing[keyPath: spacingKeyPath])
    }
}

private struct CornerRadiusModifier: ViewModifier {
    @Environment(\.theme) private var theme
    let radiusKeyPath: KeyPath<Radius, CGFloat>

    func body(content: Content) -> some View {
        content.clipShape(RoundedRectangle(cornerRadius: theme.radius[keyPath: radiusKeyPath]))
    }
}

private struct FrameWidthModifier: ViewModifier {
    @Environment(\.theme) private var theme
    let spacingKeyPath: KeyPath<Spacing, CGFloat>

    func body(content: Content) -> some View {
        content.frame(width: theme.spacing[keyPath: spacingKeyPath])
    }
}

private struct FrameHeightModifier: ViewModifier {
    @Environment(\.theme) private var theme
    let spacingKeyPath: KeyPath<Spacing, CGFloat>

    func body(content: Content) -> some View {
        content.frame(height: theme.spacing[keyPath: spacingKeyPath])
    }
}

private struct FrameSizeModifier: ViewModifier {
    @Environment(\.theme) private var theme
    let widthKeyPath: KeyPath<Spacing, CGFloat>
    let heightKeyPath: KeyPath<Spacing, CGFloat>

    func body(content: Content) -> some View {
        content.frame(
            width: theme.spacing[keyPath: widthKeyPath],
            height: theme.spacing[keyPath: heightKeyPath]
        )
    }
}
