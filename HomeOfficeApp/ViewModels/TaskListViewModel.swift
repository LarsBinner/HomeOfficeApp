//
//  TaskListViewModel.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 21.03.21.
//  View model for creating task list for To-DoView

import Foundation
import FirebaseFirestore
import Combine

class TaskListViewModel: ObservableObject  {
    // Instanziieren der Fierabase Task Database
    @Published var taskDatabase = TaskDatabase()
    private var databaseTask = Firestore.firestore()
    
    @Published var taskEntryViewModels = [TaskEntryViewModel]()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        taskDatabase.$tasks
            .map { tasks in
                tasks.map { task in
                    TaskEntryViewModel(task: task)
                }
            }
            .assign(to: \.taskEntryViewModels, on: self)
            .store(in: &cancellables)
    }

    func addTask(task: Task) {
        taskDatabase.addToDatabase(task)
    }
    
    func deleteTask(task: Task) {
        databaseTask.collection("tasks").document(task.id ?? "").delete() { err in
        if let err = err {
          print("Error removing document: \(err)")
        }
        else {
          print("Document successfully removed!")
        }
      }
    }
}
