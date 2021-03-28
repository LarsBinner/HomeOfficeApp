//
//  BureauView.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 21.03.21.
//  Bureau tab view

import SwiftUI
import Firebase

struct BureauView: View {
    
    @State var firstName1 = ""
    @State var surname1 = ""
    
    var body: some View {
        Form {
            Section(header: Text("Person 1")) {
                HStack {
                    TextField("Vorname", text: $firstName1)
                    TextField("Nachname", text: $surname1)
                }
            }
            Button(action:  {
                self.addNames(firstName1: self.firstName1, surname1: self.surname1)
            }) {
                Text("Übernehmen")
                    .frame(width: 150, height: 30, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(12)
            }
        }
    }
    func addNames(firstName1: String, surname1: String) {
        let db = Firestore.firestore()
        db.collection("bureaus").document().setData(["FirstName": firstName1, "Surname": surname1])
    }
}

struct Vorgesetzter_Previews: PreviewProvider {
    static var previews: some View {
        BureauView()
    }
}
