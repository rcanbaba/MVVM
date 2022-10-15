//
//  MovieModel.swift
//  MVVM-2-MovieApp
//
//  Created by Can Babaoğlu on 4.10.2022.
//

import Foundation

struct Movies: Codable {
    let results: [Result]?
}

struct Result: Codable {
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}
