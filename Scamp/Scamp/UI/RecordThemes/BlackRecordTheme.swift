import SwiftUI

struct BlackRecordTheme: RecordThemeDefinition {
    static let displayName = "Black"
    static let palette = RecordThemePalette(
        backgroundColor: Color.black,
        trackDividerColor: Color(white: 0.10),
        bufferColor: Color(white: 0.06)
    )
}
