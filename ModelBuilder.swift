//
//  ModelBuilder.swift
//  CocktailPetProject
//
//  Created by Максим Япринцев on 22.07.2023.
//

import Foundation
import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModelBuilder: Builder {
   static func createMainModule() -> UIViewController {
       let view = MainViewController()
       let networkServise = NetrworkService()
       let presenter = MainPresenter(view: view, networkService: networkServise)
       view.presenter = presenter
       return view
    }
    

}
