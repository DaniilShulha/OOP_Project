//
//  MyToDoApp.swift
//  MyToDo
//
//  Created by znexie on 15.04.24.
//
import FirebaseCore
import SwiftUI

@main
struct MyToDoApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
