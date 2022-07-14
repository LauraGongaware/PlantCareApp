//
//  MyCollectionDetailView.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/13/22.
//

import SwiftUI

struct MyCollectionDetailView: View {
    var collectionItem: MyCollection?
    
    @ObservedObject var mycollectionListViewModel: MyCollectionViewModel
    @State var plantNameText: String = ""
    @State var scientificNameText: String = ""
    @State var descriptionText: String = ""
    
    var body: some View {
        ZStack {
            Color("bg").edgesIgnoringSafeArea(.all)
            VStack {
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

//                DisplayWater(waterDrops: staticplant.water)
                
                TextEditor(text: $descriptionText)
//                Button(action: self.list.append("My Collection") ){
//
//                } label: {
//                    Image(systemName: "leaf.fill")
//                }
                }
                Button {
                    if collectionItem == nil {
                        prepareForCreateCollectionItem(plantName: plantNameText, scientificName: scientificNameText, description: descriptionText, sunlight: sunlight, plantPhoto: plantPhoto)
                    } else {
                        prepareForUpdateCollectionItem()
                    }
                } label: {
                    
                }
            }.padding()
        }
    }
    func prepareForCreateCollectionItem(plantName: String? , scientificName: String?, description: String?, sunlight: String?, plantPhoto: String?) {
        guard let plantName = plantName, !plantName.isEmpty,
        let scientificName = scientificName, !scientificName.isEmpty,
            let description = description, !description.isEmpty,
            let sunlight = sunlight, !description.isEmpty,
            let plantPhoto = plantPhoto, !plantPhoto.isEmpty
        else { return }
       
      
        let collectionItem = MyCollection(plantName: plantName, scientificName: scientificName, description: description, sunlight: sunlight, plantPhoto: plantPhoto)
        
        mycollectionListViewModel.createCollectionItem(collectionItem)
    }
    
    func prepareForUpdateCollectionItem() {
        let plantName = plantNameText
        let scientificName = scientificNameText
        let description = descriptionText
        
        guard !plantName.isEmpty, !scientificName.isEmpty, !description.isEmpty else { return }
        if let collectionItem = collectionItem {
            mycollectionListViewModel.update(<#T##collectionItem: MyCollection##MyCollection#>, <#T##plantName: String##String#>)
        }
        
    }
}

struct MyCollectionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyCollectionDetailView(mycollectionListViewModel: MyCollectionViewModel())
    }
}
