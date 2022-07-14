//
//  MyCollectionViewModel.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/12/22.
//

import Foundation

class MyCollectionViewModel: ObservableObject {
//    @Published var userPlants: [UserPlant] = []
//    @Published var addToCollection: Bool = false
//
//
    @Published var collectionItems: [MyCollection] = []
    
    func createCollectionItem(_ collectionItem: MyCollection) {
        collectionItems.append(collectionItem)
        saveToPersistenceStore()
    }

    func update(_ collectionItem: MyCollection, _ plantName: String) {
        guard let index = collectionItems.firstIndex(of: collectionItem) else { return }
        collectionItems[index].plantName = plantName
        
        saveToPersistenceStore()
    }
    
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("collectionItems")
        return fileURL
    }

    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(collectionItems)
            try data.write(to:createPersistenceStore())
            
        } catch {
            print("Error encoding.")
        }
        
    }
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            collectionItems = try JSONDecoder().decode([MyCollection].self, from: data)
        }
        catch {
            print("Error decoding")
        }
    }
}
