//
//  Endpoint.swift
//  TheMovieDBAPI
//
//  Created by Ahmet Ali ÇETİN on 20.07.2023.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    
    func request() -> URLRequest
}

enum Endpoint<T: Decodable> {
    case getPopularMovies
    case getPopularTVShows
}

extension Endpoint: EndpointProtocol {
    var baseURL: String {
        return Constants.baseURL
    }
    
    var path: String {
        switch self {
        case .getPopularMovies:
            return Constants.popularMovies
        case .getPopularTVShows:
            return Constants.popularTVShows
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getPopularMovies:
            return .get
        case .getPopularTVShows:
            return .get
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var parameters: [String : Any]? {
        return ["api_key": Constants.API_KEY]
    }
    
    func request() -> URLRequest {
        guard var components = URLComponents(string: baseURL) else { fatalError("components error")}
        components.path = path
        
        if let parameters = parameters {
            components.queryItems = parameters.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
        }
        
        guard let url = components.url else { fatalError("url error") }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let header = headers {
            for (key, value) in header {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
}
