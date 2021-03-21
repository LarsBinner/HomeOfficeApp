//
//  HomeOfficeAppApp.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 21.03.21.
//

import SwiftUI
import Firebase

@main
struct HomeOfficeApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
