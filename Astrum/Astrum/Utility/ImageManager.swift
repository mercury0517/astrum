//
//  ImageManager.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/08.
//

import UIKit

class ImageManager {
    static var shared = ImageManager()
    var fileManager = FileManager.default
    var cachesDirectoryURL: URL {
        let urls = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)
        return urls[0]
    }
    
    func getImage(name: String) -> UIImage? {
        let fileUrl = cachesDirectoryURL.appendingPathComponent("\(name).png")
        let filePath = fileUrl.path
        if fileManager.fileExists(atPath: filePath),
           let data = try? Data(contentsOf: fileUrl){
            return UIImage(data: data)
        }
        return nil
    }
    
    func writeImage(name: String, uiImage: UIImage) {
        let data = uiImage.pngData()
        let fileUrl = cachesDirectoryURL.appendingPathComponent("\(name).png")
        let filePath = fileUrl.path
        fileManager.createFile(atPath: filePath, contents: data)
    }
    
    func deleteImage(name: String) {
        let fileUrl = cachesDirectoryURL.appendingPathComponent("\(name).png")
        
        do {
            try fileManager.removeItem(at: fileUrl)
        } catch let error {
            print("失敗した\(error)")
        }
    }
}
