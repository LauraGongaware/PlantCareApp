//
//  Watering.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/17/22.
//

import Foundation

struct Watering: Identifiable, Equatable, Codable {
    var id = UUID()
    var date = Date()
    
    static func == (lhs: Watering, rhs: Watering) -> Bool {
      lhs.id == rhs.id
    }
}
