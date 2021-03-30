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
    
    var body: some View {
        NavigationView(){
            List(bureauViewModel.bureaus) { bureau in
                VStack(alignment: .leading) {
                    Text(bureau.bureau)
                        .font(.title)
                    Text(bureau.people)
                        .font(.title2)
                }
            }
            .navigationBarTitle("Bürobelegung")
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


