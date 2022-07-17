//
//  StaticPlantListSwift.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/12/22.
//

import SwiftUI

struct StaticPlantListView: View {
    
   @ObservedObject var viewModel = StaticCollectionViewModel()
    
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color("bg").edgesIgnoringSafeArea(.all)
                    List{
                        ForEach(viewModel.staticPlants) { staticPlant in
                            NavigationLink {
                                StaticPlantDetailView(staticPlantList: staticPlant, collectionViewModel: viewModel)
                            } label : {
                                    Text(staticPlant.plantName)
                                .navigationTitle(Text("Plants"))
                            }
                        }
                    }.cornerRadius(12)
                    .padding()
                   
        
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct StaticPlantListSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        StaticPlantListView()
    }
}
