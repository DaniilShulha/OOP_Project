//
//  LoginView.swift
//  MyToDo
//
//  Created by znexie on 21.04.24.
//

import SwiftUI
import OOPLibrary
struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "My ToDo", subtitle: "Application", background: .blue)
                
                
                //Login form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .bold()
                    }
                    
                    TextField("Your email", text: $viewModel.email)
                        .textFieldStyle(PlainTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Your password", text: $viewModel.password)
                        .textFieldStyle(PlainTextFieldStyle())
                    
                    ButtonView(title: "Log in",
                               background: .blue) {
                        // attemped login
                        viewModel.login()
                    }
                    .padding()
                    
                }
                //.offset(y: -50)
                
                //Create account
                
                VStack {
                    Text("Don't have an account yet ?")
                        .padding(.top, 25)
                    
                    NavigationLink("Register", destination: RegisterView())
                }
                .padding(.bottom, 25)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}


