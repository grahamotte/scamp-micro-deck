import SwiftUI

struct BlackControlsTheme {
    private static let controlButtonWidth: CGFloat = 44
    private static let controlButtonHeight: CGFloat = 36
    private static let controlButtonCornerRadius: CGFloat = 7
    private static let controlButtonIconSize: CGFloat = 11.5

    static let palette = ControlsThemePalette(
        tonearmHead: TonearmHeadThemePart { geometry in
            RoundedRectangle(cornerRadius: max(2, geometry.headHeight * 0.1), style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.2, green: 0.23, blue: 0.29),
                            Color(red: 0.11, green: 0.13, blue: 0.17),
                            Color(red: 0.16, green: 0.19, blue: 0.24)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: geometry.headWidth, height: geometry.headHeight)
                .overlay(
                    RoundedRectangle(cornerRadius: max(2, geometry.headHeight * 0.1), style: .continuous)
                        .stroke(Color.white.opacity(0.09), lineWidth: 1)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: max(2, geometry.headHeight * 0.1), style: .continuous)
                        .stroke(Color(red: 0.63, green: 0.84, blue: 0.96).opacity(0.16), lineWidth: 0.7)
                        .padding(1.4)
                )
        },
        tonearmArm: TonearmArmThemePart { armPath, geometry in
            armPath
                .stroke(style: StrokeStyle(lineWidth: geometry.armShaftThickness, lineCap: .square, lineJoin: .round))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color(red: 0.22, green: 0.25, blue: 0.31),
                            Color(red: 0.12, green: 0.14, blue: 0.18)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .shadow(color: .black.opacity(0.35), radius: 3, x: 0, y: 2)
                .overlay {
                    armPath
                        .stroke(
                            Color(red: 0.7, green: 0.86, blue: 0.98).opacity(0.13),
                            style: StrokeStyle(
                                lineWidth: max(1, geometry.armShaftThickness * 0.12),
                                lineCap: .square,
                                lineJoin: .round
                            )
                        )
                }
        },
        tonearmPeg: TonearmPegThemePart { geometry in
            let pegSize = max(14, geometry.recordDiameter * 0.05)

            RoundedRectangle(cornerRadius: max(3, pegSize * 0.16), style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.19, green: 0.22, blue: 0.28),
                            Color(red: 0.09, green: 0.11, blue: 0.15)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: pegSize, height: pegSize)
                .overlay(
                    RoundedRectangle(cornerRadius: max(3, pegSize * 0.16), style: .continuous)
                        .stroke(Color(red: 0.66, green: 0.84, blue: 0.95).opacity(0.16), lineWidth: 1)
                )
        },
        tonearmHolder: TonearmHolderThemePart { geometry in
            RoundedRectangle(cornerRadius: max(6, geometry.holderDiameter * 0.16), style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.15, green: 0.17, blue: 0.22),
                            Color(red: 0.08, green: 0.09, blue: 0.12)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: geometry.holderDiameter, height: geometry.holderDiameter)
                .overlay(
                    RoundedRectangle(cornerRadius: max(6, geometry.holderDiameter * 0.16), style: .continuous)
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color(red: 0.7, green: 0.86, blue: 0.98).opacity(0.17),
                                    Color.black.opacity(0.45)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            lineWidth: max(1.2, geometry.recordDiameter * 0.002)
                        )
                        .padding(geometry.holderDiameter * 0.08)
                )
        },
        tonearmCounterweight: TonearmCounterweightThemePart { geometry in
            RoundedRectangle(cornerRadius: max(3, geometry.counterweightHeight * 0.18), style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.19, green: 0.21, blue: 0.27),
                            Color(red: 0.09, green: 0.11, blue: 0.15)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(
                    width: geometry.counterweightWidth,
                    height: geometry.counterweightHeight
                )
                .overlay(
                    RoundedRectangle(cornerRadius: max(3, geometry.counterweightHeight * 0.18), style: .continuous)
                        .stroke(Color(red: 0.67, green: 0.85, blue: 0.97).opacity(0.14), lineWidth: 1)
                )
        },
        transportButtons: ControlsThemeTransportButtons(
            makeEjectButton: { action in
                BlackTransportButton(
                    icon: "eject.fill",
                    buttonWidth: Self.controlButtonWidth,
                    buttonHeight: Self.controlButtonHeight,
                    cornerRadius: Self.controlButtonCornerRadius,
                    iconSize: Self.controlButtonIconSize,
                    action: action
                )
            },
            makePreviousButton: { action in
                BlackTransportButton(
                    icon: "backward.fill",
                    buttonWidth: Self.controlButtonWidth,
                    buttonHeight: Self.controlButtonHeight,
                    cornerRadius: Self.controlButtonCornerRadius,
                    iconSize: Self.controlButtonIconSize,
                    action: action
                )
            },
            makePlayPauseButton: { action in
                BlackTransportButton(
                    icon: "playpause.fill",
                    buttonWidth: Self.controlButtonWidth,
                    buttonHeight: Self.controlButtonHeight,
                    cornerRadius: Self.controlButtonCornerRadius,
                    iconSize: Self.controlButtonIconSize,
                    action: action
                )
            },
            makeNextButton: { action in
                BlackTransportButton(
                    icon: "forward.fill",
                    buttonWidth: Self.controlButtonWidth,
                    buttonHeight: Self.controlButtonHeight,
                    cornerRadius: Self.controlButtonCornerRadius,
                    iconSize: Self.controlButtonIconSize,
                    action: action
                )
            }
        )
    )
}

