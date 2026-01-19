import SwiftUI
import Kata

// Generated from Figma Design Tokens using AI
extension Theme {
    static let figma = Theme.standard.modified {
        $0.lightColors.primary = Color(hex: "#6200EE")
        $0.lightColors.secondary = Color(hex: "#03DAC6")
        $0.spacing.sm = 8
        $0.spacing.md = 16
    }
}
