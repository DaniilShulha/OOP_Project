//
//  ToDoListViewViewModel.swift
//  MyToDo
//
//  Created by znexie on 21.04.24.
//

/// ViewModel for list of items view
import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    @Published var showingEditItemView = false
    @Published var showAlert = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// delete task
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
