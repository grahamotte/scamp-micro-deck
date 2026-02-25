import SwiftUI

struct SilverControlsTheme {
    private static let controlButtonDiameter: CGFloat = 40
    private static let controlButtonIconSize: CGFloat = 11

    static let palette = ControlsThemePalette(
        tonearmHead: TonearmHeadThemePart { geometry in
            RoundedRectangle(cornerRadius: max(2.5, geometry.headHeight * 0.2), style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [Color(white: 0.87), Color(white: 0.66), Color(white: 0.82)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: geometry.headWidth, height: geometry.headHeight)
                .overlay(
                    RoundedRectangle(cornerRadius: max(2.5, geometry.headHeight * 0.2), style: .continuous)
                        .stroke(Color.black.opacity(0.22), lineWidth: 1)
                )
        },
        tonearmArm: TonearmArmThemePart { armPath, geometry in
            armPath
                .stroke(style: StrokeStyle(lineWidth: geometry.armShaftThickness, lineCap: .round, lineJoin: .round))
                .foregroundStyle(
                    LinearGradient(
                        colors: [Color(white: 0.88), Color(white: 0.64), Color(white: 0.82)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .shadow(color: .black.opacity(0.28), radius: 4, x: 0, y: 2)
                .overlay {
                    armPath
                        .stroke(
                            Color.black.opacity(0.18),
                            style: StrokeStyle(
                                lineWidth: max(1.2, geometry.armShaftThickness * 0.14),
                                lineCap: .round,
                                lineJoin: .round
                            )
                        )
                }
        },
        tonearmPeg: TonearmPegThemePart { geometry in
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color(white: 0.9), Color(white: 0.58)],
                        center: .topLeading,
                        startRadius: 2,
                        endRadius: max(8, geometry.recordDiameter * 0.022)
                    )
                )
                .frame(
                    width: max(14, geometry.recordDiameter * 0.05),
                    height: max(14, geometry.recordDiameter * 0.05)
                )
                .overlay(
                    Circle()
                        .stroke(Color.black.opacity(0.22), lineWidth: 1)
                )
        },
        tonearmHolder: TonearmHolderThemePart { geometry in
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color(white: 0.82), Color(white: 0.52)],
                        center: .topLeading,
                        startRadius: geometry.holderDiameter * 0.08,
                        endRadius: geometry.holderDiameter * 0.62
                    )
                )
                .frame(width: geometry.holderDiameter, height: geometry.holderDiameter)
                .overlay(
                    Circle()
                        .stroke(Color.black.opacity(0.24), lineWidth: max(1.2, geometry.recordDiameter * 0.002))
                        .padding(geometry.holderDiameter * 0.08)
                )
        },
        tonearmCounterweight: TonearmCounterweightThemePart { geometry in
            Capsule()
                .fill(
                    LinearGradient(
                        colors: [Color(white: 0.74), Color(white: 0.54)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(
                    width: geometry.counterweightWidth,
                    height: geometry.counterweightHeight
                )
                .overlay(
                    Capsule()
                        .stroke(Color.black.opacity(0.3), lineWidth: 1)
                )
        },
        transportButtons: ControlsThemeTransportButtons(
            makeEjectButton: { action in
                SilverTransportButton(
                    icon: "eject.fill",
                    buttonDiameter: Self.controlButtonDiameter,
                    iconSize: Self.controlButtonIconSize,
                    action: action
                )
            },
            makePreviousButton: { action in
                SilverTransportButton(
                    icon: "backward.fill",
                    buttonDiameter: Self.controlButtonDiameter,
                    iconSize: Self.controlButtonIconSize,
                    action: action
                )
            },
            makePlayPauseButton: { action in
                SilverTransportButton(
                    icon: "playpause.fill",
                    buttonDiameter: Self.controlButtonDiameter,
                    iconSize: Self.controlButtonIconSize,
                    action: action
                )
            },
            makeNextButton: { action in
                SilverTransportButton(
                    icon: "forward.fill",
                    buttonDiameter: Self.controlButtonDiameter,
                    iconSize: Self.controlButtonIconSize,
                    action: action
                )
            }
        )
    )
}

private struct SilverTransportButton: View {
    let icon: String
    let buttonDiameter: CGFloat
    let iconSize: CGFloat
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
        }
        .buttonStyle(
            SilverTransportButtonStyle(
                buttonDiameter: buttonDiameter,
                iconSize: iconSize
            )
        )
    }
}

private struct SilverTransportButtonStyle: ButtonStyle {
    let buttonDiameter: CGFloat
    let iconSize: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        let centerOffset = configuration.isPressed ? buttonDiameter * 0.05 : 0
        let centerShadowRadius = configuration.isPressed ? buttonDiameter * 0.02 : buttonDiameter * 0.08
        let centerShadowY = configuration.isPressed ? buttonDiameter * 0.02 : buttonDiameter * 0.05

        return ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [Color(white: 0.9), Color(white: 0.67), Color(white: 0.83)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            Circle()
                .stroke(
                    LinearGradient(
                        colors: [Color.white.opacity(0.7), Color.black.opacity(0.3)],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 1.2
                )

            Circle()
                .stroke(Color.white.opacity(0.3), lineWidth: 1)
                .padding(buttonDiameter * 0.12)

            Circle()
                .fill(
                    LinearGradient(
                        colors: [Color(white: 0.96), Color(white: 0.75), Color(white: 0.86)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(buttonDiameter * 0.18)
                .offset(y: centerOffset)
                .shadow(
                    color: .black.opacity(0.2),
                    radius: centerShadowRadius,
                    x: 0,
                    y: centerShadowY
                )

            configuration.label
                .font(.system(size: iconSize, weight: .semibold))
                .foregroundStyle(Color(white: 0.29))
                .offset(y: centerOffset)
        }
        .frame(width: buttonDiameter, height: buttonDiameter)
        .contentShape(Circle())
        .animation(.easeOut(duration: 0.08), value: configuration.isPressed)
    }
}
