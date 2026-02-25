import SwiftUI

@main
struct ScampApp: App {
    @StateObject private var playback = PlaybackController()
    @AppStorage("selectedTableTheme") private var selectedTableThemeRawValue = TableTheme.wood.rawValue
    @AppStorage("selectedRecordTheme") private var selectedRecordThemeRawValue = RecordTheme.black.rawValue
    @AppStorage("selectedControlsTheme") private var selectedControlsThemeRawValue = ControlsTheme.silver.rawValue

    private var selectedTableTheme: Binding<TableTheme> {
        Binding(
            get: {
                let resolvedThemeRawValue = selectedTableThemeRawValue == "silver"
                    ? TableTheme.frostedGlass.rawValue
                    : selectedTableThemeRawValue
                return TableTheme(rawValue: resolvedThemeRawValue) ?? .wood
            },
            set: { selectedTableThemeRawValue = $0.rawValue }
        )
    }

    private var selectedRecordTheme: Binding<RecordTheme> {
        Binding(
            get: { RecordTheme(rawValue: selectedRecordThemeRawValue) ?? .black },
            set: { selectedRecordThemeRawValue = $0.rawValue }
        )
    }

    private var selectedControlsTheme: Binding<ControlsTheme> {
        Binding(
            get: { ControlsTheme(rawValue: selectedControlsThemeRawValue) ?? .silver },
            set: { selectedControlsThemeRawValue = $0.rawValue }
        )
    }

    var body: some Scene {
        WindowGroup {
            ContentView(
                playback: playback,
                tableTheme: selectedTableTheme,
                recordTheme: selectedRecordTheme,
                controlsTheme: selectedControlsTheme
            )
        }
        .defaultSize(width: ScampLayout.windowWidth, height: ScampLayout.windowHeight)
        .windowResizability(.contentSize)
        .windowStyle(.hiddenTitleBar)
        .commands {
            CommandMenu("Theme") {
                Button("Randomize Themes") {
                    if let tableTheme = TableTheme.allCases.randomElement() {
                        selectedTableTheme.wrappedValue = tableTheme
                    }
                    if let recordTheme = RecordTheme.allCases.randomElement() {
                        selectedRecordTheme.wrappedValue = recordTheme
                    }
                    if let controlsTheme = ControlsTheme.allCases.randomElement() {
                        selectedControlsTheme.wrappedValue = controlsTheme
                    }
                }

                Divider()

                Picker("Table Theme", selection: selectedTableTheme) {
                    ForEach(TableTheme.allCases) { theme in
                        Text(theme.displayName)
                            .tag(theme)
                    }
                }
                .pickerStyle(.inline)

                Divider()

                Picker("Record Theme", selection: selectedRecordTheme) {
                    ForEach(RecordTheme.allCases) { theme in
                        Text(theme.displayName)
                            .tag(theme)
                    }
                }
                .pickerStyle(.inline)

                Divider()

                Picker("Controls Theme", selection: selectedControlsTheme) {
                    ForEach(ControlsTheme.allCases) { theme in
                        Text(theme.displayName)
                            .tag(theme)
                    }
                }
                .pickerStyle(.inline)
            }
        }
    }
}
