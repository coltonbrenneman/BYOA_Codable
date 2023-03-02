//
//  Characters.swift
//  BYOA_Codable
//
//  Created by Colton Brenneman on 3/2/23.
//

import Foundation

struct Info: Decodable {
    let count: Int
    let pages: Int
    let next: String
}

struct ResultsTopLevelDictionary: Decodable {
    private enum CodingKeys: String, CodingKey {
        case characterID = "id"
        case characterName = "name"
        case characterSpecies = "species"
        case characterImage = "image"
    }
    let characterID: Int
    let characterName: String
    let characterSpecies: String
    let characterImage: String
}
