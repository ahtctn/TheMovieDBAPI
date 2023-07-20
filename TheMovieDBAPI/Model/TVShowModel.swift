//
//  TVShowModel.swift
//  TheMovieDBAPI
//
//  Created by Ahmet Ali ÇETİN on 20.07.2023.
//

import Foundation

struct TVShowModel: Decodable {
    let id: Int
    let name: String
    let overview: String
    let firstAirDate: String
    // Diğer özellikler burada yer alabilir.
}
