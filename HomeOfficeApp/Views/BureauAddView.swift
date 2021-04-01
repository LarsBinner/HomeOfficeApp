//
//  BureauAddView.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 01.04.21.
//
/*
import SwiftUI

struct BureauAddView: View {

    @Environment(\.presentationMode) private var presentationMode
    @StateObject var bureauViewModel = BureauListViewModel()
    var mode: Mode = .new
    
    var body: some View {

        NavigationView {
          Form {
            Section(header: Text("Büro einfügen")) {
                TextField("Büro eingeben", text: $bureauViewModel.bureau.bureau)
            }
            Section(header: Text("Personen")) {
                TextField("Personen", text: $bureauViewModel.bureau.people)
            }

          }
          .navigationTitle(mode == .new ? "Büro einfügen" : bureauViewModel.bureau.bureau)
            .navigationBarTitleDisplayMode(mode == .new ? .inline : .large)
          .navigationBarItems(
            leading: Button(action: {backTap()}, label: {
                Text("zurück")
            }),
            trailing: Button(action: {readyTap()}, label: {
                Text("fertig")
          })
        )
        }
      }

      func backTap() {
        self.dismiss()
      }

      func readyTap() {
        self.dismiss()
        bureauViewModel.save()
      }

      func deleteTap() {
        presentationMode.wrappedValue.dismiss()
      }

      func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
      }
}

enum Mode {
  case new
  case edit
}

struct BureauAddView_Previews: PreviewProvider {
    static var previews: some View {
        BureauAddView()
    }
}
*/
