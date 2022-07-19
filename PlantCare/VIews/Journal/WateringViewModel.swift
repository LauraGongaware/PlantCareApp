//
//  JournalViewModel.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/18/22.
//

import Foundation

class WateringViewModel: ObservableObject {
    
    @Published var waterings: [Watering] = [] {
        didSet {
            objectWillChange.send()
        }
    }
    
    func createWatering(watering: Watering, journal: Journal, date: Date, journalViewModel: JournalViewModel) {
        guard let index = journalViewModel.journals.firstIndex(of: journal) else { return }
        journalViewModel.journals[index].waterings.append(watering)
        saveToPersistenceStore()
    }
    
    func removeWatering(journal: Journal, journalViewModel: JournalViewModel, at indexSet: IndexSet) {
        guard let index = journalViewModel.journals.firstIndex(of: journal) else { return }
        journalViewModel.journals[index].waterings.remove(atOffsets: indexSet)
        saveToPersistenceStore()
    }
//Watering CRUD
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("waterings")
        return fileURL
    }

    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(waterings)
            try data.write(to:createPersistenceStore())
            
        } catch {
            print("Error encoding.")
        }
        
    }
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            waterings = try JSONDecoder().decode([Watering].self, from: data)
        }
        catch {
            print("Error decoding waterings \(error.localizedDescription)")
        }
    }
    
    //file ending
}

