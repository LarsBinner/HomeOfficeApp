//
//  HomeScreenView.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 21.03.21.
//  Home screen after login


import SwiftUI
import Firebase
import FirebaseAuth

struct HomeScreenView: View {
    
    var body: some View {
       
        TabView {
            EmployeeView()
                .tabItem {
                    Text("Mitarbeiter")
                    Image(systemName: "person.3")
            }
            BureauView()
                .tabItem {
                    Text("Vorgesetzter")
                    Image(systemName: "person.crop.circle")
            }
            To_DoView()
                .tabItem {
                    Text("To-Do")
                    Image(systemName: "doc")
            }
            ChatView()
                .tabItem {
                    Text("Chat")
                    Image(systemName: "text.bubble")
            }
        }
        .font(.headline)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
