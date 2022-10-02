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
    
    var rickMortyOutput: RMViewControllerOutput? { get }
    func setDelegate(output: RMViewControllerOutput)
    
}


final class RMViewModel: RMViewModelProtocol {
    var rickMortyOutput: RMViewControllerOutput?
    func setDelegate(output: RMViewControllerOutput) {
        rickMortyOutput = output
    }

    var rickMortyCharacters: [CharacterResponseResultModel] = []
    private var isLoading = false;
    let rickMortyService: RMServiceProtocol
    
    init() {
        rickMortyService = RMService()
    }
    
    func fetchItems() {
        setActivityIndicatorState()
        rickMortyService.fetchAllData { [weak self] (response) in
            self?.setActivityIndicatorState()
            self?.rickMortyCharacters = response ?? []
            self?.rickMortyOutput?.saveData(values: self?.rickMortyCharacters ?? [])
        }
    }
    
    func setActivityIndicatorState() {
        isLoading = !isLoading
        rickMortyOutput?.setActivityIndicator(isLoading: isLoading)
    }
    
}
