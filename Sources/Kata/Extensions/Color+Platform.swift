import SwiftUI

#if canImport(UIKit)
import UIKit

extension Color {
    public var uiColor: UIColor {
        UIColor(self)
    }
}

#elseif canImport(AppKit)
import AppKit

extension Color {
    public var nsColor: NSColor {
        NSColor(self)
    }
}
#endif
