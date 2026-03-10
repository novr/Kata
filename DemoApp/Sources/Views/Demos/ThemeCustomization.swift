import SwiftUI

struct ThemeCustomization: View {
    @Environment(\.theme) private var theme
    @State private var primaryHue: Double = 210
    @State private var saturation: Double = 1.0
    @State private var brightness: Double = 1.0

    private var customColor: Color {
        Color(hue: primaryHue / 360, saturation: saturation, brightness: brightness)
    }

    private var customTheme: Theme {
        Theme.standard.modified {
            $0.lightColors.primary = customColor
            $0.lightColors.info = customColor
            $0.darkColors = Colors.standard.modified {
                $0.primary = customColor.opacity(0.8)
                $0.info = customColor.opacity(0.8)
            }
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: theme.spacing.none) {
                previewCard.padding(\.md)
                controlsSection.padding(\.md)
                codeExample.padding(\.md)
            }
        }
        .background(\.surfaceVariant)
        .navigationTitle("Customization")
        .kata(theme: customTheme)
    }

    private var previewCard: some View {
        VStack(alignment: .leading, spacing: theme.spacing.none) {
            Text("Preview").textStyle(\.title3).foreground(\.primary).padding(\.sm, edges: .bottom)

            VStack(spacing: theme.spacing.md) {
                HStack {
                    Text("Custom Theme").textStyle(\.title).foreground(\.primary)
                    Spacer()
                }
                Text("Toggle system dark mode to see both variants!")
                    .textStyle(\.body).foreground(\.secondary)
                HStack(spacing: theme.spacing.sm) {
                    Button("Primary") {}.buttonStyle(.borderedProminent).tint(\.primary)
                    Button("Secondary") {}.buttonStyle(.bordered).tint(\.primary)
                }
            }
            .padding(\.lg)
            .background(\.surface)
            .cornerRadius(\.lg)
        }
    }

    private var controlsSection: some View {
        VStack(alignment: .leading, spacing: theme.spacing.none) {
            Text("Controls").textStyle(\.title3).foreground(\.primary).padding(\.sm, edges: .bottom)

            VStack(spacing: theme.spacing.md) {
                slider("Hue", value: $primaryHue, range: 0...360, format: "°")
                slider("Saturation", value: $saturation, range: 0...1, format: "%", multiply: 100)
                slider("Brightness", value: $brightness, range: 0...1, format: "%", multiply: 100)
            }
            .padding(\.lg)
            .background(\.surface)
            .cornerRadius(\.lg)
        }
    }

    private func slider(_ title: String, value: Binding<Double>, range: ClosedRange<Double>, format: String, multiply: Double = 1) -> some View {
        VStack(alignment: .leading, spacing: theme.spacing.sm) {
            HStack {
                Text(title).textStyle(\.headline).foreground(\.primary)
                Spacer()
                Text("\(Int(value.wrappedValue * multiply))\(format)").textStyle(\.headline).foreground(\.secondary)
            }
            Slider(value: value, in: range).tint(\.primary)
        }
    }

    private var codeExample: some View {
        VStack(alignment: .leading, spacing: theme.spacing.none) {
            Text("Code").textStyle(\.title3).foreground(\.primary).padding(\.sm, edges: .bottom)

            ScrollView(.horizontal, showsIndicators: false) {
                Text("""
                let custom = Theme.standard.modified {
                    $0.lightColors.primary = Color(hue: \(String(format: "%.2f", primaryHue / 360)), ...)
                    $0.darkColors = Colors.standard.modified { ... }
                }
                ContentView().kata(theme: custom)
                """)
                .textStyle(\.footnote)
                .foreground(\.primary)
                .padding(\.md)
            }
            .background(\.surface)
            .cornerRadius(\.lg)
        }
    }
}

#Preview {
    NavigationStack { ThemeCustomization() }
}
