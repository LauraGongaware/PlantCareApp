//
//  MyCollection.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/13/22.
//

import Foundation
import SwiftUI

struct MyCollection: Identifiable, Codable {
    var plantName: String
    var scientificName: String
    var water: String
    var sunlight: String
    var description: String
    var date = Date()
    var id = UUID()
    var journals: [Journal] = []
    
}

extension MyCollection: Equatable {
    
}
