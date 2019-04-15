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
    
    private var presenter: CandyPresenterProtocol!
    
    private var object : CandyEntity?
    
    @IBOutlet weak var candyImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityStepper: UIStepper!
    @IBOutlet weak var quantityLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CandyPresenter(view: self)
        
        // Informs the Presenter that the View is ready to receive data.
        presenter.fetch(objectFor: self)
    }
    
}

// MARK: - extending CandyView to implement it's protocol
extension CandyView: CandyViewProtocol {
    func set(object: CandyEntity) {

    }
    
    
}
