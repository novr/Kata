import SwiftUI
@_exported import Kata

// Generated from Figma Design Tokens using AI
extension Theme {
    static let figma = Theme.standard.modified {
        $0.lightColors.primary = Color(hex: "#6200EE")
        $0.lightColors.secondary = Color(hex: "#03DAC6")
        // Figma: spacer-sm = 8pt, spacer-md = 16pt
        $0.spacing.sm = 8
        $0.spacing.md = 16
    }
}
