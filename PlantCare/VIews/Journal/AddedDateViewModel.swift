//
//  AddedDateViewModel.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/18/22.
//

import Foundation

class AddedDateViewModel: ObservableObject {
    
    @Published var addedDates: [AddedDate] = []
    
    func createAddedDate(addedDate: AddedDate) {
        addedDates.append(addedDate)
        saveToPersistenceStore()
    }
    
    func removeAddedDate(indexSet: IndexSet) {
        addedDates.remove(atOffsets: indexSet)
        saveToPersistenceStore()
    }
// CRUD
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("addedDates")
        return fileURL
    }

    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(addedDates)
            try data.write(to:createPersistenceStore())
            
        } catch {
            print("Error encoding.")
        }
        
    }
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            addedDates = try JSONDecoder().decode([AddedDate].self, from: data)
        }
        catch {
            print("Error decoding dates \(error.localizedDescription)")
        }
    }
    
}
