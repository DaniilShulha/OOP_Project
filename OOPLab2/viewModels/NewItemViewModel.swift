//
//  NewItemViewModel.swift
//  OOPLab2
//
//  Created by znexie on 22.03.24.
//

import Foundation

class NewItemViewModel {
    internal var taskArray: [TaskClass] = []

    var description: String = ""
    private var dueDate = Date()
    
    func createTask() {
        print("Creating new task...")
        print("Write task description:")
        description = readLine() ?? ""
        
        print("Write task's due date (dd-MM-yyyy):")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        if let dateString = readLine(), let date = dateFormatter.date(from: dateString) {
            dueDate = date
        } else {
            print("Invalid due date format. Task not created.")
            return
        }
        
        guard canSave else {
            return
        }
        
        //let newId = UUID().uuidString
        let newItem = TaskClass(
            //id: newId,
            description: description,
            dueDate: dueDate,
            //createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        taskArray.append(newItem)
    }
    
    
    
    private var canSave: Bool {
        guard !description.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
    }
    
}
