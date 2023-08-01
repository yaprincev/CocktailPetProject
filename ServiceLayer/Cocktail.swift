//
//  Cocktail.swift
//  CocktailPetProject
//
//  Created by Максим Япринцев on 29.07.2023.
//

import Foundation

struct Cocktail: Codable {

    struct Drinks: Codable {
        let strDrink: String
        let strDrinkThumb: String
        let idDrink: String
    }
    var drinks: Drinks
}
