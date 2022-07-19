//
//  Sunshine.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/17/22.
//

import SwiftUI

struct Sunshine: View {
    
        var staticPlantList : Plant
        var body: some View {
            
            if staticPlantList.sunlight == 1 {
                HStack {
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                    Image(systemName: "sun.max")
                        .foregroundColor(.yellow)
                    Image(systemName: "sun.max")
                        .foregroundColor(.yellow)
                    Image(systemName: "sun.max")
                        .foregroundColor(.yellow)
                    Image(systemName: "sun.max")
                        .foregroundColor(.yellow)
                }
            } else if
                staticPlantList.sunlight == 2 {
                HStack {
                Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                Image(systemName: "sun.max")
                        .foregroundColor(.yellow)
                Image(systemName: "sun.max")
                        .foregroundColor(.yellow)
                Image(systemName: "sun.max")
                        .foregroundColor(.yellow)
                }
            }
            else if
                staticPlantList.sunlight == 3 {
                HStack {
                Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                Image(systemName: "sun.max")
                        .foregroundColor(.yellow)
                Image(systemName: "sun.max")
                        .foregroundColor(.yellow)
                }
            }
            else if
                staticPlantList.sunlight == 4 {
                HStack {
                Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                Image(systemName: "sun.max")
                        .foregroundColor(.yellow)
                }
            }
            else if
                staticPlantList.sunlight == 5 {
                HStack {
                Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                Image(systemName: "sun.max.fill")
                        .foregroundColor(.yellow)
                    }
                }
            }
}

//struct Sunshine_Previews: PreviewProvider {
//    static var previews: some View {
//        Sunshine(staticPlantList: .constant(staticPlantList))
//    }
//    }
