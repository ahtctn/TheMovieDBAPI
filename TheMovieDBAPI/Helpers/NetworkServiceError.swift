//
//  NetworkServiceError.swift
//  TheMovieDBAPI
//
//  Created by Ahmet Ali ÇETİN on 20.07.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case decodingError( _ error: Error)   
}
