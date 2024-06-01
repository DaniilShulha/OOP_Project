//
//  ToDoListView.swift
//  MyToDo
//
//  Created by znexie on 21.04.24.
//

import SwiftUI
import FirebaseFirestoreSwift



struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    @State var itemId: String = ""

    
    
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Remove") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                            
                            Button("Edit") {
                                itemId = item.id
                                viewModel.showingEditItemView = true
                            }
                            .tint(.orange)
                        }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    //action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.black)
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            .sheet(isPresented: $viewModel.showingEditItemView) {
                EditItemView(editItemPresented: $viewModel.showingEditItemView, itemId: $itemId)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "jp1qOuzozUgP5AEgZU7kuUvJ2723")
}
