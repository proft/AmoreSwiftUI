import SwiftUI

@main
struct AmoreApp: App {
    @ObservedObject var appManager = AppStateManager()
    @ObservedObject var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {            
            ContentView()
                .environmentObject(appManager)
                .environmentObject(userManager)
        }
    }
}
