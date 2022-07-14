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
//                DisplayWater(waterDrops: staticplant.water)
                
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
    
    private func DisplayWater(waterDrops: Int) -> [Image] {
        switch waterDrops {
        case waterDrops where staticplant.water == 1: return         [Image(systemName: "drop.fill"),
            Image(systemName: "drop"),
            Image(systemName: "drop"),
            Image(systemName: "drop"),
            Image(systemName: "drop")]
        case waterDrops where staticplant.water == 2: return
            [Image(systemName: "drop.fill"),
            Image(systemName: "drop.fill"),
            Image(systemName: "drop"),
            Image(systemName: "drop"),
            Image(systemName: "drop")]
        case waterDrops where staticplant.water == 3: return
            [Image(systemName: "drop.fill"),
            Image(systemName: "drop.fill"),
            Image(systemName: "drop.fill"),
            Image(systemName: "drop"),
            Image(systemName: "drop")]
        case waterDrops where staticplant.water == 4: return
            [Image(systemName: "drop.fill"),
            Image(systemName: "drop.fill"),
            Image(systemName: "drop.fill"),
            Image(systemName: "drop.fill"),
            Image(systemName: "drop")]
            
        case waterDrops where staticplant.water == 5: return
           [Image(systemName: "drop.fill"),
            Image(systemName: "drop.fill"),
            Image(systemName: "drop.fill"),
            Image(systemName: "drop.fill"),
            Image(systemName: "drop.fill")]
             
             default: return [Image(systemName: "drop"),
                     Image(systemName: "drop"),
                     Image(systemName: "drop"),
                     Image(systemName: "drop"),
                     Image(systemName: "drop")]
             }
         }
     }
            
//        case waterDrops where staticplant.water == 2: return Image(systemName: "drop.fill, drop.fill, drop, drop, drop")
//        case waterDrops where staticplant.water == 3: return Image(systemName: "drop.fill, drop.fill, drop.fill, drop, drop")
//        case waterDrops where staticplant.water == 4: return Image(systemName: "drop.fill, drop.fill, drop.fill, drop.fill, drop")
//        case waterDrops where staticplant.water == 5: return Image(systemName: "drop.fill, drop.fill, drop.fill, drop.fill, drop.fill")


struct StaticPlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StaticPlantDetailView(staticplant: .constant(StaticPlant(plantName: "Monstera", scientificName: "Monstera deliciosa", water: 3, sunlight: 3, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat no", toxicity: "yes", staticImage: "monstera")))
    }
}
