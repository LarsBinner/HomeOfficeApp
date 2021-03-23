//
//  TaskModel.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 21.03.21.
//  Model for tasks

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var finished: Bool
}

let taskExamples = [
    Task(title: "Erste Aufgabe", finished: true),
    Task(title: "Zweite Aufgabe", finished: false),
    Task(title: "Dritte Aufgabe", finished: false)
]
