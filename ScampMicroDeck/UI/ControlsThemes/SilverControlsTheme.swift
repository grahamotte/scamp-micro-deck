import SwiftUI

// Identity: vintage hi-fi brushed aluminum (think Technics SL-1200 / silver-faced
// Marantz). Cool-neutral satin surfaces, soft machined grain, sharp anodized
// bezels, and recessed pro-audio transport keys. Strictly metallic — no
// chromatic accents — so the surface itself is the personality.

private let silverHighlight = Color(red: 0.96, green: 0.96, blue: 0.96)
private let silverLight     = Color(red: 0.85, green: 0.85, blue: 0.85)
private let silverMid       = Color(red: 0.72, green: 0.72, blue: 0.72)
private let silverShadow    = Color(red: 0.50, green: 0.50, blue: 0.50)
private let silverDeep      = Color(red: 0.28, green: 0.28, blue: 0.28)
private let silverBezelDark = Color(red: 0.16, green: 0.16, blue: 0.16)

struct SilverControlsTheme: ControlsThemeDefinition {
    static let displayName = "Silver"

    private static let buttonDiameter: CGFloat = 46
    private static let buttonIconSize: CGFloat = 14

    static let palette = ControlsThemePalette(
        tonearmHead: TonearmHeadThemePart { geometry in
            let cornerRadius = max(2, geometry.headHeight * 0.16)
            let dimpleSize = max(2.2, geometry.headHeight * 0.18)

            ZStack {
                BrushedAluminumPanel(
                    grainOrientation: .horizontal,
                    seed: 11,
                    grainDensity: 0.45,
                    highlightOpacity: 0.05,
                    shadowOpacity: 0.03
                )
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))

                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .strokeBorder(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.55),
                                Color.white.opacity(0.10),
                                Color.black.opacity(0.45)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 1
                    )

                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(silverBezelDark.opacity(0.55), lineWidth: 0.5)

