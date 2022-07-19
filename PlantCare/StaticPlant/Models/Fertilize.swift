//
//  Fertilize.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/17/22.
//

import Foundation

struct Fertilize: Identifiable, Equatable, Codable {
    var id = UUID()
    var date = Date()
    
    static func == (lhs: Fertilize, rhs: Fertilize) -> Bool {
      lhs.id == rhs.id
    }
}
