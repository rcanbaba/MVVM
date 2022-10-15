//
//  WebService.swift
//  MVVM-2-MovieApp
//
//  Created by Can Babaoğlu on 4.10.2022.
//

import Alamofire

protocol ServiceProtocol {
    func fetchMovies(onSuccess: @escaping (Movies?) -> (), onError: @escaping (AFError) -> ())
}

final class Services: ServiceProtocol {
    func fetchMovies(onSuccess: @escaping (Movies?) -> (), onError: @escaping (AFError) -> ()) {
        ServiceManager.shared.fetch(path: Constant.ServiceEndpoint.fetchMovies()) { (response: Movies) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }
}
