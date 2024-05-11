//
//  CacheInMemory.swift
//  AcharyaFoundation
//
//  Created by Bhanu Sharma on 12/05/24.
//

import Foundation
import UIKit

class ImageCache {
    static let shared = ImageCache()

    private let cache = NSCache<NSString, UIImage>()
    private let fileManager = FileManager.default
    private let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!.appendingPathComponent("ImageCache")

    private init() {
        
         //Create cache directory if not exists
               if !fileManager.fileExists(atPath: cacheDirectory.path) {
                   do {
                       try fileManager.createDirectory(at: cacheDirectory, withIntermediateDirectories: true, attributes: nil)
                   } catch {
                       print("Error creating cache directory: \(error)")
                   }
               }
    }

    func set(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }

    func get(forKey key: String) -> UIImage? {
       cache.object(forKey: key as NSString)
    }
}
