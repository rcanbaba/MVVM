//
//  RMService.swift
//  MVVM-1-RickMorty
//
//  Created by Can Babaoğlu on 2.10.2022.
//

import Alamofire

enum RMServiceEndpointEnum: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case characterPath = "/character"
    
    static func character() -> String {
        return BASE_URL.rawValue + characterPath.rawValue
    }
}

protocol RMServiceProtocol {
    func fetchAllData(response: @escaping ([CharacterResponseResultModel]?) -> Void )
}

struct RMService: RMServiceProtocol {
    func fetchAllData(response: @escaping ([CharacterResponseResultModel]?) -> Void ) {
        AF.request(RMServiceEndpointEnum.character())
            .responseDecodable(of: CharacterResponseModel.self) { responseModel in
                guard let data = responseModel.value else {
                    print(responseModel.error.debugDescription)
                    response(nil)
                    return
                }
                response(data.results)
            }
    }
}
