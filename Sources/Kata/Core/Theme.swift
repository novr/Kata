import SwiftUI

public struct Theme: Sendable, Modifiable, Equatable {
    public var lightColors: Colors
    public var darkColors: Colors?
    public var typography: Typography
    public var spacing: Spacing
    public var radius: Radius
    public var elevation: Elevation

    public func colors(for colorScheme: ColorScheme) -> Colors {
        if colorScheme == .dark, let dark = darkColors {
            return dark
        }
        return lightColors
    }
}
