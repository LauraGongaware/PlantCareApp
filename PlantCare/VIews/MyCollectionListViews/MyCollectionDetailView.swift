//
//  MyCollectionDetailView.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/13/22.
//

import SwiftUI
import UIKit

struct MyCollectionDetailView: View {
    var plantCollection: Plant?
    
    @EnvironmentObject var collectionViewModel: MyCollectionViewModel
    
    @State var plantNameText: String = ""
    @State var scientificNameText: String = ""
    @State private var water = 0
    @State private var sunlight = 0
    @State private var staticImage: String = ""
    @State var toxicity: Bool = false
    @State var descriptionText: String = ""
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color("bg").edgesIgnoringSafeArea(.all)
            ZStack(alignment: .topTrailing) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        FloatingMenu()
                            .padding()
                    }
            VStack {
                NavigationLink(destination: JournalView()) {
                  Image(systemName: "note.text")
                        .foregroundColor(.black)
                }
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 300)
                    
                    Image(staticImage)
                        .resizable()
                        .scaledToFit()
                    
                    Image(uiImage: self.image)
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .edgesIgnoringSafeArea(.all)
                        .clipShape(Circle())
                        
                    Button(action: {
                        self.isShowPhotoLibrary = true
                    }) { Image(systemName: "photo")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    }
                }
                VStack(alignment: .center) {
                    TextField("Plant Name", text: $plantNameText)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    TextField("Scientific Name", text: $scientificNameText)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        Text("Water :")
                        Picker("Sunlight Needs", selection: $sunlight, content: {
                        Text("\(1)").tag(1)
                       Text("\(2)").tag(2)
                       Text("\(3)").tag(3)
                       Text("\(4)").tag(4)
                       Text("\(5)").tag(5)})
                    }
                    
                    HStack {
                        Text("Sunlight requirements:")
                    Picker("Water Needs", selection: $water, content: {
                            Text("\(1)").tag(0)
                           Text("\(2)").tag(1)
                           Text("\(3)").tag(2)
                           Text("\(4)").tag(3)
                           Text("\(5)").tag(4)})
                        }
//                    WaterdropDetail(plantCollection: $water)
                                                
                    Toggle(isOn: $toxicity, label: {
                        Text("Toxicity -")
                    }).toggleStyle(SafeForPets())
                    
                    TextEditor(text: $descriptionText)
                }
                
                HStack {
                    Button {
                        if plantCollection == nil {
                            prepareForCreateCollectionItem(plantName: plantNameText, scientificName: scientificNameText, water: water, sunlight: sunlight, description: descriptionText, staticImage: staticImage, toxicity: toxicity)
                            
                            
//                            journalViewModel.createJournal( Journal())
//                            addedDateViewModel.createAddedDate(addedDate: AddedDate())
                        } else {
                            prepareForUpdateCollectionItem()
                        }
                        dismiss()
                        
                    } label: {
                        ZStack {
                            // very bottom
                            Rectangle().fill(.ultraThinMaterial)
                                .cornerRadius(12)
                            // very top
                            Text(plantCollection == nil ? "Save" : "Update")
                        }
                    }.frame(width: 250, height: 55)
                    
                }
            }.padding()
                .sheet(isPresented: $isShowPhotoLibrary) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                    //change from files to camera
