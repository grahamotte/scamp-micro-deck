import SwiftUI

struct RecordThemePalette {
    let recordColor: Color
    let trackBufferColor: Color
}

enum RecordTheme: String, CaseIterable, Identifiable {
    case black
    case yellow
    case red

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .black:
            return "Black"
        case .yellow:
            return "Yellow"
        case .red:
            return "Red"
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
        }
    }
}
