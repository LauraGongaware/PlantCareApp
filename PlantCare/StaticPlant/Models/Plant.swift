//
//  Plant.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/12/22.
//

import Foundation
import SwiftUI
import UIKit

struct Plant: Identifiable, Codable, Equatable {
    
    var plantName: String
    var scientificName: String
    var water: Int
    var sunlight: Int
    var description: String
    var toxicity: Bool
    var staticImage: String
    var image: Data?
    var date = Date()
    var id = UUID()
    var journals: [Journal] = []
    var isCollectionPlant = false
    var userCreated = false
//    
//    init(plantName: String, scientificName: String, water: Int, sunlight: Int, description: String, toxicity: Bool, staticImage: String) {
//        self.plantName = plantName
//        self.scientificName = scientificName
//        self.water = water
//        self.sunlight = sunlight
//        self.description = description
//        self.toxicity = toxicity
//        self.staticImage = staticImage
//    }

    static func == (lhs: Plant, rhs: Plant) -> Bool {
      lhs.id == rhs.id
    }
}
//MARK: - May use this in the future to toggle between the two parts of the colllection
//class UserCreatedPlant: Plant {
//    var userCreated = true
//    var isCollectionPlant = true
//}
