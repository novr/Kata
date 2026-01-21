import SwiftUI

public struct Colors: Sendable, Modifiable, Equatable {
    public var primary: Color
    public var secondary: Color
    public var tertiary: Color
    public var surface: Color
    public var surfaceVariant: Color
    public var background: Color
    public var error: Color
    public var success: Color
    public var warning: Color
    public var info: Color
    public var outline: Color
    public var outlineVariant: Color
    public var scrim: Color

    // MARK: - Foreground Colors (HIG: On-colors)

    /// Foreground color for content on accent/primary backgrounds
    public var onAccent: Color

    /// Foreground color for content on surface backgrounds
    public var onSurface: Color
}
