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
    @State var isNaviationActive = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("bg").edgesIgnoringSafeArea(.all)

                ScrollView {
//                    if viewModel.plantCollection.isEmpty {
//                        EmptyCollectionTile()
//                            .padding(.top)
//                        } else {

                    List {
                            ForEach (viewModel.plantCollection) { collection in
                                NavigationLink {
                                    MyCollectionDetailView(plantCollection: collection)
                                                           
//    journalViewModel: JournalViewModel(), addedDateViewModel: AddedDateViewModel())
                                } label: {
                                    MyCollectionRowView(collectionItem: collection)
                                }
                            } .onDelete(perform: viewModel.removeCollectionItem(indexSet:))
                    }
                    .frame(height: CGFloat(viewModel.plantCollection.count) * 115 + 25)
                    .listStyle(.plain)
//                }
            }
                .navigationTitle("My Plants")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            MyCollectionDetailView()
                                                   
//                                                   journalViewModel: JournalViewModel(), addedDateViewModel: AddedDateViewModel())
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
                .onAppear {
                    setupViews()
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
