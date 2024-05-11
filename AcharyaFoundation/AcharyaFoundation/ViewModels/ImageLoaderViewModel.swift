//
//  ImageLoaderViewModel.swift
//  AcharyaFoundation
//
//  Created by Bhanu Sharma on 12/05/24.
//

import Foundation
import UIKit
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?

    private var url: String = ""
    private var task: URLSessionDataTask?

    //This function can be move to NetworkManager for now i have keep this here only.
     func loadImage(url: String) {
         self.url = url
        if let cachedImage = ImageCache.shared.get(forKey: url) {
            self.image = cachedImage
            return
        }

        guard let url = URL(string: url) else { return }

        task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }

            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.image = image
                ImageCache.shared.set(image!, forKey: self.url)
            }
        }
        task?.resume()
    }
}
