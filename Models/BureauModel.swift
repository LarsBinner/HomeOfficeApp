//
//  BureauModel.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 21.03.21.
//  Model for bureau

import Foundation

struct Person: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
}

let persons = [
    Person(name: "Lars"),
    Person(name: "Malte"),
    Person(name: "Niclaas"),
    Person(name: "Patrick")
]
