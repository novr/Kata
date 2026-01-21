// MARK: - Kata Design System Framework
// The guardian of type safety and consistency between Figma tokens and SwiftUI.

/// Kata is a Design System Framework for iOS that enforces strict discipline,
/// type safety, and absolute consistency between Figma tokens and SwiftUI implementation.
///
/// ## Philosophy
///
/// 1. **Struct Over Protocol** - All theme data uses `public struct` conforming to `Sendable` and `Modifiable`.
/// 2. **No Magic Numbers** - Hardcoded values like `16.0`, `Color.red`, or `Font.system` are forbidden.
/// 3. **KeyPath Precision** - Clean, declarative syntax using `KeyPath` to reference tokens.
/// 4. **Zero-Config Readiness** - `Theme.standard` provides defaults for instant Preview support.
///
/// ## Quick Start
///
/// ```swift
/// import Kata
///
/// struct ContentView: View {
///     var body: some View {
///         VStack {
///             Text("Welcome")
///                 .textStyle(\.largeTitle)
///                 .foreground(\.primary)
///
///             Text("Body content here")
///                 .textStyle(\.body)
///                 .foreground(\.secondary)
///         }
///         .padding(\.md)
///         .background(\.background)
///     }
/// }
/// ```
///
/// ## Custom Themes
///
/// ```swift
/// let customTheme = Theme.standard.modified {
///     $0.lightColors.primary = .purple
///     $0.lightColors.secondary = .pink
///     $0.darkColors = Colors.standard.modified {
///         $0.primary = .cyan
///         $0.background = .black
///     }
/// }
///
/// ContentView()
///     .kata(theme: customTheme)
/// ```
///
/// ## Available Modifiers
///
/// ### Colors
/// - `.foreground(\.primary)` - Set foreground color
/// - `.background(\.surface)` - Set background color
/// - `.tint(\.primary)` - Set tint color
/// - `.border(\.outline, width: 1)` - Set border color
/// - `.overlay(\.scrim)` - Set overlay color
///
/// ### Typography
/// - `.textStyle(\.largeTitle)` - Set text style
///
/// ### Spacing
/// - `.padding(\.md)` - Add padding
/// - `.padding(\.sm, edges: .horizontal)` - Add edge-specific padding
/// - `.cornerRadius(\.lg)` - Set corner radius
/// - `.frame(width: \.xl)` - Set frame width
/// - `.frame(height: \.md)` - Set frame height
/// - `.frame(width: \.xl, height: \.xl)` - Set frame size
///
/// ### Elevation
/// - `.elevation(\.sm)` - Add subtle shadow
/// - `.elevation(\.md)` - Add medium shadow
/// - `.elevation(\.lg)` - Add prominent shadow

// Re-export all public types
@_exported import struct SwiftUI.Color
@_exported import struct SwiftUI.Font
