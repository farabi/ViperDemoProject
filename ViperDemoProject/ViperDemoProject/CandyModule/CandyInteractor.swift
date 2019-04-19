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
    
    var presenter: CandyPresenterProtocol?
    private let apiWorker: CandyAPIWorkerProtocol

    required init(withApiWorker apiWorker:CandyAPIWorkerProtocol) {
        self.apiWorker = apiWorker
    }
    
    func fetch(candyFor presenter: CandyPresenterProtocol) {
        apiWorker.fetchCandy { [unowned self] (candyEntity) in
            self.presenter?.interactor(self, didFetch: candyEntity)
        }
    }
}
