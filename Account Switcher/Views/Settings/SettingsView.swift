import SwiftUI
import Defaults

struct SettingsView: View {
    @Default(.needAuthToUnlock) var needAuthToUnlock
    @Default(.loginSpeed) var authSpeed
    
    var version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    var build = Bundle.main.infoDictionary?["CFBundleVersion"] as! String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text("Always need authentication to unlock")
                    Toggle(isOn: $needAuthToUnlock) {
                    }
                    .labelsHidden()
                }
                
                VStack(alignment: .trailing, spacing: 0) {
                    HStack {
                        Text("Login speed")
                        Slider(value: $authSpeed, in: 1...5, step: 1) {
                        }
                        .labelsHidden()
                        .frame(width: 150)
                        Text(String(format: "%.0f", authSpeed))
                    }
                    Text("If you CAN NOT login successfully, try to slow down the speed")
                        .font(.system(size: 10))
                        .foregroundColor(.secondary)
                }
                

            }
            .padding()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
