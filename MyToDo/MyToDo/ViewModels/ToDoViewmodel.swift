import Foundation
import FirebaseFirestore
import Combine

class ToDoViewModel: ObservableObject {
    @Published var todos: [ToDoListItem] = []
    private var db = Firestore.firestore()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchToDos(userId: String) {
        db.collection("users").document(userId).collection("todos").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                self.todos = querySnapshot?.documents.compactMap { document -> ToDoListItem? in
                    try? document.data(as: ToDoListItem.self)
                } ?? []
            }
        }
    }
}
