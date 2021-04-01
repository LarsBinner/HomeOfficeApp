//
//  BureauDetailView.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 01.04.21.
//
/*
import SwiftUI

struct BureauDetailView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    var bureau : Bureau
    @State var presentEditBureauSheet = false
    
    var body: some View {
        Form {
              Section(header: Text("Büro")) {
                Text(bureau.bureau)
              }
              Section(header: Text("Personen")) {
                Text(bureau.people)
              }
            }
            .navigationBarTitle(bureau.bureau)
            .navigationBarItems(trailing:
                Button(action: { self.presentEditBureauSheet}) {
                Text("Edit")
              }
            )
            .sheet(isPresented: self.$presentEditBureauSheet) {
                BureauAddView(bureauViewModel: BureauListViewModel(), mode: .edit)
            }
    }
}

struct BureauDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let bureau = Bureau(bureau: "Büro 1", people: "Lars")
        return
          NavigationView {
            BureauDetailView(bureau: bureau)
          }
    }
}
*/
