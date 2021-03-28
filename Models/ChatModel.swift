//
//  ChatModel.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 28.03.21.
//  Model for Chat

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Chat: Codable, Identifiable {
    @DocumentID var id: String? // Firebase Document ID e.g. "5AFED5..."
    var title: String
    @ServerTimestamp var timestampCreated : Timestamp? //Set Server Timestamp for right sorting
}
