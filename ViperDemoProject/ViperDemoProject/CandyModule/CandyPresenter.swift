//
//  CandyPresenter.swift
//  ViperDemoProject
//
//  Created Saad El Oulladi on 05/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import Foundation

/// Candy View Model
struct CandyViewModel {
    let title: String
    let description: String
    let price: String
    let quantity: String
    let imageName: String
}

/// Candy Module Presenter
class CandyPresenter {

    weak var view: CandyViewProtocol?
    var wireframe: CandyRouterProtocol?
    var interactor: CandyInteractorProtocol?
}

// MARK: - extending CandyPresenter to implement it's protocol
extension CandyPresenter: CandyPresenterProtocol {

    func fetch(candyFor view: CandyViewProtocol) {
        interactor?.fetch(candyFor: self)
    }
    
    func interactor(_ interactor: CandyInteractorProtocol, didFetch object: CandyEntity) {
        
        let priceText = "\(object.price) €"
        let quantityText = "\(object.price) €"

        let candyViewModel = CandyViewModel(title: object.title,
                                            description: object.description,
                                            price: priceText,
                                            quantity: quantityText,
                                            imageName: object.imageName)
        
        view?.set(viewModel: candyViewModel)
        
    }
    
    func interactor(_ interactor: CandyInteractorProtocol, didFailWith error: Error) {

    }
    
    
}
