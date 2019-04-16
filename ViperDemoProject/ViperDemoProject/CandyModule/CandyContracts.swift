//
//  CandyContracts.swift
//  ViperDemoProject
//
//  Created Saad El Oulladi on 05/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit

//MARK: View -
/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// Candy Module View Protocol
protocol CandyViewProtocol: class {
    var presenter: CandyPresenterProtocol? { get set }
    // Update UI with value returned.
    /// Set the view Object of Type CandyEntity
    func set(object: CandyEntity)
}

//MARK: Interactor -
/// Candy Module Interactor Protocol
protocol CandyInteractorProtocol {
    // Fetch Object from Data Layer
    func fetch(candyFor presenter: CandyPresenterProtocol)
}

//MARK: Presenter -
/// Candy Module Presenter Protocol
protocol CandyPresenterProtocol : class {
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func fetch(candyFor view: CandyViewProtocol)
    /// The Interactor will inform the Presenter a successful fetch.
    func interactor(_ interactor: CandyInteractorProtocol, didFetch object: CandyEntity)
    /// The Interactor will inform the Presenter a failed fetch.
    func interactor(_ interactor: CandyInteractorProtocol, didFailWith error: Error)
}

//MARK: Router (aka: Wireframe) -
/// Candy Module Router Protocol
protocol CandyRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: CandyEntity, parentViewController viewController: UIViewController)
}
