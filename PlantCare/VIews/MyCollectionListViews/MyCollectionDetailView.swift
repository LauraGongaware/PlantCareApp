//
//  MyCollectionDetailView.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/13/22.
//

import SwiftUI
import UIKit

struct MyCollectionDetailView: View {
    var collectionItem: MyCollection?
    
    @ObservedObject var collectionViewModel: MyCollectionViewModel
    @ObservedObject var addedDateViewModel : AddedDateViewModel
    
    @State var plantNameText: String = ""
    @State var scientificNameText: String = ""
    @State var waterText: String = ""
    @State var sunlightText: String = ""
    @State var descriptionText: String = ""
   
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
                    
                    Image("monstera")
                        .resizable()
                        .scaledToFit()
                }
                VStack(alignment: .center) {
                    TextField("Plant Name", text: $plantNameText)
                    TextField("Scientific Name", text: $scientificNameText)
                    TextField("Water", text: $waterText)
                    TextField("Sunlight", text: $sunlightText)
                    TextEditor(text: $descriptionText)
                }
                HStack {
                    Button {
                        if collectionItem == nil {
                            prepareForCreateCollectionItem(plantName: plantNameText, scientificName: scientificNameText, water: waterText, sunlight: sunlightText, description: descriptionText)
                            addedDateViewModel.createAddedDate(addedDate: AddedDate())
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
                            Text(collectionItem == nil ? "Save" : "Update")
                        }
                }.frame(width: 250, height: 55)
            
                }
            }.padding()
            
            }
            .onAppear {
                if let collectionItem = collectionItem {
                    plantNameText = collectionItem.plantName
                    scientificNameText = collectionItem.scientificName
                    waterText = collectionItem.water
                    sunlightText = collectionItem.sunlight
                    descriptionText = collectionItem.description
        }
    }
        
}
    func prepareForCreateCollectionItem(plantName: String? , scientificName: String?, water: String?, sunlight: String?, description: String?) {
        guard let plantName = plantName, !plantName.isEmpty,
        let scientificName = scientificName, !scientificName.isEmpty,
        let water = water, !water.isEmpty,
        let sunlight = sunlight, !sunlight.isEmpty,
        let description = description, !description.isEmpty
        else { return }
      
        let collectionItem = MyCollection(plantName: plantName, scientificName: scientificName, water: water, sunlight: sunlight, description: description)
        
        collectionViewModel.createCollectionItem(collectionItem)
        
    }
    
    func prepareForUpdateCollectionItem() {
        let plantName = plantNameText
        let scientificName = scientificNameText
        let water = waterText
        let sunlight = sunlightText
        let description = descriptionText
        
        
        guard !plantName.isEmpty, !scientificName.isEmpty, !water.isEmpty, !sunlight.isEmpty, !description.isEmpty else { return }
        if let collectionItem = collectionItem {
            collectionViewModel.update(collectionItem, plantName, scientificName, water, sunlight, description)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    }
}

struct MyCollectionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyCollectionDetailView(collectionViewModel: MyCollectionViewModel(), addedDateViewModel: AddedDateViewModel())
        }
    }
}