//                    ImagePicker(sourceType: .camera, selectedImage: self.$image)
                }
            
        }
            .onAppear {
                if let plantCollection = plantCollection {
                    plantNameText = plantCollection.plantName
                    scientificNameText = plantCollection.scientificName
                    water = plantCollection.water
                    sunlight = plantCollection.sunlight
                    toxicity = plantCollection.toxicity
                    staticImage = plantCollection.staticImage
                    descriptionText = plantCollection.description
                    
        }
    }
        
}
    func prepareForCreateCollectionItem(plantName: String? , scientificName: String?, water: Int?, sunlight: Int?, description: String?, staticImage: String?, toxicity: Bool?) {
        guard let plantName = plantName, !plantName.isEmpty,
        let scientificName = scientificName, !scientificName.isEmpty,
        let water = water,
        let sunlight = sunlight,
        let description = description, !description.isEmpty,
        let staticImage = staticImage,
        let toxicity = toxicity
        else { return }
      
        let collectionItem = Plant(plantName: plantName, scientificName: scientificName, water: water, sunlight: sunlight, description: description, toxicity: toxicity, staticImage: staticImage)
        
        collectionViewModel.createCollectionItem(collectionItem)
//        journalViewModel.createJournal(Journal())
//        addedDateViewModel.createAddedDate(addedDate: AddedDate())
        
    }
    
    func prepareForUpdateCollectionItem() {
        let plantName = plantNameText
        let scientificName = scientificNameText
        let water = water
        let sunlight = sunlight
        let description = descriptionText
        let staticImage = staticImage
        let toxicity = toxicity
        guard !plantName.isEmpty, !description.isEmpty else { return }
        if let plantCollection = plantCollection {
            collectionViewModel.update(plantCollection, plantName, scientificName, water, sunlight, description, toxicity, staticImage)
        }
    }
    
}

struct MyCollectionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyCollectionDetailView()
                                   
//                                   ,journalViewModel: JournalViewModel(), addedDateViewModel: AddedDateViewModel())
        }
    }
}

struct SafeForPets: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Text(configuration.isOn ? "plant is safe for pets" : "plant is not safe for pets")
            Image(systemName: "pawprint.circle")
                .foregroundColor(configuration.isOn ? .green : .red)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

//struct WaterdropDetail: View {
//    var body: some View {
//        if $water == 1 {
//                    HStack {
//                        Image(systemName: "drop.fill")
//                            .foregroundColor(.cyan)
//                        Image(systemName: "drop")
//                            .foregroundColor(.cyan)
//                        Image(systemName: "drop")
//                            .foregroundColor(.cyan)
//                        Image(systemName: "drop")
//                            .foregroundColor(.cyan)
//                        Image(systemName: "drop")
//                            .foregroundColor(.cyan)
//                    }
//                } else if
//                    plantCollection.water == 2 {
//                    HStack {
//                    Image(systemName: "drop.fill")
//                            .foregroundColor(.cyan)
//                    Image(systemName: "drop.fill")
//                            .foregroundColor(.cyan)
//                    Image(systemName: "drop")
//                            .foregroundColor(.cyan)
//                    Image(systemName: "drop")
//                            .foregroundColor(.cyan)
//                    Image(systemName: "drop")
//                            .foregroundColor(.cyan)
//                    }
//                }
//                else if
//                    plantCollection.water == 3 {
//                    HStack {
//                    Image(systemName: "drop.fill")
//                            .foregroundColor(.cyan)
//                    Image(systemName: "drop.fill")
//                            .foregroundColor(.cyan)
//                    Image(systemName: "drop.fill")
//                            .foregroundColor(.cyan)
//                    Image(systemName: "drop")
//                            .foregroundColor(.cyan)
//                    Image(systemName: "drop")
//                            .foregroundColor(.cyan)
//                    }
//                }
//                else if
//                    plantCollection.water == 4 {
//                    HStack {
//                    Image(systemName: "drop.fill")
//                            .foregroundColor(.cyan)
//                    Image(systemName: "drop.fill")
//                            .foregroundColor(.cyan)
//                    Image(systemName: "drop.fill")
//                            .foregroundColor(.cyan)
//                    Image(systemName: "drop.fill")
//                            .foregroundColor(.cyan)
//                    Image(systemName: "drop")
//                            .foregroundColor(.cyan)
//                    }
//                }
//                else if
//                    plantCollection.water == 5 {
//                    HStack {
//                    Image(systemName: "drop.fill")
//                            .foregroundColor(.cyan)
//                    Image(systemName: "drop.fill")
//                            .foregroundColor(.cyan)
//                    Image(systemName: "drop.fill")
//                            .foregroundColor(.cyan)
//                    Image(systemName: "drop.fill")
//                            .foregroundColor(.cyan)
//                    Image(systemName: "drop.fill")
//                            .foregroundColor(.cyan)
//                        }
//                    }
//                }
//            }
