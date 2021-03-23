//
//  TaskListViewModel.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 21.03.21.
//  View model for creating task list for To-DoView

import Foundation
import Combine

class TaskListViewModel: ObservableObject  {
    // Instanziieren der Fierabase Task Database
    @Published var taskDatabase = TaskDatabase()
    
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
        let taskViewModel = TaskEntryViewModel(task: task)
        self.taskEntryViewModels.append(taskViewModel)
    }
}


/* Old Code for taskExample Liste replaced by taskDatabase Firestore connection
init() {
 self.taskEntryViewModels = taskExamples.map {task in
     TaskEntryViewModel(task: task)
 }
} */
