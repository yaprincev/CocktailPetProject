//
//  Cocktail.swift
//  CocktailPetProject
//
//  Created by Максим Япринцев on 29.07.2023.
//

import Foundation

struct Cocktail: Codable {

    
    let strDrink: String
    let strDrinkThumb: String
    let idDrink: String
    
}

struct CocktailResponse: Codable {
    let cocktails: [Cocktail]
}
