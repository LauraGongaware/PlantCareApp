//
//  JournalViewModel.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/18/22.
//

import Foundation
import SwiftUI

class JournalViewModel: ObservableObject {
    
    @Published var journals: [Journal] = []
    
    func createJournal(_ journal: Journal) {
        journals.append(journal)
        saveToPersistenceStore()
    }
    
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("journals")
        return fileURL
    }

    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(journals)
            try data.write(to:createPersistenceStore())
            
        } catch {
            print("Error encoding.")
        }
        
    }
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            journals = try JSONDecoder().decode([Journal].self, from: data)
        }
        catch {
            print("Error decoding journals \(error.localizedDescription)")
        }
    }
}
