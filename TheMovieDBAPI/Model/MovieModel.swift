//
//  MovieModel.swift
//  TheMovieDBAPI
//
//  Created by Ahmet Ali ÇETİN on 20.07.2023.
//

import Foundation

struct MovieModel: Decodable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    // Diğer özellikler burada yer alabilir.
}
