//
//  CharacterService.swift
//  BYOA_Codable
//
//  Created by Colton Brenneman on 3/2/23.
//

import UIKit

struct CharacterService {
    
    static func fetchAllCharacters(completion: @escaping (Result<ResultsTopLevelDictionary, NetworkError>) -> Void) {
        
        guard let finalURL = URL(string: Constants.CharacterService.baseRickAndMortyURL) else { completion(.failure(.invalidURL)) ; return }
        print("Fetch All Characters URL: \(finalURL)")
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let error = error {
                completion(.failure(.thrownError(error))) ; return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Fetch All Characters Status Code Ya Hoe: \(response.statusCode)")
            }
            
            guard let data = data else { completion(.failure(.noData)) ; return }
            
            do {
                let topLevel = try JSONDecoder().decode(ResultsTopLevelDictionary.self, from: data)
                completion(.success(topLevel))
            } catch {
                completion(.failure(.unableToDecode)) ; return
            }
        }.resume()
    }//End of func
    
    static func fetchCharactersImage(for item: String?, completion: @escaping (Result<UIImage, NetworkError>) -> Void) {
        
        guard let item = item else { completion(.success(UIImage(named: "luffy image")!)) ; return }
        guard let finalURL = URL(string: item) else { completion(.failure(.invalidURL)) ; return }
        print("Image Fetch Final URL: \(finalURL)")
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let error = error {
                completion(.failure(.thrownError(error))) ; return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Fetch The Characters Image: \(response.statusCode)")
            }
            
            guard let data = data else { completion(.failure(.noData)) ; return }
            
            guard let image = UIImage(data: data) else { completion(.failure(.unableToDecode)) ; return }
            completion(.success(image))
        }.resume()
    }
}//End of struct
