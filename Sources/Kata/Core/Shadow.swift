import SwiftUI

public struct Shadow: Sendable, Modifiable {
    public var color: Color
    public var radius: CGFloat
    public var x: CGFloat
    public var y: CGFloat

    public init(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
}

public struct Elevation: Sendable, Modifiable {
    public var none: Shadow
    public var sm: Shadow
    public var md: Shadow
    public var lg: Shadow
    public var xl: Shadow

    public init(none: Shadow, sm: Shadow, md: Shadow, lg: Shadow, xl: Shadow) {
        self.none = none
        self.sm = sm
        self.md = md
        self.lg = lg
        self.xl = xl
    }
}
