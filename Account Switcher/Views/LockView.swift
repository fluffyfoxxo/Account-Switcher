import SwiftUI
import LocalAuthentication
import Defaults
struct LockView: View {
    
    @Binding var isUnlocked: Bool
    @Default(.needAuthToUnlock) var needAuthToUnlock
    
    var body: some View {
        VStack {

            
            Button {
                if needAuthToUnlock {
                    authenticate()
                } else {
                    isUnlocked = true
                }
            } label: {
                HStack {
/*                    Image(systemName: "touchid")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
 */
                    Text("")
//                    Text("UNLOCK")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                }
                .padding(8)
//                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("active"))) { _ in
            if needAuthToUnlock {
                authenticate()
            } else {
                isUnlocked = true
            }
        }
    }
    
    private func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "解锁 Apple ID 密码库"
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        // error
                    }
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct LockView_Previews: PreviewProvider {
    static var previews: some View {
        LockView(isUnlocked: .constant(false))
    }
}


