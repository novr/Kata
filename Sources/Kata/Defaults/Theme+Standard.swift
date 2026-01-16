import SwiftUI

extension Theme {
    public static let standard = Theme(
        lightColors: .standard,
        typography: .standard,
        spacing: .standard,
        radius: .standard,
        elevation: .standard
    )
}

#if canImport(UIKit)
import UIKit

extension Colors {
    public static let standard = Colors(
        primary: .accentColor,
        secondary: .purple,
        tertiary: .orange,
        surface: Color(uiColor: .systemBackground),
        surfaceVariant: Color(uiColor: .secondarySystemBackground),
        background: Color(uiColor: .systemBackground),
        error: .red,
        success: .green,
        warning: .yellow,
        info: .blue,
        outline: Color(uiColor: .separator),
        outlineVariant: Color(uiColor: .opaqueSeparator),
        scrim: .black.opacity(0.4)
    )
}

#elseif canImport(AppKit)
import AppKit

extension Colors {
    public static let standard = Colors(
        primary: .accentColor,
        secondary: .purple,
        tertiary: .orange,
        surface: Color(nsColor: .windowBackgroundColor),
        surfaceVariant: Color(nsColor: .controlBackgroundColor),
        background: Color(nsColor: .windowBackgroundColor),
        error: .red,
        success: .green,
        warning: .yellow,
        info: .blue,
        outline: Color(nsColor: .separatorColor),
        outlineVariant: Color(nsColor: .gridColor),
        scrim: .black.opacity(0.4)
    )
}
#endif

extension Typography {
    public static let standard = Typography(
        largeTitle: .largeTitle,
        title: .title,
        title2: .title2,
        title3: .title3,
        headline: .headline,
        subheadline: .subheadline,
        body: .body,
        callout: .callout,
        footnote: .footnote,
        caption: .caption,
        caption2: .caption2
    )
}

extension Spacing {
    public static let standard = Spacing(
        none: 0,
        xxs: 2,
        xs: 4,
        sm: 8,
        md: 16,
        lg: 24,
        xl: 32,
        xxl: 48,
        xxxl: 64
    )
}

extension Radius {
    public static let standard = Radius(
        none: 0,
        xs: 2,
        sm: 4,
        md: 8,
        lg: 12,
        xl: 16,
        xxl: 24,
        full: 9999
    )
}

extension Elevation {
    public static let standard = Elevation(
        none: Shadow(color: .clear, radius: 0, x: 0, y: 0),
        sm: Shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1),
        md: Shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2),
        lg: Shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4),
        xl: Shadow(color: .black.opacity(0.25), radius: 16, x: 0, y: 8)
    )
}
