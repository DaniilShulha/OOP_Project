//
//  NewItemView.swift
//  MyToDo
//
//  Created by znexie on 21.04.24.
//

import SwiftUI
import OOPLibrary
struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 34))
                .bold()
                .padding(.top, 50)
            
            Form {
                // title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(PlainTextFieldStyle())
                
                // due date
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                
                // button
                ButtonView(title: "Create", background: .yellow) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("ALARM!!!!"),
                      message: Text("Please fill in all fields and select due date that is today or newer."))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
