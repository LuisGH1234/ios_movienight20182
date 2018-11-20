

import Foundation

class UserStore {
    
    static let shared = UserStore()
    
    private init() {
        
    }
    
    var userToken: String {
        get {
            return UserDefaults.standard.string(forKey: "token") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "didShowOnboarding")
        }
    }
}
