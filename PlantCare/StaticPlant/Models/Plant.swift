//
//  Plant.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/12/22.
//

import Foundation

struct Plant: Identifiable, Codable, Equatable {
    
    var plantName: String
    var scientificName: String
    var water: Int
    var sunlight: Int
    var description: String
    var toxicity: Bool
    var staticImage: String
    var dateAdded = Date()
    var id = UUID()
    var journals: [Journal] = []
    var isCollectionPlant = false
    var userCreated = false

    static func == (lhs: Plant, rhs: Plant) -> Bool {
      lhs.id == rhs.id
    }
}
//MARK: - May use this in the future to toggle between the two parts of the colllection
//class UserCreatedPlant: Plant {
//    var userCreated = true
//    var isCollectionPlant = true
//}
