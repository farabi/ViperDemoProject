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
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var inclTaxLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Informs the Presenter that the View is ready to receive data.
        presenter?.fetchCandy()
    }
    
    @IBAction func quantityStepperValueChanged(_ sender: Any) {
        presenter?.update(candyQuantity: Int(quantityStepper!.value))
    }
    
}

// MARK: - extending CandyView to implement it's protocol
extension CandyView: CandyViewProtocol {
    
    func set(viewModel: CandyViewModel) {

        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        priceLabel.text = viewModel.price

        candyImageView.image = UIImage(named: viewModel.imageName)
    }
    
    func set(totalPriceViewModel viewModel: TotalPriceViewModel) {
        //excl tax, incl tax, VAT
        quantityLabel.text = viewModel.quantity
        totalPriceLabel.text = viewModel.totalPrice
        taxLabel.text = viewModel.vat
        inclTaxLabel.text = viewModel.totalInclTax
    }

}
