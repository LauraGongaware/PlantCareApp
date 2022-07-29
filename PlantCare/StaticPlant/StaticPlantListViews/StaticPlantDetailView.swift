//
//  StaticPlantDetailView.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/12/22.
//

import SwiftUI

struct StaticPlantDetailView: View {
    
    var staticPlantList: Plant
    @EnvironmentObject var viewModel: MyCollectionViewModel
//    @ObservedObject var viewModel: MyCollectionViewModel
//
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ZStack {
            Color("bg").edgesIgnoringSafeArea(.all)
            ZStack(alignment: .topTrailing) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        FloatingMenu()
                            .padding()
                    }
            VStack {
//                NavigationLink(destination: JournalView()) {
//                  Image(systemName: "note.text")
//                }
                ZStack {
                    
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 300)
                    Image(staticPlantList.staticImage)
                        .resizable()
                        .scaledToFit()
                }
                VStack {
                Text(staticPlantList.plantName)
                    .font(.title)
                Text(staticPlantList.scientificName)
                    .font(.subheadline)
                    .italic()
                    Waterdrop(staticPlantList: staticPlantList)
                    Sunshine(staticPlantList: staticPlantList)
                    Toxicity(staticPlantList: staticPlantList)
                    ScrollView{
                    Text(staticPlantList.description)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .background(.white)
                    .cornerRadius(12)
                    }
                Button {
                    prepareForAddtoCollectionItem(plantName: staticPlantList.plantName, scientificName: staticPlantList.scientificName, water: staticPlantList.water, sunlight: staticPlantList.sunlight, description: staticPlantList.description, toxicity: staticPlantList.toxicity, staticImage: staticPlantList.staticImage)
                    dismiss()

                } label: {
                    ZStack {
                        // very bottom
                        Rectangle().fill(.ultraThinMaterial)
                            .cornerRadius(12)
                        // very top
                        Text("Add to Collection")
                        }
                    }.frame(width: 200, height: 50)
                }.padding()
            }.padding()
        }
    }
    func prepareForAddtoCollectionItem(plantName: String , scientificName: String, water: Int, sunlight: Int, description: String, toxicity: Bool, staticImage: String) {
//        guard let plantName = plantName, !plantName.isEmpty,
//        let scientificName = scientificName, !scientificName.isEmpty,
//        let water = water,
//        let sunlight = sunlight,
//        let toxicity = toxicity,
//        let description = description, !description.isEmpty,
//        let staticImage = staticImage, !staticImage.isEmpty
//
//        else { return }
      
        let addToPlantCollection = Plant(plantName: plantName, scientificName: scientificName, water: water, sunlight: sunlight, description: description, toxicity: toxicity, staticImage: staticImage)
        
        viewModel.createCollectionItem(addToPlantCollection)
        
    }
}

struct StaticPlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StaticPlantDetailView(staticPlantList: (Plant(plantName: "Monstera", scientificName: "Monstera deliciousa", water: 3, sunlight: 4, description: "Monstera plant", toxicity: true, staticImage: "monstera")))
    }
}

