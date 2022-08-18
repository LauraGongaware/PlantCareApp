//
//  ImageStorage.swift
//  PlantCare
//
//  Created by Laura Gongaware on 7/29/22.
//

import Foundation
import UIKit

class ImageStorage {
    
    static let shared = ImageStorage()
    private init() {}

    func saveImageToDocumentDirectory(image: UIImage, imageName: String) {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent(imageName)
        if let data = image.jpegData(compressionQuality: 0.2)
        {
        do {
            try data.write(to: fileURL)
            print("File saved")
        } catch {
            print("Error saving file \(error)")
            }
        }
    }
    
    func loadImageFromDocumentDirectory(nameOfImage: String) -> UIImage? {
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        if let dirPath = paths.first {
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(nameOfImage)
            let image = UIImage(contentsOfFile: imageURL.path)
            return image
        }
        return UIImage.init(named: "default.png")
    }
}
