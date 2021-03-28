//
//  BureauModel.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 21.03.21.
//  Model for bureau

import Firebase
import FirebaseFirestore

import Foundation

struct BureauDataType: Identifiable {
    var id: String
    var msg: String
}

let dbBureau = Firestore.firestore().collection("bureaus")
let fbData = FirebaseData()

class FirebaseData: ObservableObject {
    
    @Published var data = [BureauDataType]()
    
    init() {
        readBureauData()
    }
    func createBureauData(text1:String) {
        dbBureau.document().setData(["id" : dbBureau.document().documentID,"title":text1]) { (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("data succesfully added")
            }
        }
    }
    func readBureauData() {
        dbBureau.addSnapshotListener { (documentSnapshot, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("data succesfully readed")
            }
            
            documentSnapshot!.documentChanges.forEach { diff in
                if (diff.type == .added) {
                    let bureauData = BureauDataType(id: diff.document.documentID, msg: diff.document.get("title") as! String)
                    self.data.append(bureauData)
                }
                if (diff.type == .modified) {
                    self.data = self.data.map { (Data) -> BureauDataType in
                        var data = Data
                        if data.id == diff.document.documentID {
                            data.msg = diff.document.get("title") as! String
                            return data
                        }else {
                            return Data
                        }
                    }
                }
            }
        }
    }
    func deleteBureauData(datas: FirebaseData ,index: IndexSet) {
        let id = datas.data[index.first!].id
        dbBureau.document(id).delete { (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("data succesfully deleted")
            }
            datas.data.remove(atOffsets:index)
        }
    }
    
    func updateBureauData(id: String, txt: String) {
        dbBureau.document(id).updateData(["testText":txt]) { (err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }else {
                print("update data success")
            }
        }
    }
}
