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
}
