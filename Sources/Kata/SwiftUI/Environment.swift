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

    public func kata(modify: @escaping (inout Theme) -> Void) -> some View {
        modifier(KataModifyModifier(modify: modify))
    }
}

private struct KataModifyModifier: ViewModifier {
    @Environment(\.theme) private var currentTheme
    let modify: (inout Theme) -> Void

    func body(content: Content) -> some View {
        var newTheme = currentTheme
        modify(&newTheme)
        return content.environment(\.theme, newTheme)
    }
}
