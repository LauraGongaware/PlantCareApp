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
//    @State private var image = UIImage?
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
//                NavigationLink(destination: JournalView()) {
//                  Image(systemName: "note.text")
//                        .foregroundColor(.black)
//                }
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 300)
                    
                    if let image = collectionViewModel.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .edgesIgnoringSafeArea(.all)
                            .clipShape(Circle())
                    } else {
                        Image(staticImage)
                        .resizable()
                        .scaledToFit()
                    }
                        
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
                        .font(Font.system(size: 20).bold())
                        .foregroundColor(.black)
                    TextField("Scientific Name", text: $scientificNameText)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .font(Font.system(size: 15).italic())
                        .foregroundColor(.black)
                    
                    HStack {
                        Text("Sunlight Requirements :")
                        Picker("Water Needs", selection: $sunlight, content: {
                            Text("\(1)").tag(1)
                       Text("\(2)").tag(2)
                       Text("\(3)").tag(3)
                       Text("\(4)").tag(4)
                       Text("\(5)").tag(5)})
                    }
                    
                    HStack {
                        Text("Water requirements :")
                    Picker("Sun Needs", selection: $water, content: {
                            Text("\(1)").tag(1)
                           Text("\(2)").tag(2)
                           Text("\(3)").tag(3)
                           Text("\(4)").tag(4)
                           Text("\(5)").tag(5)})
                        }
                                                
                    Toggle(isOn: $toxicity, label: {
                        Text("Toxicity -")
                    }).toggleStyle(SafeForPets())
                    
                    TextEditor(text: $descriptionText)
                        .padding()
            }
                HStack {
                    Button {
                        if plantCollection == nil {
                            prepareForCreateCollectionItem(plantName: plantNameText, scientificName: scientificNameText, water: water, sunlight: sunlight, description: descriptionText, staticImage: staticImage, toxicity: toxicity)
//                            collectionViewModel.SaveImage()
                        
                        } else {
                            prepareForUpdateCollectionItem()
                        }
                        dismiss()
                        
                    } label: {
                        ZStack {
                            Rectangle().fill(.ultraThinMaterial)
                                .cornerRadius(12)
                            Text(plantCollection == nil ? "Save" : "Update")
                        }
                    }.frame(width: 250, height: 55)
                }
            }
            .padding()
            .cornerRadius(15)
                .sheet(isPresented: $isShowPhotoLibrary) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $collectionViewModel.image)
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
        .onDisappear {
            collectionViewModel.loadFromPersistenceStore()
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
                                
        }
    }
}

struct SafeForPets: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Text(configuration.isOn ? "plant is not safe for pets" : "plant is safe for pets")
            Image(systemName: "pawprint.circle")
                .foregroundColor(configuration.isOn ? .red : .green)
                .onTapGesture {
                    configuration.isOn.toggle()
            }
        }
    }
}

//func createPersistenceStore() -> URL {
//    let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//    let fileURL = url[0].appendingPathComponent("images.json")
//    return fileURL
//}
//
//func saveToPersistenceStore() {
//    do {
//        let data = try JSONEncoder().encode(image)
//        try data.write(to: createPersistenceStore())
//
//    } catch {
//        print("Error encoding.")
//    }
//
//}
//func loadFromPersistenceStore() {
//    do {
//        let data = try Data(contentsOf: createPersistenceStore())
//        let decoded = try JSONDecoder().decode([Plant].self, from: data)
//        print(decoded)
//        plantCollection = decoded
//    }
//    catch {
//        print("Error decoding")
//    }
//}
