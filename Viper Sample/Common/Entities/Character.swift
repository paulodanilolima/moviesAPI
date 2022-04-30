//
//  Character.swift
//  Viper Sample
//
//  Created by Alberto Lourenço on 30/09/21.
//

import Foundation

struct Character: Codable {
    
    var id: Int
    var fullName: String
    var image: String
    var origin: ObjectURL
    var location: ObjectURL
    var episode: [String]
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case fullName = "name"
        case image
        case location
        case episode
        case origin
    }
}
