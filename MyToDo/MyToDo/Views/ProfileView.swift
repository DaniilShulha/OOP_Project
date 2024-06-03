//
//  ProfileView.swift
//  MyToDo
//
//  Created by znexie on 21.04.24.
//

import SwiftUI
import OOPLibrary
struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Profile loading...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // avatar
        Image(systemName: "person.crop.square.filled.and.at.rectangle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.black)
            .frame(width: 125, height: 125)
            .padding(5)
        
        // info
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding(2)
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding(2)
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding(2)
        }
        .padding(10)
        
        // sign out
        ButtonView(title: "Log out", background: .black) {
            viewModel.logout()
        }
        .frame(width: 300, height: 40)
        .padding(.bottom, 120)
    }
}

#Preview {
    ProfileView()
}
