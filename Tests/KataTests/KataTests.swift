import Testing
import SwiftUI
@testable import Kata

// MARK: - Theme Tests

@Test func themeStandardExists() {
    let theme = Theme.standard
    #expect(theme.spacing.md > 0)
    #expect(theme.radius.md > 0)
}

@Test func themeColorsForLightMode() {
    let theme = Theme.standard
    let colors = theme.colors(for: .light)
    #expect(colors.primary == theme.lightColors.primary)
}

@Test func themeColorsForDarkModeWithoutCustomDark() {
    let theme = Theme.standard
    let colors = theme.colors(for: .dark)
    #expect(colors.primary == theme.lightColors.primary)
}

@Test func themeColorsForDarkModeWithCustomDark() {
    let darkColors = Colors.standard.modified { $0.primary = .red }
    let theme = Theme.standard.modified { $0.darkColors = darkColors }
    let colors = theme.colors(for: .dark)
    #expect(colors.primary == .red)
}

// MARK: - Modifiable Tests

@Test func modifiableReturnsModifiedCopy() {
    let original = Theme.standard
    let modified = original.modified { $0.spacing.md = 999 }
    #expect(original.spacing.md != 999)
    #expect(modified.spacing.md == 999)
}

@Test func colorsModifiable() {
    let original = Colors.standard
    let modified = original.modified { $0.primary = .red }
    #expect(modified.primary == .red)
}

@Test func typographyModifiable() {
    let original = Typography.standard
    let modified = original.modified { $0.body = .caption }
    #expect(modified.body == .caption)
}

@Test func spacingModifiable() {
    let original = Spacing.standard
    let modified = original.modified { $0.md = 100 }
    #expect(modified.md == 100)
}

@Test func radiusModifiable() {
    let original = Radius.standard
    let modified = original.modified { $0.md = 50 }
    #expect(modified.md == 50)
}

// MARK: - Spacing Tests

@Test func spacingStandardValues() {
    let spacing = Spacing.standard
    #expect(spacing.none == 0)
    #expect(spacing.xxs == 2)
    #expect(spacing.xs == 4)
    #expect(spacing.sm == 8)
    #expect(spacing.md == 16)
    #expect(spacing.lg == 24)
    #expect(spacing.xl == 32)
    #expect(spacing.xxl == 48)
    #expect(spacing.xxxl == 64)
}

@Test func spacingValuesAreOrdered() {
    let s = Spacing.standard
    #expect(s.none < s.xxs)
    #expect(s.xxs < s.xs)
    #expect(s.xs < s.sm)
    #expect(s.sm < s.md)
    #expect(s.md < s.lg)
    #expect(s.lg < s.xl)
    #expect(s.xl < s.xxl)
    #expect(s.xxl < s.xxxl)
}

// MARK: - Radius Tests

@Test func radiusStandardValues() {
    let radius = Radius.standard
    #expect(radius.none == 0)
    #expect(radius.xs == 2)
    #expect(radius.sm == 4)
    #expect(radius.md == 8)
    #expect(radius.lg == 12)
    #expect(radius.xl == 16)
    #expect(radius.xxl == 24)
    #expect(radius.full == 9999)
}

@Test func radiusValuesAreOrdered() {
    let r = Radius.standard
    #expect(r.none < r.xs)
    #expect(r.xs < r.sm)
    #expect(r.sm < r.md)
    #expect(r.md < r.lg)
    #expect(r.lg < r.xl)
    #expect(r.xl < r.xxl)
    #expect(r.xxl < r.full)
}

// MARK: - Typography Tests

@Test func typographyStandardHasAllStyles() {
    let t = Typography.standard
    #expect(t.largeTitle == .largeTitle)
    #expect(t.title == .title)
    #expect(t.title2 == .title2)
    #expect(t.title3 == .title3)
    #expect(t.headline == .headline)
    #expect(t.subheadline == .subheadline)
    #expect(t.body == .body)
    #expect(t.callout == .callout)
    #expect(t.footnote == .footnote)
    #expect(t.caption == .caption)
    #expect(t.caption2 == .caption2)
}

// MARK: - Colors Tests

@Test func colorsStandardExists() {
    _ = Colors.standard
}

@Test func colorsSemanticColors() {
    let c = Colors.standard
    #expect(c.error == .red)
    #expect(c.success == .green)
    #expect(c.warning == .yellow)
    #expect(c.info == .blue)
}

// MARK: - Color Hex Tests

@Test func colorHex6Digit() {
    let color = Color(hex: "#FF0000")
    #expect(color == Color(red: 1, green: 0, blue: 0))
}

@Test func colorHex3Digit() {
    let color = Color(hex: "#F00")
    #expect(color == Color(red: 1, green: 0, blue: 0))
}

@Test func colorHexWithoutHash() {
    let color = Color(hex: "00FF00")
    #expect(color == Color(red: 0, green: 1, blue: 0))
}
