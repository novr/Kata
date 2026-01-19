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

    public init(
        primary: Color,
        secondary: Color,
        tertiary: Color,
        surface: Color,
        surfaceVariant: Color,
        background: Color,
        error: Color,
        success: Color,
        warning: Color,
        info: Color,
        outline: Color,
        outlineVariant: Color,
        scrim: Color
    ) {
        self.primary = primary
        self.secondary = secondary
        self.tertiary = tertiary
        self.surface = surface
        self.surfaceVariant = surfaceVariant
        self.background = background
        self.error = error
        self.success = success
        self.warning = warning
        self.info = info
        self.outline = outline
        self.outlineVariant = outlineVariant
        self.scrim = scrim
    }
}
