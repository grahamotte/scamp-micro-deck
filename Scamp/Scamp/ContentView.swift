import SwiftUI

struct ContentView: View {
    @ObservedObject var playback: PlaybackController
    @Binding var tableTheme: TableTheme
    @Binding var recordTheme: RecordTheme
    @Binding var controlsTheme: ControlsTheme
    @Binding var showsHowToUse: Bool
    let dismissHowToUse: () -> Void
    @State private var columnVisibility: NavigationSplitViewVisibility = .detailOnly

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            EmptyView()
                .navigationSplitViewColumnWidth(min: 0, ideal: 0, max: 0)
        } detail: {
            DeckWorkspaceView(
                playback: playback,
                tableTheme: $tableTheme,
                recordTheme: $recordTheme,
                controlsTheme: $controlsTheme
            )
        }
        .navigationSplitViewStyle(.balanced)
        .containerBackground(Color.clear, for: .window)
        .toolbar(removing: .sidebarToggle)
        .background(TitlebarSidebarButtonHider())
        .background(ThemeWindowConfigurator())
        .frame(width: ScampLayout.windowWidth, height: ScampLayout.windowHeight)
        .sheet(isPresented: $showsHowToUse) {
            HowToUseSheet(onOK: dismissHowToUse)
                .interactiveDismissDisabled()
        }
    }
}

#Preview {
    ContentView(
        playback: PlaybackController(),
        tableTheme: .constant(.wood),
        recordTheme: .constant(.black),
        controlsTheme: .constant(.silver),
        showsHowToUse: .constant(true),
        dismissHowToUse: {}
    )
}

private struct HowToUseSheet: View {
    let onOK: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("How to Use")
                .font(.title2.weight(.semibold))

            VStack(alignment: .leading, spacing: 12) {
                Text("Scamp is designed to feel a bit like using a real vinyl record player.")

                HStack(alignment: .firstTextBaseline, spacing: 6) {
                    Text("To load your first album, click the ")
                    + Text(Image(systemName: "eject.fill"))
                    + Text(" eject button.")
                }

                Text("Choose a folder with audio files and album art, and Scamp will start playing from there.")
                Text("Want to switch albums? Just press ")
                + Text(Image(systemName: "eject.fill"))
                + Text(" again and pick a different folder.")
                Text("You can always come back to this later from ")
                + Text("Help > How to Use").bold()
                + Text(".")
            }
            .fixedSize(horizontal: false, vertical: true)

            Button {
                onOK()
            } label: {
                Text("OK")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .keyboardShortcut(.defaultAction)
        }
        .padding(24)
        .frame(width: 420)
    }
}
