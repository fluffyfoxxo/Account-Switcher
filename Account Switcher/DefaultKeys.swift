import Defaults

extension Defaults.Keys {
    static let accounts = Key<[Account]>("accounts", default: [])
    static let needAuthToUnlock = Key<Bool>("needAuthToUnlock", default: true)
    static let loginSpeed = Key<Float>("loginSpeed", default: 2)
}
