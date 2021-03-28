//
//  ChatDatabase.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 28.03.21.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class ChatDatabase: ObservableObject {
    @Published var chats = [Chat]()
    
    let database = Firestore.firestore()
    
    init() {
        loadingDatabase()
    }
    
    // Funktion zum Laden des Chats aus Firebase
    func loadingDatabase() {
        
        database.collection("chats")
            .order(by: "timestampCreated")
            .addSnapshotListener { (querySnapshot, Error) in
            if let querySnapshot = querySnapshot {
                self.chats = querySnapshot.documents.compactMap { document in
                    //Fehler abfangen
                    do{
                        let x = try document.data(as: Chat.self)
                        return x
                    }
                    catch {
                        print(error)
                    }
                    return nil
                }
            }
        }
    }
    
    // Funktion zum Hinzufügen einer Task zur Firebase Datenbank
    func addChatToDatabase(_ chat: Chat) {
        do {
            let _ = try database.collection("chats").addDocument(from: chat)
        }
        catch {
            fatalError("Error adding chat")
        }
    }
    
    // Funktion zum Updaten einer Task in der Firebase Datenbank
    func updateChat (_ chat: Chat) {
        if let chatID = chat.id {
            do {
                try database.collection("chats").document(chatID).setData(from: chat)
            }
            catch {
                fatalError("Can´t update chat:  \(error.localizedDescription)")
            }
        }
    }
}
