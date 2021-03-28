//
//  ChatListViewModel.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 28.03.21.
//

import Foundation
import Combine

class ChatListViewModel: ObservableObject  {
    // Instanziieren des Fierabase Chats Database
    @Published var chatDatabase = ChatDatabase()
    
    @Published var chatEntryViewModels = [ChatEntryViewModel]()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        chatDatabase.$chats
            .map { chats in
                chats.map { chat in
                    ChatEntryViewModel(chat: chat)
                }
            }
            .assign(to: \.chatEntryViewModels, on: self)
            .store(in: &cancellables)
    }

    func addChat(chat: Chat) {
        chatDatabase.addChatToDatabase(chat)
    }
}
