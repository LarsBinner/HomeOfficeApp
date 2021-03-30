//
//  BureauModel.swift
//  HomeOfficeApp
//
//  Created by Lars Binner on 30.03.21.
//

import Foundation
import FirebaseFirestoreSwift

struct Bureau : Identifiable, Codable {
    @DocumentID var id : String? = UUID().uuidString
    var bureau : String
    var people : String
}
