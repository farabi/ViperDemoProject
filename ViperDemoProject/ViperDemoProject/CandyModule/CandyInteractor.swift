//
//  CandyInteractor.swift
//  ViperDemoProject
//
//  Created Saad El Oulladi on 05/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit

/// Candy Module Interactor
class CandyInteractor: CandyInteractorProtocol {
    
    var apiWorker: CandyAPIWorkerProtocol?
    var presenter: CandyPresenterProtocol?

    func fetch(candyFor presenter: CandyPresenterProtocol) {
        apiWorker?.fetchCandy { [unowned self] (candyEntity) in
            self.presenter?.interactor(self, didFetch: candyEntity)
        }
    }
}
