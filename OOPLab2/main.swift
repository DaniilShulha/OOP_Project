//
//  main.swift
//  OOPLab2
//
//  Created by znexie on 19.03.24.
//

import Foundation
import MySerializer

var serializer = Serializer.self

var dataArray: [[String]] = [[]]



var UserTaskArray: [String] = ["", ""]

//var admin = UserClass(username: "", email: "", password: "")
var reg = RegisterViewModel()
var log = LoginViewModel()
var user: String = ""
var number: String

func loginRegister() {
    while true {
        print("""
      Choose one:
      1. Register.
      2. Log in.
      """)
        
        let number = readLine() ?? ""
        
        if number == "1" {
            repeat {
                user = reg.register()
         } while user.isEmpty
            break
        } else if number == "2" {
            
            user = ""
            
            repeat {
                user = log.login(users: reg.users) ?? ""
                
                if user.isEmpty {
                    //print("Invalid user input.")
                    print("""
                  Choose one:
                  1. Retry login.
                  2. Return to registration.
                  """)
                    
                    let choice = readLine() ?? ""
                    if choice == "2" {
                        print("Returning to registration page.")
                        user = reg.register()
                        break
                    }
                }
            } while user.isEmpty
            break
        }
    }
}

loginRegister()

var taskItem = NewItemViewModel()
let toDo = ToDoListViewModel(userID: user)

dataArray.remove(at: 0)

while true {
    print("""
      Choose what do you want:
      1. Create new task.
      2. Delete task by ID.
      3. Get all your tasks.
      4. Log out.
      5. Set done task by ID.
      6. Update task by ID
      7. Convert to Jason
      8. Exit.
      """)
    
    number = readLine() ?? ""
    
    
    
    
    if number == "1" {
        print("New task page.")
        taskItem.createTask()
        if !taskItem.taskArray.isEmpty {
            
            UserTaskArray[0] = taskItem.description
            UserTaskArray[1] = user
            dataArray.append(UserTaskArray)
        }
        
    } else if number == "2" {
        print("Delete task page")
        toDo.getAllTasksInfo()
        print("Choose task number")
        let ind = readLine() ?? ""
        //Int(ind)
        if let index = Int(ind), index > 0, index <= taskItem.taskArray.count {
             let id = taskItem.taskArray[index - 1].taskID
             toDo.deleteTask(taskID: id, userID: user)
         } else {
             print("Invalid task number.")
         }
        
    } else if number == "3" {
        toDo.getTasks(userID: user)
        
    } else if number == "4" {
        print("successful log out")
        loginRegister()
        toDo.userID = user
        
    } else if number == "5" {
        print("Choose task ID to ser it done:")
        toDo.getAllTasksInfo()
        let ind = readLine() ?? ""

        if let index = Int(ind), index > 0, index <= taskItem.taskArray.count {
            let id = taskItem.taskArray[index - 1].taskID
            toDo.setDone(taskID: id)
         } else {
             print("Invalid task number.")
         }
        
    } else if number == "6" {
        print("Choose task ID to ser it done:")
        toDo.getAllTasksInfo()
        let ind = readLine() ?? ""

        if let index = Int(ind), index > 0, index <= taskItem.taskArray.count {
            let id = taskItem.taskArray[index - 1].taskID
            toDo.updateTask(taskID: id)
         } else {
             print("Invalid task number.")
         }
        
    } else if number == "7" {
        serializer.appendObjectsToJSONFile(objects: dataArray, filePath: "output.json")
        serializer.appendObjectsToJSONFile(objects: taskItem.taskArray, filePath: "output2.json")
        serializer.appendObjectsToJSONFile(objects: reg.users, filePath: "output3.json")
        
        var test = taskItem.taskArray
        test.removeAll()
        test = serializer.convertJSONFileToObjects(filePath: "output2.json")!
        print(test)
        
    } else if number == "8" {
        break
    }
}