                HStack {
                    MachinedDimple(diameter: dimpleSize)
                    Spacer(minLength: 0)
                    MachinedDimple(diameter: dimpleSize)
                }
                .padding(.horizontal, geometry.headWidth * 0.14)
            }
            .frame(width: geometry.headWidth, height: geometry.headHeight)
            .shadow(
                color: .black.opacity(0.32),
                radius: max(2, geometry.recordDiameter * 0.005),
                x: 0,
                y: max(1, geometry.recordDiameter * 0.0025)
            )
        },
        tonearmArm: TonearmArmThemePart { armPath, geometry in
            let thickness = geometry.armShaftThickness

            ZStack {
                armPath
                    .stroke(style: StrokeStyle(lineWidth: thickness, lineCap: .round, lineJoin: .round))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                silverHighlight,
                                silverLight,
                                silverMid,
                                silverShadow
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .shadow(color: .black.opacity(0.32), radius: 3, x: 0, y: 2)

                armPath
                    .stroke(
                        Color.white.opacity(0.55),
                        style: StrokeStyle(
                            lineWidth: max(0.6, thickness * 0.16),
                            lineCap: .round,
                            lineJoin: .round
                        )
                    )
                    .offset(y: -thickness * 0.32)
                    .blur(radius: 0.3)

                armPath
                    .stroke(
                        Color.black.opacity(0.32),
                        style: StrokeStyle(
                            lineWidth: max(0.5, thickness * 0.13),
                            lineCap: .round,
                            lineJoin: .round
                        )
                    )
                    .offset(y: thickness * 0.32)
            }
        },
        tonearmPeg: TonearmPegThemePart { geometry in
            let pegSize = max(14, geometry.recordDiameter * 0.05)

            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [silverHighlight, silverLight, silverMid, silverShadow],
                            center: UnitPoint(x: 0.32, y: 0.28),
                            startRadius: pegSize * 0.04,
                            endRadius: pegSize * 0.62
                        )
                    )

                Circle()
                    .strokeBorder(
                        LinearGradient(
                            colors: [Color.white.opacity(0.55), Color.black.opacity(0.45)],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 0.9
                    )

                Circle()
                    .stroke(silverBezelDark.opacity(0.55), lineWidth: 0.5)

                Circle()
                    .fill(silverDeep.opacity(0.65))
                    .frame(width: pegSize * 0.20, height: pegSize * 0.20)
                    .overlay(
                        Circle()
                            .stroke(Color.white.opacity(0.30), lineWidth: 0.4)
                            .offset(y: 0.3)
                            .frame(width: pegSize * 0.20, height: pegSize * 0.20)
                    )
            }
            .frame(width: pegSize, height: pegSize)
        },
        tonearmHolder: TonearmHolderThemePart { geometry in
            let diameter = geometry.holderDiameter

            ZStack {
                ConcentricBrushedDisc(seed: 5)
                    .clipShape(Circle())

                Circle()
                    .strokeBorder(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.55),
                                Color.white.opacity(0.06),
                                Color.black.opacity(0.45)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 1.2
                    )

                Circle()
                    .stroke(silverBezelDark.opacity(0.5), lineWidth: 0.6)

                Circle()
                    .stroke(Color.black.opacity(0.32), lineWidth: 0.7)
                    .padding(diameter * 0.16)

                Circle()
                    .stroke(Color.white.opacity(0.30), lineWidth: 0.6)
                    .padding(diameter * 0.16 + 0.8)

                Circle()
                    .fill(
                        RadialGradient(
                            colors: [silverHighlight, silverLight, silverMid, silverShadow],
                            center: UnitPoint(x: 0.36, y: 0.30),
                            startRadius: 0.5,
                            endRadius: diameter * 0.18
                        )
                    )
                    .overlay(
                        Circle()
                            .strokeBorder(
                                LinearGradient(
                                    colors: [Color.white.opacity(0.5), Color.black.opacity(0.40)],
                                    startPoint: .top,
                                    endPoint: .bottom
                                ),
                                lineWidth: 0.7
                            )
                    )
                    .padding(diameter * 0.34)

                Circle()
                    .fill(silverDeep.opacity(0.75))
                    .frame(width: diameter * 0.07, height: diameter * 0.07)
                    .overlay(
                        Circle()
                            .stroke(Color.white.opacity(0.25), lineWidth: 0.4)
                            .offset(y: 0.3)
                            .frame(width: diameter * 0.07, height: diameter * 0.07)
                    )
            }
            .frame(width: diameter, height: diameter)
        },
        tonearmCounterweight: TonearmCounterweightThemePart { geometry in
            ZStack {
                BrushedAluminumPanel(
                    grainOrientation: .horizontal,
                    seed: 17,
                    grainDensity: 0.5,
                    highlightOpacity: 0.05,
                    shadowOpacity: 0.03
                )
                .clipShape(Capsule())

                Capsule()
                    .strokeBorder(
                        LinearGradient(
                            colors: [Color.white.opacity(0.55), Color.black.opacity(0.42)],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 0.9
                    )

                Capsule()
                    .stroke(silverBezelDark.opacity(0.45), lineWidth: 0.4)
            }
            .frame(width: geometry.counterweightWidth, height: geometry.counterweightHeight)
        },
        transportButtons: ControlsThemeTransportButtons(
            makeEjectButton: { action in
                SilverTransportButton(
                    icon: "eject.fill",
                    diameter: Self.buttonDiameter,
                    iconSize: Self.buttonIconSize,
                    action: action
                )
            },
            makePreviousButton: { action in
                SilverTransportButton(
                    icon: "backward.fill",
                    diameter: Self.buttonDiameter,
                    iconSize: Self.buttonIconSize,
                    action: action
                )
            },
            makePlayPauseButton: { action in
                SilverTransportButton(
                    icon: "playpause.fill",
                    diameter: Self.buttonDiameter,
                    iconSize: Self.buttonIconSize,
                    action: action
                )
            },
            makeNextButton: { action in
                SilverTransportButton(
                    icon: "forward.fill",
                    diameter: Self.buttonDiameter,
                    iconSize: Self.buttonIconSize,
                    action: action
                )
            }
        )
    )
}

