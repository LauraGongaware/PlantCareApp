//
//  AddedDate.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/18/22.
//

import Foundation
struct AddedDate: Identifiable, Equatable, Codable {
    
    var id = UUID()
    var date = Date()
    
    static func == (lhs: AddedDate, rhs: AddedDate) -> Bool {
      lhs.id == rhs.id
    }
}
