//
//  Product.swift
//  Spotify
//
//  Created by Bhanu Sharma on 14/04/24.
//

import Foundation


struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
    
    var firstImage: String {
        images.first ?? Constant.url
    }
    
    static var mock: Product {
        get {
            self.init(
                id: 123,
                title: "Example",
                description: "Mock Product",
                price: 999,
                discountPercentage: 15,
                rating: 4.5,
                stock: 50,
                brand: "Apple",
                category: "Electronic ",
                thumbnail: Constant.url,
                images: [Constant.url, Constant.url, Constant.url]
            )
        }
    }
}

struct ProductRow: Identifiable {
    
    let id = UUID()
    let title: String
    let products: [Product]
    
}
