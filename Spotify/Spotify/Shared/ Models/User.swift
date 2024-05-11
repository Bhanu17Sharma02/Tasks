//
//  User.swift
//  Spotify
//
//  Created by Bhanu Sharma on 14/04/24.
//

import Foundation


struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height: Int
    let weight: Double
    
    static var mock: User {
        .init(
            id: 123,
            firstName: "Bhanu",
            lastName: "Sharma",
            age: 24,
            email: "rishank887@gamil.com",
            phone: "9906143053",
            username: "BhanuSharma",
            password: "*******",
            image: Constant.url,
            height: 178,
            weight: 80
        )
    }
}
