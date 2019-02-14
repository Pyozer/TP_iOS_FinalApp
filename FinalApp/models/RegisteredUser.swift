//
//  RegisteredUser.swift
//  FinalApp
//
//  Created by Jean-Charles Moussé on 14/02/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//
class RegisteredUser {
    static var instance: User?
    
    static func setUser(user: User) {
        instance = user
    }
}
