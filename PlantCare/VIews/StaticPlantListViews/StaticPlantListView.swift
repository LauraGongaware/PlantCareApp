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
            Color("bg").edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    List{
                        ForEach(StaticPlantDataStore.staticplants) { staticplant in
                            NavigationLink {
                                StaticPlantDetailView(staticplant: .constant(staticplant))
                            } label : {
                                HStack {
                                    Text(staticplant.plantName)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct StaticPlantListSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        StaticPlantListView()
    }
}
