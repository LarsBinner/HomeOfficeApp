//
//  To-DoView.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 21.03.21.
//  To-Do tab view

import SwiftUI

struct To_DoView: View {
    
    @ObservedObject var taskListViewModel = TaskListViewModel()
    @State var showNewTask = false
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                List{
                    ForEach(taskListViewModel.taskEntryViewModels){ taskEntryViewModel in
                        TaskEntry(taskEntryViewModel: taskEntryViewModel)
                    }
                    if showNewTask {
                        TaskEntry(taskEntryViewModel: TaskEntryViewModel(task: Task(title: "", finished: false))) {task in
                            self.taskListViewModel.addTask(task: task)
                            self.showNewTask.toggle()
                        }
                    }
                }
                Button(action: {
                    self.showNewTask.toggle()
                }) {
                    HStack {
                        Image(systemName: "plus.square")
                        Text("Aufgabe hinzufügen")
                    }
                }
                .padding()
            }
            .navigationBarTitle("To-Do Liste")
        }
    }
}

struct To_Do_Previews: PreviewProvider {
    static var previews: some View {
        To_DoView()
    }
}

struct TaskEntry: View {
    @ObservedObject var taskEntryViewModel: TaskEntryViewModel
    @ObservedObject var taskListViewModel = TaskListViewModel()
    var onCommit: (Task) -> (Void) = { _ in }
    
    var body: some View {
        HStack {
            Image(systemName: taskEntryViewModel.task.finished ? "checkmark.square" : "square")
                .onTapGesture {
                    taskEntryViewModel.task.finished.toggle()
                }
            TextField("Aufgabe formulieren", text: $taskEntryViewModel.task.title, onCommit: { self.onCommit(self.taskEntryViewModel.task)
            })
            Button(action: {
                self.taskListViewModel.deleteTask(task: taskEntryViewModel.task)
            }) {
                HStack {
                    Image(systemName: "minus.square")
                    Text("Löschen")
                }
            }
        }
    }
}
