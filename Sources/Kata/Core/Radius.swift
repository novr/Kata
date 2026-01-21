import SwiftUI

// MARK: - Radius Token Definition
// Corner radius tokens for the Kata Design System.

/// Corner radius tokens that define consistent rounded corners across the design system.
///
/// Uses a semantic scale (none to full) rather than arbitrary pixel values.
/// All values are `CGFloat` for direct use in SwiftUI modifiers.
///
/// Example:
/// ```swift
/// RoundedRectangle(cornerRadius: theme.radius.md)
///     .cornerRadius(\.lg)
/// ```
public struct Radius: Sendable, Modifiable, Equatable {

    // MARK: - Radius Scale

    /// None (0pt) - Sharp corners
    public var none: CGFloat

    /// Extra small (2pt)
    public var xs: CGFloat

    /// Small (4pt)
    public var sm: CGFloat

    /// Medium (8pt) - Base unit
    public var md: CGFloat

    /// Large (12pt)
    public var lg: CGFloat

    /// Extra large (16pt)
    public var xl: CGFloat

    /// Extra extra large (24pt)
    public var xxl: CGFloat

    /// Full (9999pt) - Pill/circle shape
    public var full: CGFloat
}
