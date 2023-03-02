//
//  NetworkError.swift
//  BYOA_Codable
//
//  Created by Colton Brenneman on 3/1/23.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL. This isn't the right endpoint that you want hoe."
        case .thrownError(let error):
            return "Thrown error. Error was \(error.localizedDescription)"
        case .noData:
            return "There was no data recieved from successful network fetch ya dumb hoe."
        case .unableToDecode:
            return "Unable to decode model from data ya dumb bitch"
        }
    }
}
