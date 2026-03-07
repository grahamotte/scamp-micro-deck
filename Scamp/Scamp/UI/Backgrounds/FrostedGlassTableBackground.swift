import AppKit
import SwiftUI

struct FrostedGlassTableTheme: TableThemeDefinition {
    static let displayName = "Frosted Glass"
    static let usesWindowTranslucency = true
    static var background: AnyView { AnyView(FrostedGlassTableBackground()) }
}

struct FrostedGlassTableBackground: View {
    var body: some View {
        Rectangle()
            .fill(.ultraThinMaterial)
    }
}
