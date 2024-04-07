//
//  LoginViewModel.swift
//  OOPLab2
//
//  Created by znexie on 20.03.24.
//

import Foundation

class LoginViewModel {
    private var email: String = ""
    private var password: String = ""
    private var errorMessage: String = ""
    
    private func validate () -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                    !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "You should fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "You should enter a valid email"
            return false
        }
        errorMessage = ""
        return true
    }
    
    func login(users: [UserClass]) -> String? {
        print("Log in page:")
        print("Write email:")
        email = readLine() ?? ""
        print("Write password:")
        password = readLine() ?? ""
        
        guard validate() else {
            print(errorMessage)
            return nil
        }
        
        guard let user = users.first(where: { $0.email == email && $0.password == password }) else {
            errorMessage = "Invalid email or password"
            print(errorMessage)
            return nil
        }
        
        // Дополнительный код для успешного входа пользователя
        print("Login successful!")
        print("Welcome, \(user.username)!")
        
        return user.userID
    }
}
