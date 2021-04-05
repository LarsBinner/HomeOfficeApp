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

struct BureauView: View {
    
    @ObservedObject private var bureauViewModel = BureauViewModel()
    @State private var openEditor = false
    
    var body: some View {
        NavigationView(){
            List(bureauViewModel.bureaus) { bureau in
                VStack(alignment: .leading) {
                    Text(bureau.bureau)
                        .font(.headline)
                    Text(bureau.people)
                        .font(.subheadline)
                    Button(action: {
                        self.bureauViewModel.deleteData(bureau: bureau)
                    }) {
                        HStack {
                            Image(systemName: "minus.square")
                            Text("Löschen")
                        }
                    }
                }
            }
            .navigationBarTitle("Bürobelegung")
            // Initiales Laden aus Firebase
            .onAppear(){
                self.bureauViewModel.loadData()
            }
        }
    }
}


struct BureauView_Previews: PreviewProvider {
    static var previews: some View {
        BureauView()
    }
}
