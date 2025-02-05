import SwiftUI

@main
struct Account_SwitcherApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 620, idealWidth: 620, maxWidth: .infinity, minHeight: 300, idealHeight: 300, maxHeight: .infinity, alignment: .center)
        }
        //.windowStyle(HiddenTitleBarWindowStyle())
        .commands {
            SidebarCommands()
            ToolbarCommands()
        }
    }
}

class AppDelegate: NSResponder, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApp.windows.forEach { $0.standardWindowButton(.zoomButton)?.isEnabled = false }
        
        NotificationCenter.default.post(Notification(name: Notification.Name("active")))
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
