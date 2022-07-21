//
//  Toxicity.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/20/22.
//

import Foundation
import SwiftUI

struct Toxicity: View {
    
        var staticPlantList : Plant
        var body: some View {
            
            if staticPlantList.toxicity == true {
                HStack {
                    Text("This plant is toxic to pets")
                    Image(systemName: "pawprint.circle")
                        .foregroundColor(.red)
                }
            }
            else if staticPlantList.toxicity == false {
                HStack {
                    Text("This plant is safe for pets")
                    Image(systemName: "pawprint.circle")
                        .foregroundColor(.green)
            }
        }
    }
}
