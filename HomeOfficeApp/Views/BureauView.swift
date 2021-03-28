//
//  BureauView.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 21.03.21.
//  Bureau tab view
//
import SwiftUI
import Firebase
import FirebaseFirestore

//struct BureauView: View {
//    @State private var textValue = ""
//    @State private var updateRowID = ""
//    @State private var updateRowValue = ""
//    @State private var isUpdate = false
//    @ObservedObject private var datas = fbData
//
//    var body: some View {
//        VStack {
//            List {
//                ForEach(datas.data){ data in
//                    HStack {
//                        Button(action: {
//                            self.isUpdate = true
//                            self.updateRowID = data.id
//                            self.updateRowValue = data.msg
//                        }) {
//                            Text(data.msg)
//                        }
//                    }
//                }.onDelete { (index) in
//                    fbData.deleteData(datas: self.datas, index: index)
//                }
//            }
//            self.isUpdate ? Text("The value ( \(updateRowValue) ) will chage") : nil
//            HStack {
//                Spacer()
//                TextField("Add text please", text: $textValue).textFieldStyle(RoundedBorderTextFieldStyle())
//                Button(action: {
//                    self.sendMessageButton()
//                }) {
//                    Text("Do It")
//                }
//                Spacer()
//            }
//        }
//    }
//
//    func sendMessageButton() {
//        self.isUpdate ? fbData.updateData(id: self.updateRowID, txt: self.textValue) : fbData.createData(msg1: self.textValue)
//        self.isUpdate = false
//        self.textValue = ""
//    }
//}
//



struct BureauView: View {
    var body: some View {
            Text("Hello World")
    }
}

struct Vorgesetzter_Previews: PreviewProvider {
    static var previews: some View {
        BureauView()
    }
}
