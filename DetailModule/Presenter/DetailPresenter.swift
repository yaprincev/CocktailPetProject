//
//  DetailPresenter.swift
//  CocktailPetProject
//
//  Created by Максим Япринцев on 31.08.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setCocktail(cocktail: CocktailResponse?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, cocktail: CocktailResponse?)
    func setCocktail()
    
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    let cocktail: CocktailResponse?
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, cocktail: CocktailResponse?) {
        self.view = view
        self.networkService = networkService
        self.cocktail = cocktail
    }
    
    func setCocktail() {
        view?.setCocktail(cocktail: cocktail)
    }
    
    
}
