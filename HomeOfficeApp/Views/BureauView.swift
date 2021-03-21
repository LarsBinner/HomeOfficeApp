//
//  BureauView.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 21.03.21.
//

import SwiftUI

struct BureauView: View {
    
    @State private var amountBureausEntry = 1
    @State private var selectedPersons: Set<UUID> = []
    
    var body: some View {
        VStack{
        Text("Vorgesetzter")
            .font(.largeTitle)
            HStack {
                Text("Büroauswahl")
                    .font(.title2)
                    .padding()
                Spacer()
            }
            HStack{
                TextField("Anzahl Büros angeben", value: self.$amountBureausEntry, formatter: NumberFormatter())
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                Button(action: {
                    print("button pressed")
                })
                {
                    Text("Anwenden")
                        .padding()
                        .buttonStyle(BorderlessButtonStyle())
                }
            }
            VStack {
                HStack {
                    Text("Büro 1")
                    Spacer()
                    EditButton()
                }
                .padding()
                List(persons, selection: $selectedPersons){ person in
                    Text(person.name)
                }
            }
        Spacer()
        }
    }
}

struct Vorgesetzter_Previews: PreviewProvider {
    static var previews: some View {
        BureauView()
    }
}

