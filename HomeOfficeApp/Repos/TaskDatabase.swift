//
//  TaskDatabase.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 23.03.21.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskDatabase: ObservableObject {
    @Published var tasks = [Task]()
    
    let database = Firestore.firestore()
    
    init() {
        loadingDatabase()
    }
    
    // Funktion zum Laden der Tasks aus Firebase
    func loadingDatabase() {
        let userId = Auth.auth().currentUser?.uid
        
        database.collection("tasks")
            .order(by: "timestampCreated")
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { (querySnapshot, Error) in
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap { document in
                    //Fehler abfangen
                    do{
                        let x = try document.data(as: Task.self)
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
    func addToDatabase(_ task: Task) {
        do {
            // Add the current userId
            var addedTask = task
            addedTask.userId = Auth.auth().currentUser?.uid
            let _ = try database.collection("tasks").addDocument(from: addedTask)
        }
        catch {
            fatalError("Error adding task")
        }
    }
    
    // Funktion zum Updaten einer Task in der Firebase Datenbank
    func updateTask (_ task: Task) {
        if let taskID = task.id {
            do {
                try database.collection("tasks").document(taskID).setData(from: task)
            }
            catch {
                fatalError("Can´t update task:  \(error.localizedDescription)")
            }
        }
    }
}
