//
//  StaticPlantDetailView.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/12/22.
//

import SwiftUI

struct StaticPlantDetailView: View {
    
    var staticPlantList: Plant
    
    @ObservedObject var collectionViewModel: StaticCollectionViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    
    
    var body: some View {
        
        ZStack {
            Color("bg").edgesIgnoringSafeArea(.all)
            VStack {
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
                
                WaterDroplets(staticPlantList: staticPlantList.water)
                Sunlight(staticPlantList: staticPlantList.sunlight)
                Text(staticPlantList.description)
                    .multilineTextAlignment(.center)
                    .background(.white)
                    .cornerRadius(12)
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
    
    
struct WaterDroplets: View {
    var water: staticPlantList.water
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
    
    struct Sunlight: View {
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
    func prepareForAddtoCollectionItem(plantName: String? , scientificName: String?, water: Int?, sunlight: Int?, description: String?, toxicity: Bool?, staticImage: String?) {
        guard let plantName = plantName, !plantName.isEmpty,
        let scientificName = scientificName, !scientificName.isEmpty,
        let water = water,
        let sunlight = sunlight,
        let description = description, !description.isEmpty,
        let staticImage = staticImage, !staticImage.isEmpty
                
        else { return }
      
        let addToPlantCollection = Plant(plantName: plantName, scientificName: scientificName, water: water, sunlight: sunlight, description: description, toxicity: false, staticImage: staticImage)
        
        collectionViewModel.createCollectionItem(addToPlantCollection)
        
    }
}

//struct StaticPlantDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        StaticPlantDetailView()
//    }
//}
