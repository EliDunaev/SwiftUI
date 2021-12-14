//
//  UserDefaults.swift
//  UI_Swift
//
//  Created by Илья Дунаев on 11.12.2021.
//

import Foundation

extension UserDefaults {
    
    func setVkToken(value: String) {
        set(value, forKey: UserDefaultsKeys.vkToken.rawValue)
    }
    
    func getVkToken() -> String {
        return string(forKey: UserDefaultsKeys.vkToken.rawValue)!
    }
    
    
    func setUserID(value: String) {
        set(value, forKey: UserDefaultsKeys.userID.rawValue)
    }
    
    func getUserID() -> String {
        return string(forKey: UserDefaultsKeys.userID.rawValue)!
    }
}

enum UserDefaultsKeys : String {
    case vkToken
    case userID
}
