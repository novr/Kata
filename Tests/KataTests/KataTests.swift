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
    let spacing = Spacing.standard
    #expect(spacing.none < spacing.xxs)
    #expect(spacing.xxs < spacing.xs)
    #expect(spacing.xs < spacing.sm)
    #expect(spacing.sm < spacing.md)
    #expect(spacing.md < spacing.lg)
    #expect(spacing.lg < spacing.xl)
    #expect(spacing.xl < spacing.xxl)
    #expect(spacing.xxl < spacing.xxxl)
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
    let radius = Radius.standard
    #expect(radius.none < radius.xs)
    #expect(radius.xs < radius.sm)
    #expect(radius.sm < radius.md)
    #expect(radius.md < radius.lg)
    #expect(radius.lg < radius.xl)
    #expect(radius.xl < radius.xxl)
    #expect(radius.xxl < radius.full)
}

// MARK: - Typography Tests

@Test func typographyStandardHasAllStyles() {
    let typography = Typography.standard
    #expect(typography.largeTitle == .largeTitle)
    #expect(typography.title == .title)
    #expect(typography.title2 == .title2)
    #expect(typography.title3 == .title3)
    #expect(typography.headline == .headline)
    #expect(typography.subheadline == .subheadline)
    #expect(typography.body == .body)
    #expect(typography.callout == .callout)
    #expect(typography.footnote == .footnote)
    #expect(typography.caption == .caption)
    #expect(typography.caption2 == .caption2)
}

// MARK: - Colors Tests

@Test func colorsStandardExists() {
    _ = Colors.standard
}

@Test func colorsSemanticColors() {
    let colors = Colors.standard
    #expect(colors.error == .red)
    #expect(colors.success == .green)
    #expect(colors.warning == .yellow)
    #expect(colors.info == .blue)
}

// MARK: - Kata Modify Tests

@Test func kataModifyClosureChangesTheme() {
    var theme = Theme.standard
    let originalMd = theme.spacing.md

    // inoutクロージャでの変更をシミュレート
    let modify: (inout Theme) -> Void = { $0.spacing.md = 999 }
    modify(&theme)

    #expect(theme.spacing.md == 999)
    #expect(originalMd != 999)
}

@Test func kataModifyPreservesOriginalTheme() {
    let original = Theme.standard
    var copy = original
    copy.spacing.md = 999

    // 値型なのでオリジナルは変更されない
    #expect(original.spacing.md != 999)
    #expect(copy.spacing.md == 999)
}

// MARK: - Equatable Tests

@Test func themeEquatable() {
    let theme1 = Theme.standard
    let theme2 = Theme.standard
    #expect(theme1 == theme2)
}

@Test func themeNotEqualAfterModification() {
    let theme1 = Theme.standard
    let theme2 = Theme.standard.modified { $0.spacing.md = 999 }
    #expect(theme1 != theme2)
}

@Test func spacingEquatable() {
    let spacing1 = Spacing.standard
    let spacing2 = Spacing.standard
    #expect(spacing1 == spacing2)
}

@Test func colorsEquatable() {
    let colors1 = Colors.standard
    let colors2 = Colors.standard
    #expect(colors1 == colors2)
}

@Test func colorsWithDifferentInitializersAreNotEqual() {
    // SwiftUIのColorは生成方法が異なると等しくならない（制限事項）
    let color1 = Color.red
    let color2 = Color(red: 1, green: 0, blue: 0)
    #expect(color1 != color2)
}

@Test func fontsWithDifferentInitializersAreNotEqual() {
    // SwiftUIのFontも生成方法が異なると等しくならない（制限事項）
    let font1 = Font.body
    let font2 = Font.system(size: 17)
    #expect(font1 != font2)
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
