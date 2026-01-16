import SwiftUI

#if swift(>=5.9)
extension EnvironmentValues {
    @Entry public var theme: Theme = .standard
}
#else
private struct ThemeEnvironmentKey: EnvironmentKey {
    static let defaultValue: Theme = .standard
}

extension EnvironmentValues {
    public var theme: Theme {
        get { self[ThemeEnvironmentKey.self] }
        set { self[ThemeEnvironmentKey.self] = newValue }
    }
}
#endif

extension View {
    public func kata(theme: Theme) -> some View {
        environment(\.theme, theme)
    }

    public func kata() -> some View {
        environment(\.theme, .standard)
    }
}
