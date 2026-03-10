import SwiftUI
import StorybookKit

@main
struct DemoApp: App {
    @State private var selectedTab = 0

    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                ContentView()
                    .tabItem {
                        Label("Demo", systemImage: "paintpalette")
                    }
                    .tag(0)

                Storybook()
                    .tabItem {
                        Label("Previews", systemImage: "rectangle.stack")
                    }
                    .tag(1)
            }
        }
    }
}
