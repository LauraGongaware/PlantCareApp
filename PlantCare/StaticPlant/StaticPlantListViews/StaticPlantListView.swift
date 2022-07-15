//
//  StaticPlantListSwift.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/12/22.
//

import SwiftUI

struct StaticPlantListView: View {
    
    @State var viewModel = StaticPlantDataStore()
    
    var body: some View {

        NavigationView {
            ZStack {
                Color("bg").edgesIgnoringSafeArea(.all)
                    List{
                        ForEach(StaticPlantDataStore.staticplants) { staticplant in
                            NavigationLink {
                                StaticPlantDetailView(staticplant: .constant(staticplant))
                            } label : {
                                    Text(staticplant.plantName)
                                .navigationTitle(Text("Plants"))
                            }
                        }
                    }.cornerRadius(12)
                    .padding()
            }
        }
    }
}

struct StaticPlantListSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        StaticPlantListView()
    }
}
