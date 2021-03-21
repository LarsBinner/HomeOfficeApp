//
//  TaskListViewModel.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 21.03.21.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject  {
    @Published var taskEntryViewModels = [TaskEntryViewModel]()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.taskEntryViewModels = taskExamples.map {task in
            TaskEntryViewModel(task: task)
        }
    }
    func addTask(task: Task) {
        let taskViewModel = TaskEntryViewModel(task: task)
        self.taskEntryViewModels.append(taskViewModel)
    }
}
