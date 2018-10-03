//
//  UserDefaults+Extension.swift
//  LayoutPrototype
//
//  Created by Guy Fawkes on 07/09/18.
//  Copyright © 2018 Guy Fawkes. All rights reserved.
//

import Foundation

extension UserDefaults {


    enum UserDefaultsKeys: String {
        case isLoggedIn
    }
    
    func setIsLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }

}
