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
    let recordColor: Color
    let trackBufferColor: Color
    let surfaceOverlay: RecordThemeSurfaceOverlay?

    init(
        recordColor: Color,
        trackBufferColor: Color,
        surfaceOverlay: RecordThemeSurfaceOverlay? = nil
    ) {
        self.recordColor = recordColor
        self.trackBufferColor = trackBufferColor
        self.surfaceOverlay = surfaceOverlay
    }
}

enum RecordTheme: String, CaseIterable, Identifiable {
    case black
    case yellow
    case red
    case pinkSplatter

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
        }
    }
}
