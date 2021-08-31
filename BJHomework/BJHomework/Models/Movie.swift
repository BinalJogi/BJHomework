//
//  Movie.swift
//  BJHomework
//
//  Created by Binal on 31/08/2021.
//

import Foundation

struct Movie : Decodable {
    let id: Int
    let overview: String
    let originalTitle: String
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id, overview
        case originalTitle = "original_title"
        case posterPath = "poster_path"
    }
}
