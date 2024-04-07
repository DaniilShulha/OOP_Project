//
//  UserService.swift
//  OOPLab2
//
//  Created by znexie on 20.03.24.
//

import Foundation

class UserService {
    private var userDao: UserDao;
    
    func registerUser() {
        let user = User(username: "", email: "")
        var isValid = false
        
        while !isValid {
            print("Write username:")
            user.username = readLine()!
            
            print("Write email:")
            user.email = readLine()!
            
            isValid = self.isValidEmail() && self.isValidUsername()
            
            if !isValid {
                print("Invalid username or email. Please try again.")
            }
        }
        
        usersArray.append(user) //call userDao.saveUser(user)
    }
    
    func login(username: String, email: String) -> Bool {
        if usersArray.first(where: { $0.username == username && $0.email == email }) != nil {
            return true
        } else {
            return false
        }
    }
    
    private func isValidUsername(username: String) -> Bool {
        return !username.isEmpty
    }
    
    private func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}" //move to constant
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
}
