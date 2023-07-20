//
//  NetworkManager.swift
//  TheMovieDBAPI
//
//  Created by Ahmet Ali ÇETİN on 20.07.2023.
//

import Foundation

typealias NetworkResult<T: Decodable> = Result<T, NetworkError>
typealias NetworkCompletion<T: Decodable> = (NetworkResult<T>) -> Void

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    private func request<T: Decodable>(_ endpoint: Endpoint<T>, completion: @escaping NetworkCompletion<T>) {
        let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response, error in
            guard let data = data , error == nil else {
                print("Error: \(String(describing: error?.localizedDescription))")
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodingError(error)))
            }
        }
        task.resume()
    }
    
    func getPopularMovies(completion: @escaping NetworkCompletion<MovieModel>) {
        let endpoint = Endpoint<MovieModel>.getPopularMovies
        request(endpoint, completion: completion)
    }
    
    func getPopularTVShows(completion: @escaping NetworkCompletion<TVShowModel>) {
        let endpoint = Endpoint<TVShowModel>.getPopularTVShows
        request(endpoint, completion: completion)
        
    }
}
