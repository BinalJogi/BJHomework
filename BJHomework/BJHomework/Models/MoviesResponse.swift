//
//  MoviesResponse.swift
//  BJHomework
//
//  Created by Binal on 31/08/2021.
//

import Foundation

struct MoviesResponse: Decodable, Equatable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults : Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}