private struct BlackTransportButton: View {
    let icon: String
    let buttonWidth: CGFloat
    let buttonHeight: CGFloat
    let cornerRadius: CGFloat
    let iconSize: CGFloat
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
        }
        .buttonStyle(
            BlackTransportButtonStyle(
                buttonWidth: buttonWidth,
                buttonHeight: buttonHeight,
                cornerRadius: cornerRadius,
                iconSize: iconSize
            )
        )
    }
}

private struct BlackTransportButtonStyle: ButtonStyle {
    let buttonWidth: CGFloat
    let buttonHeight: CGFloat
    let cornerRadius: CGFloat
    let iconSize: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        let pressOffset = configuration.isPressed ? buttonHeight * 0.05 : 0
        let innerInset = configuration.isPressed ? buttonHeight * 0.16 : buttonHeight * 0.12
        let iconColor = configuration.isPressed
            ? Color(red: 0.72, green: 0.86, blue: 0.95)
            : Color(red: 0.8, green: 0.92, blue: 1)

        return ZStack {
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.16, green: 0.19, blue: 0.25),
                            Color(red: 0.08, green: 0.1, blue: 0.14),
                            Color(red: 0.11, green: 0.13, blue: 0.17)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(
                    LinearGradient(
                        colors: [
                            Color(red: 0.67, green: 0.86, blue: 0.99).opacity(0.22),
                            Color.black.opacity(0.45)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 1
                )

            RoundedRectangle(cornerRadius: max(2, cornerRadius - 1.5), style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.64, green: 0.84, blue: 0.98).opacity(configuration.isPressed ? 0.08 : 0.18),
                            Color.clear
                        ],
                        startPoint: .top,
                        endPoint: .center
                    )
                )
                .padding(1.5)

            RoundedRectangle(cornerRadius: max(4, cornerRadius * 0.7), style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.2, green: 0.24, blue: 0.32),
                            Color(red: 0.1, green: 0.13, blue: 0.18)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(innerInset)
                .offset(y: pressOffset)
                .overlay(
                    RoundedRectangle(cornerRadius: max(4, cornerRadius * 0.7), style: .continuous)
                        .stroke(Color.white.opacity(0.06), lineWidth: 0.8)
                        .padding(innerInset)
                        .offset(y: pressOffset)
                )

            configuration.label
                .font(.system(size: iconSize, weight: .semibold))
                .foregroundStyle(iconColor)
                .offset(y: pressOffset)
                .shadow(color: Color(red: 0.38, green: 0.72, blue: 0.98).opacity(0.24), radius: 2, x: 0, y: 0)
        }
        .frame(width: buttonWidth, height: buttonHeight)
        .contentShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .shadow(
            color: .black.opacity(configuration.isPressed ? 0.25 : 0.4),
            radius: configuration.isPressed ? 1 : 4,
            x: 0,
            y: configuration.isPressed ? 1 : 2
        )
        .animation(.easeOut(duration: 0.08), value: configuration.isPressed)
    }
}
