//
//  BureauView.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 21.03.21.
//  Bureau tab view

import SwiftUI

struct BureauView: View {
    
    let  childs: [Bureau] = [.group1, .group2]
    
    var body: some View {
        NavigationView {
            List(childs, children: \.childs) { row in
                Image(systemName: row.picture)
                Text(row.name)
            }
        .navigationTitle("Bürobelegung")
        }
    }
}

struct Vorgesetzter_Previews: PreviewProvider {
    static var previews: some View {
        BureauView()
    }
}
