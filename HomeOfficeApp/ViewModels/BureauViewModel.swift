//
//  BureauViewModel.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 30.03.21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class BureauViewModel : ObservableObject {
    @Published var bureaus = [Bureau]()
    
    private var databaseBureau = Firestore.firestore()
    
    func loadData() {
        databaseBureau.collection("bureaus").addSnapshotListener{ (querySnapshot, error) in
            //Error Handling
            guard let documents = querySnapshot?.documents else {
                print ("Document List Emtpy")
                return
            }
            //Return Bureau Data from Firebase
            self.bureaus = documents.compactMap { (queryDocumentSnapshot) -> Bureau? in
                return try? queryDocumentSnapshot.data(as: Bureau.self)
            }
        }
    }
    
    func deleteData(bureau: Bureau) {
        databaseBureau.collection("bureaus").document(bureau.id ?? "").delete() { err in
        if let err = err {
          print("Error removing document: \(err)")
        }
        else {
          print("Document successfully removed!")
        }
      }
    }
    
    func updateData(_ bureau: Bureau) {
        if let documentId = bureau.id {
        do {
          try databaseBureau.collection("bureaus").document(documentId).setData(from: bureau)
        }
        catch {
          print(error)
        }
      }
    }
}
