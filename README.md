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

```swift
let customTheme = Theme.standard.modified {
    $0.lightColors.primary = .blue
    $0.darkColors = Colors.standard.modified {
        $0.primary = .cyan
    }
}

ContentView().kata(theme: customTheme)
```

## Dark Mode

Kata uses System Colors by default, automatically adapting to light/dark mode.

For custom dark mode colors:

```swift
let theme = Theme.standard.modified {
    $0.lightColors.primary = .blue
    $0.darkColors = Colors.standard.modified {
        $0.primary = .cyan
    }
}
```

## Direct Access

For VStack/HStack spacing:

```swift
@Environment(\.theme) private var theme

VStack(spacing: theme.spacing.sm) {
    // ...
}
```

## Figma Integration

Convert Figma Design Tokens to Kata Theme using AI:

**Figma Tokens JSON:**

```json
{
  "colors": {
    "primary": { "value": "#6200EE" },
    "secondary": { "value": "#03DAC6" }
  },
  "spacing": {
    "sm": { "value": "8" },
    "md": { "value": "16" }
  }
}
```

**AI Prompt:**

```
Convert this Figma Design Tokens JSON to Kata Theme:
[paste JSON]

Output format:
let theme = Theme.standard.modified { ... }
Use Color(hex:) for colors.
```

**Generated Code:**

```swift
let figmaTheme = Theme.standard.modified {
    $0.lightColors.primary = Color(hex: "#6200EE")
    $0.lightColors.secondary = Color(hex: "#03DAC6")
    $0.spacing.sm = 8
    $0.spacing.md = 16
}
```

## SwiftLint Rules

Copy `.swiftlint.yml` custom rules to enforce Kata token usage:

```yaml
custom_rules:
  kata_no_hardcoded_color:
    regex: '\.(foregroundColor|foregroundStyle)\s*\(\s*\.(red|blue|...)'
    message: "Use Kata color tokens: .foreground(\\.primary)"
```

## Requirements

- iOS 15.0+
- macOS 13.0+
- Swift 6.0+

## License

MIT License. See [LICENSE](LICENSE) for details.
