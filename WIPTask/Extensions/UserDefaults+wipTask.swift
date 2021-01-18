//
//  UserDefaults+wipTask.swift
//  WIPTask
//
//  Created by Andreea Ioana Muresan on 18/01/2021.
//  Copyright © 2021 wipTask. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static let locationsKey = "LocationsKey"
    
    var locations: [Location]? {
        get {
            guard let data = self.value(forKey: Self.locationsKey) as? Data else { return [] }
            return try? JSONDecoder().decode([Location].self, from: data)
        }
        set {
            let encodedValue = try? JSONEncoder().encode(newValue)
            self.setValue(encodedValue, forKey: Self.locationsKey)
        }
    }
    
}
