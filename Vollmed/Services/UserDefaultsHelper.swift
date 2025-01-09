//
//  UserDefaultsHelper.swift
//  Vollmed
//
//  Created by Caio Mori on 09/01/25.
//

import Foundation

struct UserDefaultsHelper {
    static func save(value: String, key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func get(for key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    static func remove(for key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    
}