// MARK: - Transport button

private struct SilverTransportButton: View {
    let icon: String
    let diameter: CGFloat
    let iconSize: CGFloat
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
        }
        .buttonStyle(
            SilverTransportButtonStyle(
                diameter: diameter,
                iconSize: iconSize
            )
        )
    }
}

private struct SilverTransportButtonStyle: ButtonStyle {
    let diameter: CGFloat
    let iconSize: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        let pressed = configuration.isPressed
        let bezelInset: CGFloat = diameter * 0.07
        let pressSink: CGFloat = pressed ? diameter * 0.03 : 0

        return ZStack {
            // 1. Static bezel well — the metal collar the key sits inside
            Circle()
                .fill(
                    LinearGradient(
                        colors: [silverBezelDark, silverDeep, silverShadow],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

            // Inner-rim chamfer — top dark, bottom bright (concave bowl cue)
            Circle()
                .strokeBorder(
                    LinearGradient(
                        colors: [Color.black.opacity(0.55), Color.white.opacity(0.22)],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 1
                )

            // 2. Key face — sits centered in the well, sinks slightly on press
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: pressed
                                ? [silverMid, silverShadow]
                                : [silverLight, silverMid],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )

                ConcentricBrushedDisc(seed: 29)
                    .clipShape(Circle())
                    .blendMode(.overlay)
                    .opacity(0.12)

                // Edge chamfer on the key
                Circle()
                    .strokeBorder(
                        LinearGradient(
                            colors: [Color.white.opacity(0.50), Color.black.opacity(0.35)],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: pressed ? 0.6 : 0.8
                    )

                // Top inner shadow — small at rest, grows a touch on press
                Circle()
                    .strokeBorder(
                        LinearGradient(
                            colors: [
                                Color.black.opacity(pressed ? 0.32 : 0.18),
                                Color.clear
                            ],
                            startPoint: .top,
                            endPoint: .center
                        ),
                        lineWidth: pressed ? 1.2 : 0.8
                    )

                // Bottom rim highlight — slightly fades on press
                Circle()
                    .strokeBorder(
                        LinearGradient(
                            colors: [Color.clear, Color.white.opacity(pressed ? 0.12 : 0.24)],
                            startPoint: .center,
                            endPoint: .bottom
                        ),
                        lineWidth: 0.7
                    )

                // Engraved icon
                configuration.label
                    .font(.system(size: iconSize, weight: .heavy))
                    .foregroundStyle(silverDeep.opacity(0.92))
                    .shadow(
                        color: Color.white.opacity(pressed ? 0.28 : 0.45),
                        radius: 0,
                        x: 0,
                        y: 0.6
                    )
            }
            .padding(bezelInset)
            .shadow(
                color: .black.opacity(pressed ? 0.12 : 0.20),
                radius: pressed ? 0.4 : 1,
                x: 0,
                y: pressed ? 0.2 : 0.8
            )
            .offset(y: pressSink)
        }
        .frame(width: diameter, height: diameter)
        .contentShape(Circle())
        .animation(.easeOut(duration: 0.09), value: pressed)
    }
}

// MARK: - Brushed-metal helpers

private struct BrushedAluminumPanel: View {
    let grainOrientation: Axis
    let seed: Int
    let grainDensity: CGFloat
    let highlightOpacity: Double
    let shadowOpacity: Double

    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [silverHighlight, silverLight, silverMid, silverShadow],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

