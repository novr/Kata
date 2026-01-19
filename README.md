# Kata

A disciplined Design System framework for SwiftUI. No hardcoded values allowed.

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/Kata.git", from: "0.1.0")
]
```

## Quick Start

```swift
import SwiftUI
import Kata

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, Kata!")
                .textStyle(\.title)
                .foreground(\.primary)
            
            Button("Action") { }
                .padding(\.md)
                .background(\.primary)
                .cornerRadius(\.sm)
        }
        .padding(\.lg)
    }
}

// Default theme applied automatically
ContentView()

// Custom theme
ContentView().kata(theme: customTheme)
```

## Design Tokens

### Colors

```swift
.foreground(\.primary)
.background(\.surface)
.tint(\.info)
```

| Token | Usage |
|-------|-------|
| `primary`, `secondary`, `tertiary` | Brand colors |
| `surface`, `surfaceVariant`, `background` | Backgrounds |
| `error`, `success`, `warning`, `info` | Semantic |
| `outline`, `outlineVariant`, `scrim` | Utility |

### Typography

```swift
.textStyle(\.largeTitle)
.textStyle(\.headline)
.textStyle(\.body)
```

| Token | SwiftUI Equivalent |
|-------|-------------------|
| `largeTitle`, `title`, `title2`, `title3` | Titles |
| `headline`, `subheadline` | Headlines |
| `body`, `callout`, `footnote` | Body |
| `caption`, `caption2` | Captions |

### Spacing

```swift
.padding(\.md)
.padding(\.sm, edges: .horizontal)
```

| Token | Value |
|-------|-------|
| `none` | 0 |
| `xxs` | 2 |
| `xs` | 4 |
| `sm` | 8 |
| `md` | 16 |
| `lg` | 24 |
| `xl` | 32 |
| `xxl` | 48 |
| `xxxl` | 64 |

### Radius

```swift
.cornerRadius(\.md)
.cornerRadius(\.full)
```

| Token | Value |
|-------|-------|
| `none` | 0 |
| `xs` | 2 |
| `sm` | 4 |
| `md` | 8 |
| `lg` | 12 |
| `xl` | 16 |
| `xxl` | 24 |
| `full` | 9999 |

### Elevation

```swift
.elevation(\.md)
.elevation(\.lg)
```

| Token | Radius | Offset |
|-------|--------|--------|
| `none` | 0 | 0, 0 |
| `sm` | 2 | 0, 1 |
| `md` | 4 | 0, 2 |
| `lg` | 8 | 0, 4 |
| `xl` | 16 | 0, 8 |

## Theme Customization

### App Entry Point

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .kata { theme in
                    theme.lightColors.primary = .blue
                    theme.spacing.md = 20
                }
        }
    }
}
```

### Custom Theme

```swift
let customTheme = Theme.standard.modified {
    $0.lightColors.primary = .blue
    $0.darkColors = Colors.standard.modified {
        $0.primary = .cyan
    }
}

ContentView().kata(theme: customTheme)
```

### Modify Current Theme

```swift
// Modify the current theme for child views
SomeView()
    .kata { $0.spacing.md = 24 }
```

### Nested Theme Modifications

Child views inherit the parent's theme and can modify it further:

```swift
// Parent applies theme
ContentView()
    .kata { $0.spacing.md = 20 }

// Inside ContentView, child inherits md = 20
struct ContentView: View {
    var body: some View {
        ChildView()
            .kata { $0.spacing.lg = 32 }  // md = 20 (inherited), lg = 32
    }
}
```

Each `.kata { }` receives the current theme from its parent, allowing incremental customization.

### Equatable Limitations

All theme types conform to `Equatable`, but SwiftUI's `Color` and `Font` comparison has limitations:

```swift
Color.red == Color.red                      // true
Color.red == Color(red: 1, green: 0, blue: 0)  // false ⚠️
```

Use the same tokens consistently to ensure correct equality checks.

## Dark Mode

Kata uses System Colors by default, automatically adapting to light/dark mode.

For custom dark mode colors, set `darkColors` in your theme (see [Custom Theme](#custom-theme)).

## Direct Access

For VStack/HStack spacing:

```swift
@Environment(\.theme) private var theme

VStack(spacing: theme.spacing.sm) {
    // ...
}
```

## SwiftLint Rules

Add these custom rules to your `.swiftlint.yml` to enforce Kata token usage:

```yaml
custom_rules:
  kata_no_hardcoded_padding:
    name: "Use Kata Spacing Tokens"
    regex: '\.padding\s*\(\s*\d+\.?\d*\s*\)'
    message: "Use Kata spacing: .padding(\\.md)"
    severity: warning

  kata_no_hardcoded_padding_edges:
    name: "Use Kata Spacing Tokens"
    regex: '\.padding\s*\(\s*\.(all|horizontal|vertical|top|bottom|leading|trailing)\s*,\s*\d+\.?\d*\s*\)'
    message: "Use Kata spacing: .padding(\\.md, edges: .horizontal)"
    severity: warning

  kata_no_hardcoded_radius:
    name: "Use Kata Radius Tokens"
    regex: '\.cornerRadius\s*\(\s*\d+\.?\d*\s*\)'
    message: "Use Kata radius: .cornerRadius(\\.md)"
    severity: warning

  kata_no_hardcoded_frame_spacing:
    name: "Use Kata Spacing Tokens"
    regex: '(VStack|HStack|LazyVStack|LazyHStack)\s*\(\s*spacing\s*:\s*\d+\.?\d*\s*\)'
    message: "Consider using Kata spacing tokens for consistency"
    severity: warning
```

## Requirements

- iOS 15.0+
- macOS 13.0+
- Swift 6.0+

## License

MIT License. See [LICENSE](LICENSE) for details.
