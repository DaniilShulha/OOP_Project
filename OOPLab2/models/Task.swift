//
//  Task.swift
//  OOPLab2
//
//  Created by znexie on 22.03.24.
//

import Foundation

struct TaskClass {
    internal let taskID = UUID().uuidString
    internal var description: String
    internal var dueDate: Date
    internal let createdDate = Date()
    internal var isDone: Bool
    
//    mutating func setDone(_ state: Bool) {
//        isDone = state
//    }
}
