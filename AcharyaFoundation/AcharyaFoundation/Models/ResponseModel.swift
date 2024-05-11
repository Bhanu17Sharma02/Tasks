//   let aPImageResponse = try? JSONDecoder().decode(APImageResponse.self, from: jsonData)

import Foundation

// MARK: - APImageResponseElement
struct APImageResponseElement: Codable, Identifiable, Hashable {
   
    var id: String
    var title: String
    let language: String
    let thumbnail: Thumbnail
    let mediaType: Int
    let coverageURL: String
    let publishedAt, publishedBy: String
    let backupDetails: BackupDetails?
    
    static func == (lhs: APImageResponseElement, rhs: APImageResponseElement) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
           return hasher.combine(id)
       }
    
}

// MARK: - BackupDetails
struct BackupDetails: Codable {
    let pdfLink: String
    let screenshotURL: String
}

enum Language: String, Codable {
    case english = "english"
    case hindi = "hindi"
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let id: String
//    let version: Int
    let domain: String
    let basePath: String
    let key: String
//    let qualities: [Int]
//    let aspectRatio: Int
}

//enum Key: String, Codable {
//    case imageJpg = "image.jpg"
//}

typealias APImageResponse = [APImageResponseElement]
