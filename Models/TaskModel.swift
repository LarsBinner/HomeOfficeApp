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
    @DocumentID var id: String? // Firebase Document ID e.g. "5AFED5..."
    var title: String
    var finished: Bool
    @ServerTimestamp var timestampCreated : Timestamp? //Set Server Timestamp for right sorting
}

let taskExamples = [
    Task(title: "Erste Aufgabe", finished: true),
    Task(title: "Zweite Aufgabe", finished: false),
    Task(title: "Dritte Aufgabe", finished: false)
]
