//
//  RMViewModel.swift
//  MVVM-1-RickMorty
//
//  Created by Can Babaoğlu on 2.10.2022.
//

import Foundation

protocol RMViewModelProtocol {
    func fetchItems()
    func setActivityIndicatorState()
    var rickMortyCharacters: [CharacterResponseResultModel] { get set }
    var rickMortyService: RMServiceProtocol { get }
}


class RMViewModel: RMViewModelProtocol {

    var rickMortyCharacters: [CharacterResponseResultModel] = []
    let rickMortyService: RMServiceProtocol
    
    init() {
        rickMortyService = RMService()
    }
    
    func fetchItems() {
        setActivityIndicatorState()
        rickMortyService.fetchAllData { [weak self] (response) in
            self?.setActivityIndicatorState()
            self?.rickMortyCharacters = response ?? []
        }
    }
    
    func setActivityIndicatorState() {
        
    }
    
}
