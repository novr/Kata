import SwiftUI

public struct Shadow: Sendable, Modifiable, Equatable {
    public var color: Color
    public var radius: CGFloat
    public var x: CGFloat
    public var y: CGFloat
}

public struct Elevation: Sendable, Modifiable, Equatable {
    public var none: Shadow
    public var sm: Shadow
    public var md: Shadow
    public var lg: Shadow
    public var xl: Shadow
}
