import SwiftUI
import Kata

struct ColorsShowcase: View {
    @Environment(\.theme) private var theme

    var body: some View {
        ScrollView {
            VStack(spacing: theme.spacing.none) {
                colorSection("Primary") {
                    ColorRow(name: "primary", keyPath: \.primary)
                    ColorRow(name: "secondary", keyPath: \.secondary)
                    ColorRow(name: "tertiary", keyPath: \.tertiary)
                }

                colorSection("Surface") {
                    ColorRow(name: "surface", keyPath: \.surface)
                    ColorRow(name: "surfaceVariant", keyPath: \.surfaceVariant)
                    ColorRow(name: "background", keyPath: \.background)
                }

                colorSection("Semantic") {
                    ColorRow(name: "error", keyPath: \.error)
                    ColorRow(name: "success", keyPath: \.success)
                    ColorRow(name: "warning", keyPath: \.warning)
                    ColorRow(name: "info", keyPath: \.info)
                }

                colorSection("Utility") {
                    ColorRow(name: "outline", keyPath: \.outline)
                    ColorRow(name: "outlineVariant", keyPath: \.outlineVariant)
                    ColorRow(name: "scrim", keyPath: \.scrim)
                }
            }
            .padding(\.md)
        }
        .background(\.background)
        .navigationTitle("Colors")
    }

    @ViewBuilder
    private func colorSection<Content: View>(_ title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: theme.spacing.none) {
            Text(title)
                .textStyle(\.title3)
                .foreground(\.primary)
                .padding(\.sm)

            VStack(spacing: 1) { content() }
                .cornerRadius(\.md)
                .padding(\.sm, edges: .bottom)
        }
    }
}

private struct ColorRow: View {
    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    let name: String
    let keyPath: KeyPath<Colors, Color>

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: theme.radius.sm)
                .fill(theme.colors(for: colorScheme)[keyPath: keyPath])
                .frame(width: 44, height: 44)
                .overlay(
                    RoundedRectangle(cornerRadius: theme.radius.sm)
                        .strokeBorder(theme.colors(for: colorScheme).outline, lineWidth: 1)
                )

            VStack(alignment: .leading, spacing: theme.spacing.xxs) {
                Text("\\.\(name)")
                    .textStyle(\.headline)
                    .foreground(\.primary)

                Text("colors.\(name)")
                    .textStyle(\.caption)
                    .foreground(\.secondary)
            }

            Spacer()
        }
        .padding(\.sm)
        .background(\.surface)
    }
}

#Preview {
    NavigationStack { ColorsShowcase() }
}
