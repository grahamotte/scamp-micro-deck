import SwiftUI

struct RainbowTableTheme: TableThemeDefinition {
    static let displayName = "Rainbow"
    static let usesWindowTranslucency = false
    static var background: AnyView { AnyView(RainbowTableBackground()) }
}

struct RainbowTableBackground: View {
    private let stripeColors: [Color] = [
        Color(red: 0.89, green: 0.01, blue: 0.01),
        Color(red: 1.00, green: 0.55, blue: 0.00),
        Color(red: 1.00, green: 0.93, blue: 0.00),
        Color(red: 0.00, green: 0.50, blue: 0.15),
        Color(red: 0.14, green: 0.25, blue: 0.56),
        Color(red: 0.45, green: 0.16, blue: 0.51)
    ]

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ForEach(Array(stripeColors.enumerated()), id: \.offset) { _, color in
                    Rectangle()
                        .fill(color)
                }
            }

            LinearGradient(
                colors: [
                    Color.white.opacity(0.18),
                    Color.clear,
                    Color.black.opacity(0.22)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .blendMode(.softLight)

            LinearGradient(
                colors: [
                    Color.white.opacity(0.2),
                    Color.clear,
                    Color.black.opacity(0.25)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .blendMode(.overlay)
            .opacity(0.35)
        }
    }
}
