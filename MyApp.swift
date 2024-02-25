import SwiftUI

@main
struct MyApp: App {
    
    init() {
        try! UIFont.registerFonts(withExtension: "ttf")
    }
    
    @ObservedObject var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .onAppear {
                    audioManager.playAudio(for: "Move Like That", loop: true)
                }
            }
        }
    }
}
