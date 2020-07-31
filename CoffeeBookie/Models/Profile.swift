//
//  Profile.swift
//  CoffeeBookie
//
//  Created by Caleb Walker on 7/31/20.
//  Copyright © 2020 Caleb Walker. All rights reserved.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications: Bool
    
    static let `default` = Self(username: "g_kumar", prefersNotifications: true)
    
    init(username: String, prefersNotifications: Bool = true) {
        self.username = username
        self.prefersNotifications = prefersNotifications
    }

}
