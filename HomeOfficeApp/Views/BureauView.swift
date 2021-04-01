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
    
    /*private func bureauListView(bureau: Bureau) -> some View {
        NavigationLink(destination: BureauDetailView(bureau: bureau)) {
          VStack(alignment: .leading) {
            Text(bureau.bureau)
              .font(.headline)
            Text(bureau.people)
              .font(.subheadline)
          }
        }
      } */
    
    var body: some View {
        NavigationView(){
            /*List {
                ForEach (bureauViewModel.bureaus) { bureau in
                        bureauListView(bureau: bureau)
                  }
                }*/
            List(bureauViewModel.bureaus) { bureau in
                VStack(alignment: .leading) {
                    Text(bureau.bureau)
                        .font(.headline)
                    Text(bureau.people)
                        .font(.subheadline)
                }
            }
            .navigationBarTitle("Bürobelegung")
            /*.toolbar {
                ToolbarItem {
                    Button(action: { openEditor.toggle() }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .sheet(isPresented: $openEditor) {
                BureauAddView()
            }*/
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


