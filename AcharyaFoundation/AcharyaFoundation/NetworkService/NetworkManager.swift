//
//  NetworkManager.swift
//  AcharyaFoundation
//
//  Created by Bhanu Sharma on 11/05/24.
//

import Foundation

class NetworkManager{
    
    static let shared = NetworkManager()
    
    private init() {
    }
    
    func loadImagesUrl(
        url: String  = "https://acharyaprashant.org/api/v2/content/misc/media-coverages?limit=100",
        completion: @escaping (Result<[APImageResponseElement], Error>) -> ()
    ) {
        
        guard let url = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {  data, response, error in
            guard let data = data else {
                print("Network error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let result = try JSONDecoder().decode([APImageResponseElement].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
                print("Error decoding JSON: \(error)")
            }
        }.resume()
        
    }
}

