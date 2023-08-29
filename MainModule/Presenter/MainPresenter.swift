//
//  MainPresenter.swift
//  CocktailPetProject
//
//  Created by Максим Япринцев on 22.07.2023.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getCocktails()
    var cocktails: CocktailResponse? { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    
    
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    var cocktails: CocktailResponse?
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getCocktails()
    }
    
    func getCocktails() {
        networkService.getCocktails { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let cocktails) :
                    self.cocktails = cocktails
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    
    
}
