//
//  Note.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/17/22.
//

import Foundation

struct Note: Identifiable, Equatable, Codable {
    var id = UUID()
    var noteText: String
    var date = Date()
    
    static func == (lhs: Note, rhs: Note) -> Bool {
      lhs.id == rhs.id
    }
}
