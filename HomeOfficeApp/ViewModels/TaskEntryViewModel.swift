//
//  TaskEntryViewModel.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 21.03.21.
//

import Foundation
import Combine

    class TaskEntryViewModel: ObservableObject, Identifiable  {
     
      @Published var task: Task
      var id: String = ""
      @Published var finishedState = ""
      private var cancellables = Set<AnyCancellable>()
      
      init(task: Task) {
        self.task = task
        
        $task
          .map { task in
            task.finished ? "checkmark.square" : "square"
          }
            .assign(to: \.finishedState, on: self)
            .store(in: &cancellables)
        
        $task
          .map { task in
            task.id
          }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
