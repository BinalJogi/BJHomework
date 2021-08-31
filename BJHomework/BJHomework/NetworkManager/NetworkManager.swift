//
//  NetworkManager.swift
//  BJHomework
//
//  Created by Binal on 31/08/2021.
//

import Foundation

class NetworkManager{
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    func getMovies(from urlS: String, completion: @escaping (Result<[Movie], NetworkError>) -> Void){
        
        guard let url = URL(string: urlS) else {
            completion(Result.failure(NetworkError.url))
            return
            }
        
        session.dataTask(with: url) { [weak self] (data, response, error) in
            
            if let error = error {
                completion(.failure(.other(error)))
                return
            }
     
            if let data = data {
                do {
                    let response = try self?.decoder.decode(MoviesResponse.self, from: data)
                    let movies = response?.results ?? []
                    completion(.success(movies))
                    return
                } catch (let error) {
                    completion(.failure(.other(error)))
                }
            }
        }.resume()
        
        }
    }


