import SwiftUI

// MARK: - Kata Alert (DemoApp Components)
// Inline status message using semantic color (info / success / warning / error).

struct KataAlert: View {
    @Environment(\.theme) private var theme

    enum AlertType {
        case info
        case success
        case warning
        case error
    }

    let message: String
    let type: AlertType

    var body: some View {
        HStack(spacing: theme.spacing.sm) {
            Image(systemName: iconName).foreground(colorKeyPath)
            Text(message).textStyle(\.callout).foreground(\.primary)
            Spacer()
        }
        .padding(\.md)
        .background(\.surface)
        .cornerRadius(\.sm)
        .overlay(KataAlertBorderOverlay(colorKeyPath: colorKeyPath))
    }

    private var iconName: String {
        switch type {
        case .info: return "info.circle.fill"
        case .success: return "checkmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .error: return "xmark.circle.fill"
        }
    }

    private var colorKeyPath: KeyPath<Colors, Color> {
        switch type {
        case .info: return \.info
        case .success: return \.success
        case .warning: return \.warning
        case .error: return \.error
        }
    }
}

private struct KataAlertBorderOverlay: View {
    @Environment(\.theme) private var theme
    let colorKeyPath: KeyPath<Colors, Color>

    var body: some View {
        RoundedRectangle(cornerRadius: theme.radius.sm)
            .strokeBorder(lineWidth: theme.spacing.hairline)
            .foreground(colorKeyPath)
    }
}

// MARK: - Previews

#Preview("Info") {
    KataAlert(message: "This is an informational message.", type: .info)
        .padding(\.md)
        .background(\.background)
}

#Preview("Success / Warning / Error") {
    KataAlertVariantsPreviewContent()
}

private struct KataAlertVariantsPreviewContent: View {
    @Environment(\.theme) private var theme
    var body: some View {
        VStack(spacing: theme.spacing.sm) {
            KataAlert(message: "Operation completed successfully!", type: .success)
            KataAlert(message: "Please review before continuing.", type: .warning)
            KataAlert(message: "An error occurred. Please try again.", type: .error)
        }
        .padding(\.md)
        .background(\.background)
    }
}
