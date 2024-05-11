//
//  DataBaseHelper.swift
//  Spotify
//
//  Created by Bhanu Sharma on 14/04/24.
//

import Foundation


struct DataBaseHelper {
    
    func getProduct() async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badURL)
        }
       let (data, _) = try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode(ProductArray.self, from: data)
        return products.products
    }
    
    func getUser() async throws -> [User] {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL)
        }
       let (data, _) = try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode(UserArray.self, from: data)
        return products.users
    }

}
