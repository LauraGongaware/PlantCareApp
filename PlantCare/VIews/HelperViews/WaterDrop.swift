//
//  SunDrops.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/17/22.
//

import SwiftUI

struct Waterdrop: View {
    
    var staticPlantList: Plant
    
    var body: some View {
        if staticPlantList.water == 1 {
                    HStack {
                        Image(systemName: "drop.fill")
                            .foregroundColor(.cyan)
                        Image(systemName: "drop")
                            .foregroundColor(.cyan)
                        Image(systemName: "drop")
                            .foregroundColor(.cyan)
                        Image(systemName: "drop")
                            .foregroundColor(.cyan)
                        Image(systemName: "drop")
                            .foregroundColor(.cyan)
                    }
                } else if
                    staticPlantList.water == 2 {
                    HStack {
                    Image(systemName: "drop.fill")
                            .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                            .foregroundColor(.cyan)
                    Image(systemName: "drop")
                            .foregroundColor(.cyan)
                    Image(systemName: "drop")
                            .foregroundColor(.cyan)
                    Image(systemName: "drop")
                            .foregroundColor(.cyan)
                    }
                }
                else if
                    staticPlantList.water == 3 {
                    HStack {
                    Image(systemName: "drop.fill")
                            .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                            .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                            .foregroundColor(.cyan)
                    Image(systemName: "drop")
                            .foregroundColor(.cyan)
                    Image(systemName: "drop")
                            .foregroundColor(.cyan)
                    }
                }
                else if
                    staticPlantList.water == 4 {
                    HStack {
                    Image(systemName: "drop.fill")
                            .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                            .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                            .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                            .foregroundColor(.cyan)
                    Image(systemName: "drop")
                            .foregroundColor(.cyan)
                    }
                }
                else if
                    staticPlantList.water == 5 {
                    HStack {
                    Image(systemName: "drop.fill")
                            .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                            .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                            .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                            .foregroundColor(.cyan)
                    Image(systemName: "drop.fill")
                            .foregroundColor(.cyan)
                        }
                    }
                }
            }
        
            

//struct Waterdrop_Previews: PreviewProvider {
//    static var previews: some View {
//        WaterDrop(staticPlantList: staticPlantList)
//    }
//}
