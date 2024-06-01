//
//  User.swift
//  OOPLab2
//
//  Created by znexie on 20.03.24.
//

import Foundation

class UserClass: Codable {
    internal var userID = UUID().uuidString
    internal var username: String
    internal var email: String
    private var joined = Date()
    internal var password: String
    
    init(username: String, email: String, joined: Date = Date(), password: String) {
       // self.userID = userID
        self.username = username
        self.email = email
        self.joined = joined
        self.password = password
    }
    
    //init
    
    
    
//    func detailedDescription(users: [UserClass])  {
//        for user in users {
//            print("User ID: \(user.userID), username: \(user.username), email: \(user.email), joined: \(user.joined), password: \(user.password)")
//        }
//    }
}

