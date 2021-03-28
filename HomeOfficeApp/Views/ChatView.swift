//
//  ChatView.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 28.03.21.
//

import SwiftUI

struct ChatView: View {

    @ObservedObject var chatListViewModel = ChatListViewModel()
    @State var showNewChat = false

    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                List{
                    ForEach(chatListViewModel.chatEntryViewModels){ chatEntryViewModel in
                        ChatEntry(chatEntryViewModel: chatEntryViewModel)
                    }
                    if showNewChat {
                        ChatEntry(chatEntryViewModel: ChatEntryViewModel(chat: Chat(title: ""))) {chat in
                            self.chatListViewModel.addChat(chat: chat)
                            self.showNewChat.toggle()
                        }
                    }
                }
                Button(action: {
                    self.showNewChat.toggle()
                }) {
                    HStack {
                        Image(systemName: "plus.square")
                        Text("Chat hinzufügen")
                    }
                }
                .padding()
            }
            .navigationBarTitle("Chat")
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

struct ChatEntry: View {
    @ObservedObject var chatEntryViewModel: ChatEntryViewModel
    var onCommit: (Chat) -> (Void) = { _ in }

    var body: some View {
        HStack {
            TextField("Nachricht eingeben", text: $chatEntryViewModel.chat.title, onCommit: { self.onCommit(self.chatEntryViewModel.chat)
            })
        }
    }
}
