//
//  Constant.swift
//  MVVM-2-MovieApp
//
//  Created by Can Babaoğlu on 4.10.2022.
//

import UIKit.UIViewController

final class Constant {
    
    
}

// MARK: ~ Service Constants
extension Constant {

    enum ServiceEndpoint: String {
        case BASE_URL = "https://api.themoviedb.org/3/"
        case API_KEY = "api_key=f73bb57f5d978cd566999c467673d266"
        
        static func fetchMovies() -> String {
            "\(BASE_URL)discover/movie?\(API_KEY)"
        }
    }
    
}
