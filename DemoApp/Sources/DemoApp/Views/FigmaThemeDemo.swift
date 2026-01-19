import SwiftUI

struct FigmaThemeDemo: View {
    @Environment(\.theme) private var theme

    var body: some View {
        ScrollView {
            VStack(spacing: theme.spacing.md) {
                headerSection
                previewSection
                tokensSection
                codeSection
            }
            .padding(\.lg)
        }
        .background(\.surfaceVariant)
        .navigationTitle("Figma Theme")
        .kata(theme: .figma)
    }

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: theme.spacing.sm) {
            Text("Figma Integration Demo")
                .textStyle(\.title)
                .foreground(\.primary)
            Text("This theme was generated from Figma Design Tokens using AI.")
                .textStyle(\.body)
                .foreground(\.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(\.lg)
        .background(\.surface)
        .cornerRadius(\.lg)
    }

    private var previewSection: some View {
        VStack(alignment: .leading, spacing: theme.spacing.md) {
            Text("Preview")
                .textStyle(\.headline)
                .foreground(\.primary)

            HStack(spacing: theme.spacing.sm) {
                Button("Primary") {}
                    .buttonStyle(.borderedProminent)
                    .tint(\.primary)

                Button("Secondary") {}
                    .buttonStyle(.bordered)
                    .tint(\.secondary)
            }

            HStack(spacing: theme.spacing.sm) {
                colorSwatch("Primary", color: \.primary)
                colorSwatch("Secondary", color: \.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(\.lg)
        .background(\.surface)
        .cornerRadius(\.lg)
    }

    private func colorSwatch(_ name: String, color: KeyPath<Colors, Color>) -> some View {
        VStack(spacing: theme.spacing.xs) {
            RoundedRectangle(cornerRadius: theme.radius.sm)
                .fill(theme.colors(for: .light)[keyPath: color])
                .frame(width: 60, height: 60)
            Text(name)
                .textStyle(\.caption)
                .foreground(\.secondary)
        }
    }

    private var tokensSection: some View {
        VStack(alignment: .leading, spacing: theme.spacing.md) {
            Text("Applied Tokens")
                .textStyle(\.headline)
                .foreground(\.primary)

            VStack(alignment: .leading, spacing: theme.spacing.sm) {
                tokenRow("primary", "#6200EE")
                tokenRow("secondary", "#03DAC6")
                tokenRow("spacing.sm", "8pt")
                tokenRow("spacing.md", "16pt")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(\.lg)
        .background(\.surface)
        .cornerRadius(\.lg)
    }

    private func tokenRow(_ name: String, _ value: String) -> some View {
        HStack {
            Text(name)
                .textStyle(\.body)
                .foreground(\.primary)
            Spacer()
            Text(value)
                .textStyle(\.body)
                .foreground(\.secondary)
        }
    }

    private var codeSection: some View {
        VStack(alignment: .leading, spacing: theme.spacing.md) {
            Text("Generated Code")
                .textStyle(\.headline)
                .foreground(\.primary)

            ScrollView(.horizontal, showsIndicators: false) {
                Text("""
                let figmaTheme = Theme.standard.modified {
                    $0.lightColors.primary = Color(hex: "#6200EE")
                    $0.lightColors.secondary = Color(hex: "#03DAC6")
                    $0.spacing.sm = 8
                    $0.spacing.md = 16
                }

                ContentView()
                    .kata(theme: figmaTheme)
                """)
                .textStyle(\.footnote)
                .foreground(\.primary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(\.lg)
        .background(\.surface)
        .cornerRadius(\.lg)
    }
}

#Preview {
    NavigationStack {
        FigmaThemeDemo()
    }
}
