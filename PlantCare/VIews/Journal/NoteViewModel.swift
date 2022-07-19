//
//  NoteViewModel.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/18/22.
//

import Foundation

class NoteViewModel: ObservableObject {
    @Published var notes: [Note] = []
    
    func createNote(_ note: Note) {
        notes.append(note)
        saveToPersistenceStore()
    }
    
    func update(_ note: Note, _ noteText: String) {
        guard let index = notes.firstIndex(of: note) else { return
        }
        notes[index].noteText = noteText
        saveToPersistenceStore()
    }
    
    func removeNote(indexSet: IndexSet) {
        notes.remove(atOffsets: indexSet)
        saveToPersistenceStore()
    }
    
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("notes")
        return fileURL
    }

    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(notes)
            try data.write(to:createPersistenceStore())
            
        } catch {
            print("Error encoding.")
        }
        
    }
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            notes = try JSONDecoder().decode([Note].self, from: data)
        }
        catch {
            print("Error decoding notes \(error.localizedDescription)")
        }
    }
}
