import SwiftUI
import Kata

struct TypographyShowcase: View {
    @Environment(\.theme) private var theme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: theme.spacing.none) {
                typographySection("Titles") {
                    TypographyRow(name: "largeTitle", keyPath: \.largeTitle)
                    TypographyRow(name: "title", keyPath: \.title)
                    TypographyRow(name: "title2", keyPath: \.title2)
                    TypographyRow(name: "title3", keyPath: \.title3)
                }

                typographySection("Headlines") {
                    TypographyRow(name: "headline", keyPath: \.headline)
                    TypographyRow(name: "subheadline", keyPath: \.subheadline)
                }

                typographySection("Body") {
                    TypographyRow(name: "body", keyPath: \.body)
                    TypographyRow(name: "callout", keyPath: \.callout)
                    TypographyRow(name: "footnote", keyPath: \.footnote)
                }

                typographySection("Captions") {
                    TypographyRow(name: "caption", keyPath: \.caption)
                    TypographyRow(name: "caption2", keyPath: \.caption2)
                }
            }
            .padding(\.md)
        }
        .background(\.background)
        .navigationTitle("Typography")
    }

    @ViewBuilder
    private func typographySection<Content: View>(
        _ title: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
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

private struct TypographyRow: View {
    @Environment(\.theme) private var theme
    let name: String
    let keyPath: KeyPath<Typography, Font>

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.xs) {
            Text("The quick brown fox")
                .textStyle(keyPath)
                .foreground(\.primary)

            Text("\\.\(name)")
                .textStyle(\.caption)
                .foreground(\.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(\.md)
        .background(\.surface)
    }
}

#Preview {
    NavigationStack { TypographyShowcase() }
}
