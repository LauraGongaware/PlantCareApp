//
//  MyCollectionViewModel.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/12/22.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class MyCollectionViewModel: ObservableObject {

    @Published var plantCollection: [Plant] = []
//    @Published var selectedPlant: Plant?
    @Published var image: UIImage?
    @State var fileURL: URL?
//
//    private var imageSubscription: AnyCancellable?
//
//    private var saveFileURL: URL? {
//        try? FileManager.default.url(
//            for: .documentDirectory,
//               in: .userDomainMask,
//               appropriateFor: nil,
//               create: true
//        )
//            .appendingPathExtension("jpeg")
//    }
//    func loadImage() {
//        if let saveFileURL = saveFileURL,
//           let data = try? Data(contentsOf: saveFileURL),
//           let image = UIImage(data: data) {
//            self.image = image
//        }
//    }
//
//    func SaveImage() {
//        imageSubscription = $image.sink(receiveValue: { [weak self] image in
//            if let saveFileURL = self?.saveFileURL,
//               let data = self?.image?.jpegData(compressionQuality: 0.8) {
//                try? data.write(to: saveFileURL)
//            }
//        })
//    }
    
    enum PresentedView: String, Identifiable {
        case camera
        case photoPicker
        var id: String {
            rawValue
        }
    }
    
    func createCollectionItem(_ userPlant: Plant) {
        plantCollection.append(userPlant)
        saveToPersistenceStore()
    }

    func update(_ userPlant: Plant, _ plantName: String, _ scientificName: String, _ water: Int, _ sunlight: Int, _ description: String, _ toxicity: Bool, _ staticImage: String, _ date: Date) {
        guard let index = plantCollection.firstIndex(of: userPlant) else { return }
        plantCollection.remove(at: index)
        
        let plant = Plant(plantName: plantName, scientificName: scientificName, water: water, sunlight: sunlight, description: description, toxicity: toxicity, staticImage: staticImage)
        plantCollection.insert(plant, at: index)
        saveToPersistenceStore()
    }
    func removeCollectionItem(indexSet: IndexSet) {
        plantCollection.remove(atOffsets: indexSet)
        saveToPersistenceStore()
    }
    
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("collectionItems.json")
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
            let decoded = try JSONDecoder().decode([Plant].self, from: data)
            print(decoded)
            plantCollection = decoded
        }
        catch {
            print("Error decoding")
        }
    }
}
    
    
//    func createPhotoPersistenceStore() -> URL {
//        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let fileURL = url[0].appendingPathComponent("images.json")
//        return fileURL
//    }
//
//    func saveToPhoto() {
//        do {
//            let furl = try FileManager.default
//                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//                .appendingPathComponent("imageFile")
//                .appendingPathExtension("png")
//            fileURL = furl
//            try image?.pngData()?.write(to: furl)
//        } catch {
//            print("could not create imageFile")
//        }
////        do {
////            let data = try image?.pngData()
////            try data?.write(to: createPhotoPersistenceStore())
////
////        } catch {
////            print("Error encoding.")
////        }
//
//    }
//    
//    func loadPhoto() -> UIImage {
//        do{
//            if let furl = fileURL {
//                let data = try Data(contentsOf: furl)
//                if let image = UIImage(data: data) {
//                    return image
//                }
//            }
//        } catch {
//            print("error: \(error)")
//        }
//        return UIImage()
//        do {
//            let data = try Data(contentsOf: createPhotoPersistenceStore())
//            let decoded = try JSONDecoder().decode([Plant].self, from: data)
//            print(decoded)
//            plantCollection = decoded
//        }
//        catch {
//            print("Error decoding")
//        }
//    }
//}

//    func loadImage() {
//        if let saveFileURL = saveFileURL,
//           let data = try? Data(contentsOf: saveFileURL),
//           let image = UIImage(data: data) {
//            self.image = image
//        }
//    }
