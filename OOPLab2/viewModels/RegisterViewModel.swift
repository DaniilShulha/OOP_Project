//
//  RegisterViewModel.swift
//  OOPLab2
//
//  Created by znexie on 20.03.24.
//

import Foundation

class RegisterViewModel {
    var users: [UserClass] = []
    private var username: String = ""
    private var email: String = ""
    private var password: String = ""
    private var errorMessage: String = ""
    
    private func validate() -> Bool {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
                    !email.trimmingCharacters(in: .whitespaces).isEmpty,
                    !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "You should fill all the fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "You should enter a valid email"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password should be longer than 6 characters"
            return false
        }
        
        errorMessage = ""
        return true
    }

    
    func register() -> String {
        print("Register page:")
        print("Write username:")
        username = readLine() ?? ""
        print("Write Email:")
        email = readLine() ?? ""
        print("Write password:")
        password = readLine() ?? ""
        
        guard validate() else {
            print(errorMessage)
            return ""
        }
        
        let user = UserClass(username: username, email: email, password: password)
        createUser(user: user)
        return user.userID
        
    }
    
    private func createUser(user: UserClass) {
        users.append(user)
    }
    
}
