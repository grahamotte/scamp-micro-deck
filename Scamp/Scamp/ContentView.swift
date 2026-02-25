import SwiftUI

struct ContentView: View {
    @ObservedObject var playback: PlaybackController
    @Binding var tableTheme: TableTheme
    @Binding var recordTheme: RecordTheme
    @State private var columnVisibility: NavigationSplitViewVisibility = .detailOnly

    private var nowPlayingTitle: String {
        playback.currentTrackDisplayName ?? ScampLayout.statusFallbackTitle
    }

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            EmptyView()
                .navigationSplitViewColumnWidth(min: 0, ideal: 0, max: 0)
        } detail: {
            DeckWorkspaceView(
                playback: playback,
                tableTheme: $tableTheme,
                recordTheme: $recordTheme
            )
        }
        .navigationSplitViewStyle(.balanced)
        .containerBackground(Color.clear, for: .window)
        .toolbar(removing: .sidebarToggle)
        .background(TitlebarSidebarButtonHider())
        .background(TitlebarNowPlayingText(text: nowPlayingTitle))
        .background(ThemeWindowConfigurator())
        .frame(width: ScampLayout.windowWidth, height: ScampLayout.windowHeight)
    }
}

#Preview {
    ContentView(
        playback: PlaybackController(),
        tableTheme: .constant(.wood),
        recordTheme: .constant(.black)
    )
}
