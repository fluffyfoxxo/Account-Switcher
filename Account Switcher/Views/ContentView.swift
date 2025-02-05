import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var isUnlocked = false
    
    var body: some View {
        ZStack {
            if isUnlocked {
                NavigationView {
                    SidebarView(isUnlocked: $isUnlocked)
                        .frame(minWidth: 145, idealWidth: 145, idealHeight: 300, maxHeight: .infinity, alignment: .center)
                        .toolbar {
                            ToolbarItem(placement: .status) {
                                Button(action: {
                                    toggleSidebar()
                                }) {
                                    Image(systemName: "sidebar.left")
                                }
                            }
                        }
                        //.presentedWindowToolbarStyle(ExpandedWindowToolbarStyle())
                }
            } else {
                LockView(isUnlocked: $isUnlocked.animation())
                    .transition(.move(edge: .bottom))
            }
        }
    }
    
    private func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
