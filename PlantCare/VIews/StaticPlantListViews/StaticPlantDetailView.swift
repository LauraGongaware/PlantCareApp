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
                    Image("monstera")
                        .resizable()
                        .scaledToFit()
                }
               
                Text(staticplant.plantName)
                    .font(.title)
                Text(staticplant.scientificName)
                    .font(.subheadline)
                    .italic()
                Text(staticplant.description)
            }.padding()
        }
    
    }
}

struct StaticPlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StaticPlantDetailView(staticplant: .constant(StaticPlant(plantName: "Monstera", scientificName: "Monstera deliciosa", water: 3, sunlight: 3, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat no", toxicity: "yes", staticImage: "monstera.png")))
    }
}
