//
//  NetworkService.swift
//  CocktailPetProject
//
//  Created by Максим Япринцев on 24.07.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func getCocktails(completion: @escaping (Result<CocktailResponse?, Error>) -> Void)
}


class NetrworkService: NetworkServiceProtocol {

    
    let sessionConfiguration = URLSessionConfiguration.default
    let decoder = JSONDecoder()
    let session = URLSession.shared
    
    
    func getCocktails(completion: @escaping (Result<CocktailResponse?, Error>) -> Void) {
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic") else { return }
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            print(data!)
            do {
                let obj = try self.decoder.decode(CocktailResponse.self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
