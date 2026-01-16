import SwiftUI

// MARK: - Spacing Token Definition
// Spacing scale tokens for the Kata Design System.

/// Spacing tokens that define consistent spacing values across the design system.
///
/// Uses a semantic scale (xxs to xxxl) rather than arbitrary pixel values.
/// All values are `CGFloat` for direct use in SwiftUI modifiers.
///
/// Example:
/// ```swift
/// VStack(spacing: theme.spacing.md) { ... }
///     .padding(\.lg)
/// ```
public struct Spacing: Sendable, Modifiable {

    // MARK: - Spacing Scale

    /// None (0pt) - No spacing
    public var none: CGFloat

    /// Extra extra small (2pt)
    public var xxs: CGFloat

    /// Extra small (4pt)
    public var xs: CGFloat

    /// Small (8pt)
    public var sm: CGFloat

    /// Medium (16pt) - Base unit
    public var md: CGFloat

    /// Large (24pt)
    public var lg: CGFloat

    /// Extra large (32pt)
    public var xl: CGFloat

    /// Extra extra large (48pt)
    public var xxl: CGFloat

    /// Extra extra extra large (64pt)
    public var xxxl: CGFloat

    // MARK: - Initializer

    public init(
        none: CGFloat,
        xxs: CGFloat,
        xs: CGFloat,
        sm: CGFloat,
        md: CGFloat,
        lg: CGFloat,
        xl: CGFloat,
        xxl: CGFloat,
        xxxl: CGFloat
    ) {
        self.none = none
        self.xxs = xxs
        self.xs = xs
        self.sm = sm
        self.md = md
        self.lg = lg
        self.xl = xl
        self.xxl = xxl
        self.xxxl = xxxl
    }
}
