import SwiftUI

struct RecordThemeSurfaceOverlay {
    let makeView: (_ size: CGFloat) -> AnyView

    init<V: View>(
        @ViewBuilder makeView: @escaping (_ size: CGFloat) -> V
    ) {
        self.makeView = { size in
            AnyView(makeView(size))
        }
    }
}

struct RecordThemePalette {
    let backgroundColor: Color
    let trackDividerColor: Color
    let bufferColor: Color
    let surfaceOverlay: RecordThemeSurfaceOverlay?

    init(
        backgroundColor: Color,
        trackDividerColor: Color,
        bufferColor: Color,
        surfaceOverlay: RecordThemeSurfaceOverlay? = nil
    ) {
        self.backgroundColor = backgroundColor
        self.trackDividerColor = trackDividerColor
        self.bufferColor = bufferColor
        self.surfaceOverlay = surfaceOverlay
    }
}

enum RecordTheme: String, CaseIterable, Identifiable {
    case black
    case yellow
    case red
    case pinkSplatter
    case blueSplatter

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .black:
            return "Black"
        case .yellow:
            return "Yellow"
        case .red:
            return "Red"
        case .pinkSplatter:
            return "Pink Splatter"
        case .blueSplatter:
            return "Blue Splatter"
        }
    }

    var palette: RecordThemePalette {
        switch self {
        case .black:
            return BlackRecordTheme.palette
        case .yellow:
            return YellowRecordTheme.palette
        case .red:
            return RedRecordTheme.palette
        case .pinkSplatter:
            return PinkSplatterRecordTheme.palette
        case .blueSplatter:
            return BlueSplatterRecordTheme.palette
        }
    }
}
