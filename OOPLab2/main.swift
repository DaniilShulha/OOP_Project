//
//  main.swift
//  OOPLab2
//
//  Created by znexie on 19.03.24.
//

import Foundation

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
            print("Registration page.")
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
      7. Exit.
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
        break
    }
}


//class Task {
//    let taskID = UUID().uuidString
//    var description: String
//    var dueDate: Date
//    let createdDate = Date()
//    var isDone: Bool
//
//    init(description: String, dueDate: Date, isDone: Bool) {
//        self.description = description
//        self.dueDate = dueDate
//        self.isDone = isDone
//    }
//
//    func newTask() {
//        print("Creating new task...")
//        print("Write tasks description")
//        let description = readLine() ?? ""
//        var dueDate: Date
//
//        print("Write task's due date (dd-MM-yyyy):")
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd-MM-yyyy"
//
//        if let dateString = readLine(), let date = dateFormatter.date(from: dateString) {
//            dueDate = date
//        } else {
//            print("Invalid due date format. Task not created.")
//            return
//        }
//
//        let task = Task(description: description, dueDate: dueDate, isDone: false)
//        tasksArray.append(task)
//    }
//
//    func deleteTask(taskID: String) {
//        if let index = tasksArray.firstIndex(where: { $0.taskID == taskID }) {
//            tasksArray.remove(at: index)
//            print("Task with ID \(taskID) has been deleted.")
//        } else if taskID.isEmpty {
//            print("Invalid task ID")
//        } else {
//            print("Task with ID \(taskID) not found.")
//        }
//    }
//
//    func getTasksID(array: [Task]) -> String? {
//        for (index, task) in array.enumerated() {
//            print("\(index + 1). \(task.taskID) - \(task.description)")
//        }
//
//        print("Enter the number of the task ID to select:")
//        if let choice = readLine(), let taskIndex = Int(choice) {
//            let selectedIndex = taskIndex - 1
//
//            if selectedIndex >= 0 && selectedIndex < array.count {
//                return array[selectedIndex].taskID
//            } else {
//                print("Invalid task number.")
//            }
//        } else {
//            print("Invalid input.")
//        }
//
//        return nil
//    }
//
//    func setDone(taskID: String) {
//        if let index = tasksArray.firstIndex(where: { $0.taskID == taskID }) {
//            if tasksArray[index].isDone {
//                print("Task already done")
//            } else {
//                tasksArray[index].isDone = true
//            }
//
//            print("Task with ID \(taskID) has been marked as done.")
//        } else if taskID.isEmpty {
//            print("Invalid ID")
//
//        } else {
//            print("Task with ID \(taskID) not found.")
//        }
//    }
//
//    func update(taskID: String) {
//        let check = true
//
//        if let index = tasksArray.firstIndex(where: { $0.taskID == taskID }) {
//            while check {
//                print("Write new description:")
//                tasksArray[index].description = readLine() ?? ""
//
//                if tasksArray[index].description.isEmpty {
//                    print("Invalid input")
//
//                } else {
//                    break
//                }
//            }
//
//            print("Task with ID \(taskID) has been marked updated.")
//        } else if taskID.isEmpty {
//            print("Invalid ID")
//
//        } else {
//            print("Task with ID \(taskID) not found.")
//        }
//
//    }
//
//    var detailedDescription: String {
//        return "Task ID: \(taskID), description: \(description), due date: \(dueDate), created date: \(createdDate), is done: \(isDone)"
//    }
//}
//
//
//
//class User {
//    var userID = UUID().uuidString
//    var username: String
//    var email: String
//    var joined = Date()
//
//    init(userID: String = UUID().uuidString, username: String, email: String, joined: Date = Date()) {
//        self.userID = userID
//        self.username = username
//        self.email = email
//        self.joined = joined
//    }
//
//    //init
//
//    func registration() {
//        let user = User(username: "", email: "")
//        var isValid = false
//
//        while !isValid {
//            print("Write username:")
//            user.username = readLine()!
//
//            print("Write email:")
//            user.email = readLine()!
//
//            isValid = user.isValidEmail() && user.isValidUsername()
//
//            if !isValid {
//                print("Invalid username or email. Please try again.")
//            }
//        }
//
//        usersArray.append(user)
//    }
//
//    func login(username: String, email: String) -> Bool {
//        if usersArray.first(where: { $0.username == username && $0.email == email }) != nil {
//            return true
//        } else {
//            return false
//        }
//    }
//
//    private func isValidUsername() -> Bool {
//        return !username.isEmpty
//    }
//
//    private func isValidEmail() -> Bool {
//        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
//        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
//        return emailPredicate.evaluate(with: email)
//    }
//
//    var detailedDescription: String {
//        return "User ID: \(userID), username: \(username), email: \(email), joined: \(joined)"
//    }
//}
//
//
//var tasksArray: [Task] = []
//var usersArray: [User] = []
//var task = Task(description: "", dueDate: Date(), isDone: false)
//var check = true
//var id = ""
//while check {
//    print("""
//        What do you want? Choose a number:
//        1. Register
//        2. Login
//        3. Add new task
//        4. Get tasks id
//        5. Delete task by ID
//        6. Make task done
//        7. Update task by ID
//        8. Exit
//        """)
//
//    let number = readLine()
//
//    if number == "1" {
//        //userService.registerUser()
//        print("Create user:")
//        let user = User(username: "", email: "")
//        user.registration()
//
//    } else if number == "2" {
//        print("Login:")
//        print("Enter username:")
//        let username = readLine() ?? ""
//        print("Enter email:")
//        let email = readLine() ?? ""
//        let user = User(username: username, email: email)
//
//        if user.login(username: username, email: email) {
//            print("Login successful!")
//        } else {
//            print("Login failed. Invalid username or email.")
//        }
//
//    } else if number == "3" {
//        let task = Task(description: "", dueDate: Date(), isDone: false)
//        task.newTask()
//
//    } else if number == "4" {
//        print("All id")
//        id = task.getTasksID(array: tasksArray)!
//        print(id)
//
//    } else if number == "5" {
//        task.deleteTask(taskID: id)
//
//    } else if number == "6" {
//        task.setDone(taskID: id)
//
//    } else if number == "7" {
//        task.update(taskID: id)
//
//    } else if number == "8" {
//        break
//    }
//}
//
//
//
//var i = 1
//for user in usersArray {
//    print("User \(i)")
//    print(user.detailedDescription)
//    print()
//    i += 1
//}
//
//var ind = 1
//for task in tasksArray {
//    print("Task \(ind)")
//    print(task.detailedDescription)
//    print()
//    ind += 1
//}



////print("You have created user with id \(user)")
//
//
//
////var user1 = log.login(users: reg.users)
//var user2 = log.login(users: reg.users)
//admin.detailedDescription(users: reg.users)
//
//var id1 = "1"
//var id2 = "2"
//
////var taskItem = NewItemViewModel()
//taskItem.createTask()
//
//UserTaskArray[0] = taskItem.description
////UserTaskArray[1] = user1 ?? ""
//
//print(UserTaskArray)
//dataArray.append(UserTaskArray)
//dataArray.remove(at: 0)
//print(dataArray)
////data[0].append(contentsOf: UserTaskArray)
//
//taskItem.createTask()
//UserTaskArray[0] = taskItem.description
//UserTaskArray[1] = user2 ?? ""
//print(UserTaskArray)
//dataArray.append(UserTaskArray)
//
//print(dataArray)
//
////let toDo = ToDoListViewModel(userID: user1 ?? "")
////toDo.getTasks(userID: user1 ?? "")
////
////toDo.getAllTasksInfo()
////var id = taskItem.taskArray[0].taskID
////toDo.deleteTask(taskID: id, userID: user1 ?? "")
//print(dataArray)