            Canvas { context, size in
                var rng = SeededRandom(seed: UInt64(bitPattern: Int64(seed)))
                let crossDim = grainOrientation == .horizontal ? size.height : size.width
                let alongDim = grainOrientation == .horizontal ? size.width : size.height
                let strokeCount = max(12, Int(crossDim * grainDensity))

                for _ in 0..<strokeCount {
                    let cross = rng.nextDouble() * Double(crossDim)
                    let lengthFraction = 0.35 + rng.nextDouble() * 0.65
                    let length = lengthFraction * Double(alongDim)
                    let start = (rng.nextDouble() - 0.15) * Double(alongDim)
                    let isHighlight = rng.nextDouble() < 0.55
                    let baseAlpha = isHighlight ? highlightOpacity : shadowOpacity
                    let jitter = 0.4 + rng.nextDouble() * 0.6
                    let alpha = baseAlpha * jitter
                    let color: Color = isHighlight ? .white.opacity(alpha) : .black.opacity(alpha)

                    var path = Path()
                    if grainOrientation == .horizontal {
                        path.move(to: CGPoint(x: max(0, start), y: cross))
                        path.addLine(to: CGPoint(x: min(Double(alongDim), start + length), y: cross))
                    } else {
                        path.move(to: CGPoint(x: cross, y: max(0, start)))
                        path.addLine(to: CGPoint(x: cross, y: min(Double(alongDim), start + length)))
                    }
                    context.stroke(path, with: .color(color), lineWidth: 0.5)
                }
            }
        }
    }
}

private struct ConcentricBrushedDisc: View {
    let seed: Int

    var body: some View {
        GeometryReader { proxy in
            let size = min(proxy.size.width, proxy.size.height)
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                silverHighlight,
                                silverLight,
                                silverMid,
                                silverShadow
                            ],
                            center: UnitPoint(x: 0.36, y: 0.30),
                            startRadius: size * 0.04,
                            endRadius: size * 0.62
                        )
                    )

                Canvas { context, canvasSize in
                    var rng = SeededRandom(seed: UInt64(bitPattern: Int64(seed)))
                    let center = CGPoint(x: canvasSize.width / 2, y: canvasSize.height / 2)
                    let maxRadius = min(canvasSize.width, canvasSize.height) / 2
                    let arcCount = max(14, Int(maxRadius * 0.45))

                    for _ in 0..<arcCount {
                        let r = rng.nextDouble() * Double(maxRadius)
                        let isHighlight = rng.nextDouble() < 0.55
                        let alpha = (isHighlight ? 0.035 : 0.025) * (0.4 + rng.nextDouble() * 0.6)
                        let startAngle = rng.nextDouble() * .pi * 2
                        let arcLength = 0.4 + rng.nextDouble() * 1.4
                        let endAngle = startAngle + arcLength

                        let path = Path { p in
                            p.addArc(
                                center: center,
                                radius: CGFloat(r),
                                startAngle: .radians(startAngle),
                                endAngle: .radians(endAngle),
                                clockwise: false
                            )
                        }
                        let color: Color = isHighlight
                            ? .white.opacity(alpha)
                            : .black.opacity(alpha * 1.1)
                        context.stroke(path, with: .color(color), lineWidth: 0.5)
                    }
                }
            }
        }
    }
}

// MARK: - Small detail elements

private struct MachinedDimple: View {
    let diameter: CGFloat

    var body: some View {
        Circle()
            .fill(
                RadialGradient(
                    colors: [silverDeep.opacity(0.78), silverShadow.opacity(0.42)],
                    center: UnitPoint(x: 0.4, y: 0.4),
                    startRadius: 0,
                    endRadius: diameter / 2
                )
            )
            .overlay(
                Circle()
                    .stroke(Color.white.opacity(0.32), lineWidth: 0.4)
                    .offset(y: 0.4)
            )
            .frame(width: diameter, height: diameter)
    }
}

// MARK: - Deterministic RNG (so brushed grain doesn't flicker on redraw)

private struct SeededRandom {
    private var state: UInt64

    init(seed: UInt64) {
        state = seed != 0 ? seed : 0xDEAD_BEEF_CAFE_BABE
    }

    mutating func next() -> UInt64 {
        state = state &* 6_364_136_223_846_793_005 &+ 1_442_695_040_888_963_407
        return state
    }

    mutating func nextDouble() -> Double {
        Double(next() >> 11) / Double(1 << 53)
    }
}
