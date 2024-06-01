//
//  ToDoListViewModel.swift
//  OOPLab2
//
//  Created by znexie on 22.03.24.
//

import Foundation

class ToDoListViewModel {
    var tasks: [TaskClass] = []
    var userID: String = ""
    
    init(userID: String) {
        self.userID = userID
    }

//    func getAllTasksInfo() {
//        for ind in taskItem.taskArray {
//            //print(ind.taskID + " - " + ind.description)
//            print("\(ind.taskID) - \(ind.description), created date:  \(ind.createdDate), due date: \(ind.dueDate), done: \(ind.isDone)")
//        }
//    }
    
    func getAllTasksInfo() {
        print("All tasks:")
        for task in taskItem.taskArray {
            if dataArray.firstIndex(where: { $0[0] == task.description && $0[1] == userID }) != nil {
                print("\(task.taskID) - \(task.description), created date: \(task.createdDate), due date: \(task.dueDate), done: \(task.isDone)")
            }
        }
    }
    
    func getTasks(userID: String) {
        print("user id: " + userID)
        for d in dataArray {
            if d[1] == userID {
                print(d[0])
            }
        }
    }
    
    func setDone(taskID: String) {
        guard let index = taskItem.taskArray.firstIndex(where: { $0.taskID == taskID }) else {
            print("Task not found.")
            return
        }
        
        //let done = taskItem.taskArray[index].isDone
        if taskItem.taskArray[index].isDone == true {
            print("The task has already been completed")
        } else {
            taskItem.taskArray[index].isDone = true
            print("Task completed successfully")
        }
        
    }
    
    func updateTask(taskID: String) {
        guard let index = taskItem.taskArray.firstIndex(where: { $0.taskID == taskID }) else {
            print("Task not found.")
            return
        }
        
        let oldDescription: String
        print("Write new task description")
        let newDescription = readLine() ?? ""
        if newDescription.isEmpty {
            print("Empty description")
            return
        }
        
        print("Write new task's due date (dd-MM-yyyy):")
        //let newDate: Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        if let dateString = readLine(), let date = dateFormatter.date(from: dateString) {
            taskItem.taskArray[index].dueDate = date
        } else {
            print("Invalid due date format. Task not created.")
            return
        }
        
        oldDescription = taskItem.taskArray[index].description
        taskItem.taskArray[index].description = newDescription
        
        
        
        guard let dataArrayIndex = dataArray.firstIndex(where: { $0.first == oldDescription && $0.last == userID }) else {
            print("Task data not found.")
            return
        }
        
        dataArray[dataArrayIndex][0] = taskItem.taskArray[index].description
        //dataArray.insert(taskArray[index], at: dataArrayIndex)
        
    }
    
    func deleteTask(taskID: String, userID: String) {
        
        guard !taskID.isEmpty else {
            print("Invalid task ID.")
            return
        }
        
        guard let index = taskItem.taskArray.firstIndex(where: { $0.taskID == taskID }) else {
            print("Task not found.")
            return
        }
        
        let taskDescription = taskItem.taskArray[index].description
        
        guard let dataArrayIndex = dataArray.firstIndex(where: { $0.first == taskDescription && $0.last == userID }) else {
            print("Task data not found.")
            return
        }
        
        taskItem.taskArray.remove(at: index)
        dataArray.remove(at: dataArrayIndex)
        
        print("Task with ID \(taskID) deleted successfully.")
        
        
    }
}
