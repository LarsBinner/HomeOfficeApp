////
////  BureauModel.swift
////  HomeOfficeApp
////
////  Created by Lars Binner on 21.03.21.
////  Model for bureau
//
//import Firebase
//import FirebaseFirestore
//
//let dbCollection = Firestore.firestore().collection("bureaus")
//let fbData = FirebaseData()
//
//class FirebaseData: ObservableObject {
//    
//    @Published var data = [BureauDataType]()
//    
//    init() {
//        readData()
//    }
//    
//    func createData(msg1:String) {
//        // To create or overwrite a single document
//        dbCollection.document().setData(["id" : dbCollection.document().documentID,"testText":msg1]) { (err) in
//            if err != nil {
//                print((err?.localizedDescription)!)
//                return
//            }else {
//                print("create data success")
//            }
//        }
//    }
//    //listener
//    func readData() {
//        dbCollection.addSnapshotListener { (documentSnapshot, err) in
//            if err != nil {
//                print((err?.localizedDescription)!)
//                return
//            }else {
//                print("read data success")
//            }
//            
//            documentSnapshot!.documentChanges.forEach { diff in
//                // Real time create from server
//                if (diff.type == .added) {
//                    let msgData = BureauDataType(id: diff.document.documentID, msg: diff.document.get("testText") as! String)
//                    self.data.append(msgData)
//                }
//                
//                // Real time modify from server
//                if (diff.type == .modified) {
//                    self.data = self.data.map { (eachData) -> BureauDataType in
//                        var data = eachData
//                        if data.id == diff.document.documentID {
//                            data.msg = diff.document.get("testText") as! String
//                            return data
//                        }else {
//                            return eachData
//                        }
//                    }
//                }
//            }
//        }
//    }
//    
//    func deleteData(datas: FirebaseData ,index: IndexSet) {
//        let id = datas.data[index.first!].id
//        dbCollection.document(id).delete { (err) in
//            if err != nil {
//                print((err?.localizedDescription)!)
//                return
//            }else {
//                print("delete data success")
//            }
//            datas.data.remove(atOffsets:index)
//        }
//    }
//    
//    func updateData(id: String, txt: String) {
//        dbCollection.document(id).updateData(["testText":txt]) { (err) in
//            if err != nil {
//                print((err?.localizedDescription)!)
//                return
//            }else {
//                print("update data success")
//            }
//        }
//    }
//}
