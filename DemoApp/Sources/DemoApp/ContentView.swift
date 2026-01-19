import SwiftUI
import Kata

public struct ContentView: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        ColorsShowcase()
                    } label: {
                        Label("Colors", systemImage: "paintpalette")
                    }

                    NavigationLink {
                        TypographyShowcase()
                    } label: {
                        Label("Typography", systemImage: "textformat")
                    }

                    NavigationLink {
                        SpacingShowcase()
                    } label: {
                        Label("Spacing & Radius", systemImage: "square.resize")
                    }
                } header: {
                    Text("Design Tokens").textStyle(\.caption)
                }

                Section {
                    NavigationLink {
                        ThemeCustomization()
                    } label: {
                        Label("Theme Customization", systemImage: "slider.horizontal.3")
                    }

                    NavigationLink {
                        FigmaThemeDemo()
                    } label: {
                        Label("Figma Theme", systemImage: "paintbrush")
                    }

                    NavigationLink {
                        ComponentsShowcase()
                    } label: {
                        Label("Components", systemImage: "square.stack.3d.up")
                    }
                } header: {
                    Text("Advanced").textStyle(\.caption)
                }
            }
            .navigationTitle("Kata Demo")
        }
    }
}

#Preview("Light Mode") {
    ContentView().environment(\.colorScheme, .light)
}

#Preview("Dark Mode") {
    ContentView().environment(\.colorScheme, .dark)
}
