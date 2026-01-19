import SwiftUI

struct SpacingShowcase: View {
    @Environment(\.theme) private var theme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: theme.spacing.none) {
                spacingSection("Spacing") {
                    SpacingRow(name: "none", keyPath: \.none)
                    SpacingRow(name: "xxs", keyPath: \.xxs)
                    SpacingRow(name: "xs", keyPath: \.xs)
                    SpacingRow(name: "sm", keyPath: \.sm)
                    SpacingRow(name: "md", keyPath: \.md)
                    SpacingRow(name: "lg", keyPath: \.lg)
                    SpacingRow(name: "xl", keyPath: \.xl)
                    SpacingRow(name: "xxl", keyPath: \.xxl)
                    SpacingRow(name: "xxxl", keyPath: \.xxxl)
                }

                radiusSection("Radius") {
                    RadiusRow(name: "none", keyPath: \.none)
                    RadiusRow(name: "xs", keyPath: \.xs)
                    RadiusRow(name: "sm", keyPath: \.sm)
                    RadiusRow(name: "md", keyPath: \.md)
                    RadiusRow(name: "lg", keyPath: \.lg)
                    RadiusRow(name: "xl", keyPath: \.xl)
                    RadiusRow(name: "xxl", keyPath: \.xxl)
                    RadiusRow(name: "full", keyPath: \.full)
                }
            }
            .padding(\.md)
        }
        .background(\.background)
        .navigationTitle("Spacing & Radius")
    }

    @ViewBuilder
    private func spacingSection<Content: View>(_ title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: theme.spacing.none) {
            Text(title).textStyle(\.title3).foreground(\.primary).padding(\.sm)
            VStack(spacing: 1) { content() }.cornerRadius(\.md).padding(\.sm, edges: .bottom)
        }
    }

    @ViewBuilder
    private func radiusSection<Content: View>(_ title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: theme.spacing.none) {
            Text(title).textStyle(\.title3).foreground(\.primary).padding(\.sm)
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: theme.spacing.sm) { content() }
                .padding(\.sm, edges: .bottom)
        }
    }
}

private struct SpacingRow: View {
    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme
    let name: String
    let keyPath: KeyPath<Spacing, CGFloat>

    var body: some View {
        HStack(spacing: theme.spacing.sm) {
            Rectangle()
                .fill(theme.colors(for: colorScheme).primary)
                .frame(width: theme.spacing[keyPath: keyPath], height: 24)
                .frame(maxWidth: 100, alignment: .leading)

            VStack(alignment: .leading, spacing: theme.spacing.xxs) {
                Text("\\.\(name)").textStyle(\.headline).foreground(\.primary)
                Text("\(Int(theme.spacing[keyPath: keyPath]))pt").textStyle(\.caption).foreground(\.secondary)
            }
            Spacer()
        }
        .padding(\.sm)
        .background(\.surface)
    }
}

private struct RadiusRow: View {
    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme
    let name: String
    let keyPath: KeyPath<Radius, CGFloat>

    var body: some View {
        VStack(spacing: theme.spacing.sm) {
            RoundedRectangle(cornerRadius: min(theme.radius[keyPath: keyPath], 32))
                .fill(theme.colors(for: colorScheme).primary)
                .frame(width: 64, height: 64)

            VStack(spacing: theme.spacing.xxs) {
                Text("\\.\(name)").textStyle(\.headline).foreground(\.primary)
                Text("\(Int(theme.radius[keyPath: keyPath]))pt").textStyle(\.caption).foreground(\.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(\.md)
        .background(\.surface)
        .cornerRadius(\.md)
    }
}

#Preview {
    NavigationStack { SpacingShowcase() }
}
