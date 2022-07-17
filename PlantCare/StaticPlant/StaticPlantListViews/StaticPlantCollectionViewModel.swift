//
//  StaticPlantCollectionViewModel.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/16/22.
//

import Foundation

class StaticCollectionViewModel: ObservableObject {
    
    @Published var plantCollection: [Plant] = []
    @Published var staticPlants: [Plant] = Plant.staticPlantList
    
    
    func createCollectionItem(_ collectionItem: Plant) {
        plantCollection.append(collectionItem)
        saveToPersistenceStore()
    }

    func update(_ collectionItem: Plant, _ plantName: String, _ scientificName: String, _ water: Int, _ sunlight: Int, _ description: String) {
        guard let index = plantCollection.firstIndex(of: collectionItem) else { return }
        plantCollection[index].plantName = plantName
        saveToPersistenceStore()
    }
    func removeCollectionItem(indexSet: IndexSet) {
        plantCollection.remove(atOffsets: indexSet)
        saveToPersistenceStore()
    }
    
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("plantCollection.json")
        return fileURL
    }

    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(plantCollection)
            try data.write(to: createPersistenceStore())
            
        } catch {
            print("Error encoding.")
        }
        
    }
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            plantCollection = try JSONDecoder().decode([Plant].self, from: data)
        }
        catch {
            print("Error decoding")
        }
    }
}
