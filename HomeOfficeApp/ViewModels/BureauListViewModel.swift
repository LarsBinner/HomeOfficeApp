//
//  BureauListViewModel.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 01.04.21.
//
/*
import Foundation
import Combine
import Firebase

class BureauListViewModel : ObservableObject {
    @Published var bureau : Bureau = Bureau(bureau: "", people: "")
    
    private var databaseBureau = Firestore.firestore()

    private func addBureau(bureau: Bureau) {
        do {
            let _ = try databaseBureau.collection("bureaus").addDocument(from: bureau)
        }
        catch {
            print(error)
        }
    }
    
    private func updateBureau(_ bureau: Bureau) {
        if let documentId = bureau.id {
        do {
          try databaseBureau.collection("bureaus").document(documentId).setData(from: bureau)
        }
        catch {
          print(error)
        }
      }
    }
    
    private func updateOrAddBureau() {
        if let _ = bureau.id {
          self.updateBureau(self.bureau)
        }
        else {
            addBureau(bureau: bureau)
        }
      }
    
    func save() {
        updateOrAddBureau()
    }
}
*/
