//
//  Journal.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/17/22.
//

import Foundation

struct Journal: Identifiable, Equatable, Codable {
    var id = UUID()
    var waterings: [Watering] = []
    var fertilizings: [Fertilize] = []
    var notes: [Note] = []
    var addedDates: [AddedDate] = []
    
    static func == (lhs: Journal, rhs: Journal) -> Bool {
      lhs.id == rhs.id
    }
}
