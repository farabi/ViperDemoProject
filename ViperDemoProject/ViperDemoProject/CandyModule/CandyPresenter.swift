//
//  CandyPresenter.swift
//  ViperDemoProject
//
//  Created Saad El Oulladi on 05/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit

/// Candy Module Presenter
class CandyPresenter {
    
    weak private var _view: CandyViewProtocol?
    private var interactor: CandyInteractorProtocol
    private var wireframe: CandyRouterProtocol
    
    init(view: CandyViewProtocol) {
        self._view = view
        self.interactor = CandyInteractor()
        self.wireframe = CandyRouter()
    }
}

// MARK: - extending CandyPresenter to implement it's protocol
extension CandyPresenter: CandyPresenterProtocol {
    func fetch(objectFor view: CandyViewProtocol) {

    }
    
    func interactor(_ interactor: CandyInteractorProtocol, didFetch object: CandyEntity) {

    }
    
    func interactor(_ interactor: CandyInteractorProtocol, didFailWith error: Error) {

    }
    
    
}
