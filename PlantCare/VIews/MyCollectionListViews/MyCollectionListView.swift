//
//  MyCollectionListViewView.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/11/22.
//

import SwiftUI

struct MyCollectionListView: View {
    
    @EnvironmentObject var viewModel: MyCollectionViewModel
    
    @State var navigateTo: AnyView?
    @State var currentCollection: [Plant] = []
    @State var isNavigationActive = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("bg").edgesIgnoringSafeArea(.all)
                ScrollView {
                    List {
                        ForEach (currentCollection) { collection in
                            NavigationLink {
                                MyCollectionDetailView(plantCollection: collection)
                                } label: {
                                MyCollectionRowView(collectionItem: collection)
                            }
                        } .onDelete(perform: viewModel.removeCollectionItem(indexSet:))
                    }.onAppear(perform: setupViews)
                    .frame(height: CGFloat(viewModel.plantCollection.count) * 115 + 25)
                    .listStyle(.plain)
                    .onReceive(viewModel.$plantCollection) { plants in
                        self.currentCollection = plants
                    }
            }
                .navigationTitle("My Plants")
                .navigationBarTitle("Plants", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            MyCollectionDetailView()
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        } .navigationViewStyle(.stack)
        
        
    }
    
    func setupViews() {
        viewModel.loadFromPersistenceStore()
    }
}

struct MyCollectionListView_Previews: PreviewProvider {
    static var previews: some View {
        MyCollectionListView()
            .environmentObject(MyCollectionViewModel())
    }
}

struct MyCollectionRowView: View {
    var collectionItem: Plant
    var body: some View {
        VStack{
        Text(collectionItem.plantName)
                .bold()
                .font(.headline)
            }
        }
    }

struct StaticPlantRowView: View {
    var staticPlantList: Plant
    var body: some View {
        VStack{
            Text(staticPlantList.plantName)
                .bold()
                .font(.headline)
            }
        }
    }
struct EmptyCollectionTile: View {
        var body: some View {
            VStack(spacing: 24) {
                Divider()
                ZStack() {
                    Rectangle().fill(.ultraThinMaterial)
                    Text("Add some plants to your collection")
                        .padding()
                        .font(.system(.caption, design: .monospaced))

                }.cornerRadius(12)
                .frame(width: UIScreen.main.bounds.width - 40)
            }
        }
    }
