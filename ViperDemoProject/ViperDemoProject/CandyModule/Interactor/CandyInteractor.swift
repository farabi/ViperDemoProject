//
//  CandyInteractor.swift
//  ViperDemoProject
//
//  Created Saad El Oulladi on 05/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit

/// Candy Module Interactor Protocol
protocol CandyInteractorProtocol {
    // Fetch Canry Entity from Data Layer
    func fetch(candyFor presenter: CandyPresenterProtocol)
    // Fetch Object from Data Layer
    func update(candyQuantity quantity:Int)
}

/// Candy Module Interactor
class CandyInteractor: CandyInteractorProtocol {
    
    private static let vat:Float = 6.5
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
            // FIXME: [your bug fix reminder].
            return
        }
        
        let totalPrice = candyEntity.price * Float(quantity)
        let tax = (totalPrice/100) * CandyInteractor.vat
        let totalInclTax = totalPrice + tax
        self.presenter?.interactor(self,
                                   didUpdateTotalPrice: totalPrice,
                                   totalInclTax: totalInclTax,
                                   vat: CandyInteractor.vat,
                                   quantity: quantity)
    }

}
