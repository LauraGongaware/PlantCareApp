//
//  StaticPlant.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/12/22.
//

import Foundation

class StaticPlant: Identifiable {
    var plantName: String
    var scientificName: String
    var water: Int
    var sunlight: Int
    var description: String
    var toxicity: String
    var staticImage: String
    
    init(plantName: String, scientificName: String, water: Int, sunlight: Int, description: String, toxicity: String, staticImage: String) {
        self.plantName = plantName
        self.scientificName = scientificName
        self.water = water
        self.sunlight = sunlight
        self.description = description
        self.toxicity = toxicity
        self.staticImage = staticImage
    }
}
