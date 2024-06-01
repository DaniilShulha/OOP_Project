//
//  Task.swift
//  OOPLab2
//
//  Created by znexie on 22.03.24.
//

import Foundation

struct TaskClass: Codable {
    internal var taskID = UUID().uuidString
    internal var description: String
    internal var dueDate: Date
    internal var createdDate = Date()
    internal var isDone: Bool
    
//    mutating func setDone(_ state: Bool) {
//        isDone = state
//    }
}
