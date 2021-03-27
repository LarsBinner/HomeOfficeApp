//
//  BureauViewModel.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 26.03.21.
//
/*
import Foundation
import Combine

    class BureauViewModel: ObservableObject, Identifiable  {
     
      @Published var bureau: Bureau
      var id: String = ""
      @Published var selectedState = ""
      private var cancellables = Set<AnyCancellable>()
      
      init(bureau: Bureau) {
        self.bureau = bureau
        
        $bureau
          .map { bureau in
            bureau.selected ? "checkmark.square" : "square"
          }
            .assign(to: \.selectedState, on: self)
            .store(in: &cancellables)
        
        $bureau
          .compactMap { bureau in
            bureau.id
          }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
*/
