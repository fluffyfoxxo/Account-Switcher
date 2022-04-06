import SwiftUI

struct SidebarView: View {
    @State private var isDefaultItemActive = true
    @Binding var isUnlocked: Bool
    
    var body: some View {
        List {
            NavigationLink(destination: PasswordListView(isUnlocked: $isUnlocked), isActive: $isDefaultItemActive) {
                Label("Password", systemImage: "key")
            }
            NavigationLink(destination: SettingsView()) {
                Label("Settings", systemImage: "gearshape")
            }
        }
        .padding(.top)
        .listStyle(SidebarListStyle())
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView(isUnlocked: .constant(true))
            .padding()
    }
}
