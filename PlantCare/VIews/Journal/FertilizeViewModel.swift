//
//  FertilizeViewModel.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/18/22.
//

import Foundation

class FertilzeViewModel: ObservableObject {
    
    @Published var fertilizings: [Fertilize] = []
    
    func createFertilizing(fertilizing: Fertilize) {
        fertilizings.append(fertilizing)
        saveToPersistenceStore()
    }
    
    func removeFertilizing(indexSet: IndexSet) {
        fertilizings.remove(atOffsets: indexSet)
        saveToPersistenceStore()
    }
// CRUD
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("fertilizings")
        return fileURL
    }

    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(fertilizings)
            try data.write(to:createPersistenceStore())
            
        } catch {
            print("Error encoding.")
        }
        
    }
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            fertilizings = try JSONDecoder().decode([Fertilize].self, from: data)
        }
        catch {
            print("Error decoding fertilize \(error.localizedDescription)")
        }
    }
}
