//
//  MyCollectionListViewView.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/11/22.
//

import SwiftUI

struct MyCollectionListView: View {
    
    @ObservedObject var viewModel = MyCollectionViewModel()
    
    var body: some View {
        NavigationView {
            Color("bg").edgesIgnoringSafeArea(.all)
                ScrollView {
                    List {
                        Section("My Collection") {
                            ForEach (viewModel.collectionItems) { collection in
//                                NavigationLink {
//                                    
//                                }
                            }
                        }
                        
                    }

            
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyCollectionListView()
    }
}
