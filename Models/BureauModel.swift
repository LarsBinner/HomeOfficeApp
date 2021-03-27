//
//  BureauModel.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 21.03.21.
//  Model for bureau

import Foundation

struct Bureau : Identifiable {
    let id = UUID()
    let picture : String
    let name: String
    let childs : [Bureau]?
}

extension Bureau {
    // Persons
    static let person1 = Bureau(picture: "1.circle", name: "Lars Binner", childs: nil)
    static let person2 = Bureau(picture: "1.circle", name: "Malte Nienaber", childs: nil)
    static let person3 = Bureau(picture: "1.circle", name: "Stefan Peters", childs: nil)
    static let person4 = Bureau(picture: "1.circle", name: "Nico Müller", childs: nil)
   
    //Bureaus
    static let group1 = Bureau(picture: "1.circle", name: "Büro 1", childs: [Bureau.person1, Bureau.person2])
    static let group2 = Bureau(picture: "1.circle", name: "Büro 2", childs: [Bureau.person3, Bureau.person4])
}

