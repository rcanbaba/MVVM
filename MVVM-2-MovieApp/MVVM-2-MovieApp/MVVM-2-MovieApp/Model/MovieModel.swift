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
}
