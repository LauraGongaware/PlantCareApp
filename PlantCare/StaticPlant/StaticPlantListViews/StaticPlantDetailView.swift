//
//  StaticPlantDetailView.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/12/22.
//

import SwiftUI

struct StaticPlantDetailView: View {
    
    @Binding var staticplant : StaticPlant
    
    
    var body: some View {
        
        ZStack {
            Color("bg").edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 300)
                    Image(staticplant.staticImage)
                        .resizable()
                        .scaledToFit()
                }
               
                Text(staticplant.plantName)
                    .font(.title)
                Text(staticplant.scientificName)
                    .font(.subheadline)
                    .italic()
                WaterDroplets(staticplant: staticplant)
                Sunlight(staticplant: staticplant)
                Text(staticplant.description)
                    .multilineTextAlignment(.center)
                    .background(.white)
                    .cornerRadius(12)
//                Button(action: self.list.append("My Collection") ){
//                    
//                } label: {
//                    Image(systemName: "leaf.fill")
//                }
            
            }.padding()
        }
    
    }
    struct WaterDroplets: View {
    var staticplant : StaticPlant
    var body: some View {
        if staticplant.water == 1 {
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
            staticplant.water == 2 {
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
            staticplant.water == 3 {
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
            staticplant.water == 4 {
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
            staticplant.water == 5 {
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
    
    struct Sunlight: View {
    var staticplant : StaticPlant
    var body: some View {
        if staticplant.sunlight == 1 {
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
            staticplant.sunlight == 2 {
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
            staticplant.sunlight == 3 {
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
            staticplant.sunlight == 4 {
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
            staticplant.sunlight == 5 {
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
}

struct StaticPlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StaticPlantDetailView(staticplant: .constant(StaticPlant(plantName: "Monstera", scientificName: "Monstera deliciosa", water: 3, sunlight: 3, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat no", toxicity: "yes", staticImage: "monstera")))
    }
}
