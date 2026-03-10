import SwiftUI

// MARK: - Kata Card (DemoApp Components)
// Token-based card container. Filled or outlined variant.

struct KataCard<Content: View>: View {
    @Environment(\.theme) private var theme

    enum Variant {
        case filled
        case outlined
    }

    let variant: Variant
    let content: () -> Content

    init(variant: Variant = .filled, @ViewBuilder content: @escaping () -> Content) {
        self.variant = variant
        self.content = content
    }

    var body: some View {
        content()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(\.md)
            .background(\.surface)
            .cornerRadius(\.md)
            .overlay(
                Group {
                    if variant == .outlined {
                        KataCardOutlineOverlay()
                    }
                }
            )
    }
}

private struct KataCardOutlineOverlay: View {
    @Environment(\.theme) private var theme

    var body: some View {
        RoundedRectangle(cornerRadius: theme.radius.md)
            .strokeBorder(lineWidth: theme.spacing.hairline)
            .foreground(\.outline)
    }
}

// MARK: - Previews

#Preview("Filled") {
    KataCardFilledPreviewContent()
}

#Preview("Outlined") {
    KataCardOutlinedPreviewContent()
}

private struct KataCardFilledPreviewContent: View {
    @Environment(\.theme) private var theme
    var body: some View {
        KataCard {
            VStack(alignment: .leading, spacing: theme.spacing.sm) {
                Text("Card Title").textStyle(\.headline).foreground(\.primary)
                Text("Card body using Kata tokens.").textStyle(\.body).foreground(\.secondary)
            }
        }
        .padding(\.md)
        .background(\.background)
    }
}

private struct KataCardOutlinedPreviewContent: View {
    @Environment(\.theme) private var theme
    var body: some View {
        KataCard(variant: .outlined) {
            VStack(alignment: .leading, spacing: theme.spacing.sm) {
                Text("Outlined Card").textStyle(\.headline).foreground(\.primary)
                Text("Variant with outline border.").textStyle(\.body).foreground(\.secondary)
            }
        }
        .padding(\.md)
        .background(\.background)
    }
}
