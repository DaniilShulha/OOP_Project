//
//  ContentView.swift
//  MyToDo
//
//  Created by znexie on 2.06.24.
//

import SwiftUI
import FirebaseAuth
import Foundation
import OOPLibrary
struct ContentView: View {
    var body: some View {
        CalendarView(viewModel: ToDoViewModel())
    }
}

struct CalendarHeader: View {
    @Binding var currentDate: Date
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL yyyy"
        return formatter
    }
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    if let newDate = Calendar.current.date(byAdding: .month, value: -1, to: currentDate) {
                        currentDate = newDate
                    }
                }
            }) {
                Image(systemName: "chevron.left")
                    .padding()
            }
            
            Spacer()
            
            Text(dateFormatter.string(from: currentDate))
                .font(.headline)
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    if let newDate = Calendar.current.date(byAdding: .month, value: 1, to: currentDate) {
                        currentDate = newDate
                    }
                }
            }) {
                Image(systemName: "chevron.right")
                    .padding()
            }
        }
        .padding()
    }
}


struct Calendar1: View {
    let currentDate: Date
    let todos: [ToDoListItem]
    @Binding var selectedDate: Date?
    
    private var daysInMonth: [Date] {
        let calendar = Calendar.current
        guard let range = calendar.range(of: .day, in: .month, for: currentDate),
              let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate)) else {
            return []
        }
        
        return range.compactMap { day -> Date? in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)
        }
    }
    
    private var firstDayOfMonth: Date? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: currentDate)
        return calendar.date(from: components)
    }
    
    private var startingOffset: Int {
        guard let firstDay = firstDayOfMonth else {
            return 0
        }
        let calendar = Calendar.current
        let firstWeekday = calendar.component(.weekday, from: firstDay)
        return (firstWeekday - calendar.firstWeekday + 7) % 7
    }
    
    private var daysOfWeek: [String] {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.shortStandaloneWeekdaySymbols
    }
    
    private func isDueDate(_ date: Date) -> Bool {
        let calendar = Calendar.current
        return todos.contains { todo in
            calendar.isDate(Date(timeIntervalSince1970: todo.dueDate), inSameDayAs: date)
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                }
            }
            
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<startingOffset, id: \.self) { _ in
                    Text("")
                        .frame(width: 40, height: 40)
                }
                ForEach(daysInMonth, id: \.self) { date in
                    VStack {
                        Text("\(Calendar.current.component(.day, from: date))")
                            .frame(width: 40, height: 40)
                            .background(isDueDate(date) ? Color.red.opacity(0.2) : Color.clear)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.blue, lineWidth: selectedDate == date ? 2 : 0)
                            )
                            .onTapGesture {
                                selectedDate = date
                            }
                        
                        if isDueDate(date) {
                            Circle()
                                .fill(Color.red)
                                .frame(width: 8, height: 8)
                                .padding(.top, -12)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct TaskListView: View {
    let date: Date
    let todos: [ToDoListItem]
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    private var tasksForDate: [ToDoListItem] {
        let calendar = Calendar.current
        return todos.filter { todo in
            calendar.isDate(Date(timeIntervalSince1970: todo.dueDate), inSameDayAs: date)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tasks for \(dateFormatter.string(from: date))")
                .font(.headline)
                .padding(.top)
            
            if tasksForDate.isEmpty {
                Text("No tasks for this date")
                    .foregroundColor(.gray)
            } else {
                ForEach(tasksForDate) { todo in
                    VStack(alignment: .leading) {
                        Text(todo.title)
                            .font(.subheadline)
                        Text("Due: \(dateFormatter.string(from: Date(timeIntervalSince1970: todo.dueDate)))")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Divider()
                    }
                    .padding(.vertical, 5)
                }
            }
        }
        .padding()
    }
}

struct CalendarView: View {
    @ObservedObject var viewModel: ToDoViewModel
    @State private var currentDate = Date()
    @State private var selectedDate: Date?
    
    var body: some View {
        VStack {
            CalendarHeader(currentDate: $currentDate)
            Calendar1(currentDate: currentDate, todos: viewModel.todos, selectedDate: $selectedDate)
                .onAppear {
                    if let user = Auth.auth().currentUser {
                        viewModel.fetchToDos(userId: user.uid)
                    }
                }
                .padding(.top)
            
            ScrollView {
                if let selectedDate = selectedDate {
                    TaskListView(date: selectedDate, todos: viewModel.todos)
                        .frame(height: 200) // Фиксированный размер списка задач
                } else {
                    Text("Select a date to see tasks")
                        .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
