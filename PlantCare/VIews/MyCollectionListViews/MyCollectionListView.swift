//
//  MyCollectionListViewView.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/11/22.
//

import SwiftUI

struct MyCollectionListView: View {
    
    @ObservedObject var viewModel = MyCollectionViewModel()
    
    @State var navigateTo: AnyView?
    @State var isNaviationActive = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("bg").edgesIgnoringSafeArea(.all)

                ScrollView {

                    //Empty View for no entries
                    if viewModel.collectionItems.isEmpty {
                        EmptyCollectionTile()
                            .padding(.top)
                        } else {

                    List {
                        Section("Plant Collection") {
                            ForEach (viewModel.collectionItems) { collection in
                                NavigationLink {
                                    MyCollectionDetailView(collectionItem: collection, collectionViewModel:viewModel)
                                } label: {
                                    MyCollectionRowView(collectionItem: collection)
                                }
                            } .onDelete(perform: viewModel.removeCollectionItem(indexSet:))
                        }
                    }
                    .frame(height: CGFloat(viewModel.collectionItems.count) * 115 + 25)
                    .listStyle(.plain)
                }
            }
                .navigationTitle("My Plants")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            MyCollectionDetailView(collectionViewModel: viewModel)
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
    var collectionItem: MyCollection
    var body: some View {
        VStack{
        Text(collectionItem.plantName)
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

//-----------------

//struct MyCollectionListView: View {
//
////    @ObservedObject var viewModel = MyCollectionViewModel()
//    @ObservedObject var viewModel = StaticCollectionViewModel()
//
//
////    @State var navigateTo: AnyView?
////    @State var isNaviationActive = false
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                Color("bg").edgesIgnoringSafeArea(.all)
//
//                ScrollView {
//
//                    //Empty View for no entries
//                    if viewModel.plantCollection.isEmpty {
//                        EmptyCollectionTile()
//                            .padding(.top)
//                        } else {
//
//                    List {
//                        Section("Plant Collection") {
//                            ForEach (viewModel.plantCollection) { collection in
//                                NavigationLink {
//                                    MyCollectionDetailView(plantCollection: collection, collectionViewModel:viewModel)
//                                } label: {
//                                    MyCollectionRowView(collectionItem: collection)
//                                }
//                            } .onDelete(perform: viewModel.removeCollectionItem(indexSet:))
//                        }
//                    }
//                    .frame(height: CGFloat(viewModel.plantCollection.count) * 115 + 25)
//                    .listStyle(.plain)
//                }
//            }
//                .navigationTitle("My Plants")
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        NavigationLink {
//                            MyCollectionDetailView(collectionViewModel: viewModel)
//                        } label: {
//                            Image(systemName: "plus")
//                                .foregroundColor(.black)
//                        }
//                    }
//                }
//                .onAppear {
//                    setupViews()
//            }
//
//        }
//        } .navigationViewStyle(.stack)
//    }
//
//    func setupViews() {
//        viewModel.loadFromPersistenceStore()
//    }
//}
//
//struct MyCollectionListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyCollectionListView()
//    }
//}
//
//struct MyCollectionRowView: View {
//    var collectionItem: MyCollection
//    var body: some View {
//        VStack{
//        Text(collectionItem.plantName)
//                .bold()
//                .font(.headline)
//            }
//        }
//    }
//struct EmptyCollectionTile: View {
//        var body: some View {
//            VStack(spacing: 24) {
//                Divider()
//                ZStack() {
//                    Rectangle().fill(.ultraThinMaterial)
//                    Text("Add some plants to your collection")
//                        .padding()
//                        .font(.system(.caption, design: .monospaced))
//
//                }.cornerRadius(12)
//                .frame(width: UIScreen.main.bounds.width - 40)
//            }
//        }
//    }
//}
