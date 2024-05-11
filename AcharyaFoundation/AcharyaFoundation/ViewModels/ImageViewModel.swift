//
//  ImageViewModel.swift
//  AcharyaFoundation
//
//  Created by Bhanu Sharma on 11/05/24.
//

import Foundation
import UIKit
import SwiftUI

class ImageViewModel: ObservableObject {
    
    @Published  var urlList: [APImageResponseElement] = []
    
   @Published var useableUrlList: [String] = []
    
     func loadImage() async {
        NetworkManager.shared.loadImagesUrl { result in
            switch result {
            case .success(let response) :
                DispatchQueue.main.async {
                    self.urlList = response
                }
            case .failure(let error) :
                print(error.localizedDescription)
            }
        }
    }
}

