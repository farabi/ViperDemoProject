//
//  CandyView.swift
//  ViperDemoProject
//
//  Created Saad El Oulladi on 05/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit

/// Candy Module View
class CandyView: UIViewController {
    
    var presenter: CandyPresenterProtocol?
    
    private var object : CandyEntity?
    
    @IBOutlet weak private var candyImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    @IBOutlet weak private var quantityStepper: UIStepper!
    @IBOutlet weak private var quantityLabel: UILabel!
     
    override func viewDidLoad() {
        super.viewDidLoad()

        // Informs the Presenter that the View is ready to receive data.
        presenter?.fetch(candyFor: self)
    }
}

// MARK: - extending CandyView to implement it's protocol
extension CandyView: CandyViewProtocol {
    func set(object: CandyEntity) {

    }
}
