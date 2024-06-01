//
//  RegisterView.swift
//  MyToDo
//
//  Created by znexie on 21.04.24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Let's start", background: .green)
                .offset(y: -40)
            
            Form {
                TextField("Your name", text: $viewModel.name)
                    .textFieldStyle(PlainTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Your email", text: $viewModel.email)
                    .textFieldStyle(PlainTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                SecureField("Your password", text: $viewModel.password)
                    .textFieldStyle(PlainTextFieldStyle())
                
                ButtonView(title: "Create account",
                           background: .green) {
                    viewModel.register()
                }
                .padding()
                
            }
            .offset(y: -40)
            
            VStack {
                Text("To Do List")
                
                Text("by Daniil Shulha").foregroundColor(.red)
            }
            .padding(.bottom, 50)
            .frame(height: 50)
            
            Spacer()
        }
        
    }
}

#Preview {
    RegisterView()
}
