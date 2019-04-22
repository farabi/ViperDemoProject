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
    
    private static let vat = 6.5
    private var candyEntity:CandyEntity?
    
    var presenter: CandyPresenterProtocol?
    private let apiWorker: CandyAPIWorkerProtocol

    required init(withApiWorker apiWorker:CandyAPIWorkerProtocol) {
        self.apiWorker = apiWorker
    }
    
    func fetch(candyFor presenter: CandyPresenterProtocol) {
        apiWorker.fetchCandy { [unowned self] (candyEntity) in
            self.candyEntity = candyEntity
            self.presenter?.interactor(self, didFetch: candyEntity)
        }
    }
    
    func update(candyQuantity quantity: Int) {
        guard let candyEntity = self.candyEntity else {
            return // we can send an error here
        }
        
        self.presenter?.interactor(self,
                                   didUpdateTotalPrice: 30,
                                   totalInclTax: 12,
                                   vat: 10,
                                   quantity: quantity)
    }

}
