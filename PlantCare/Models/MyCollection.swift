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
    var description: String
    var sunlight: String
    var plantPhoto: String
    var id = UUID()
    
}

extension MyCollection: Equatable {
    
}
