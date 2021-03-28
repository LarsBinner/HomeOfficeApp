//
//  ChatEntryViewModel.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 28.03.21.
//

import Foundation
import Combine

    class ChatEntryViewModel: ObservableObject, Identifiable  {
     
      @Published var chat: Chat
      @Published var chatDatabase = ChatDatabase()
      var id: String = ""
      private var cancellables = Set<AnyCancellable>()
      
      init(chat: Chat) {
        self.chat = chat
        
        $chat
          .compactMap { chat in
            chat.id
          }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
        
        $chat
            .dropFirst()
            .debounce(for: 1.0, scheduler: RunLoop.main)
            .sink {chat in
                self.chatDatabase.updateChat(chat)
            }
            .store(in: &cancellables)
    }
}
