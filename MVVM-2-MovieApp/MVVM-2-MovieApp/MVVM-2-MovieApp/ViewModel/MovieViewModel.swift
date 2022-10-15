//
//  MovieViewModel.swift
//  MVVM-2-MovieApp
//
//  Created by Can Babaoğlu on 15.10.2022.
//

import Foundation

protocol MovieHomeProtocol {
    func fetchMovies(completion: @escaping (Movies?) -> Void)
}

final class MovieHomeViewModel: MovieHomeProtocol {
    private var service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchMovies(completion: @escaping (Movies?) -> Void) {
        service.fetchMovies { response in
            guard let response = response else {
                completion(nil)
                return
            }
            completion(response)
        } onError: { error in
            completion(nil)
        }
    }
}
