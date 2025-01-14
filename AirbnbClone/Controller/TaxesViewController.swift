//
//  TaxesViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 14/01/2025.
//

import UIKit

class TaxesViewController: UIViewController {

    @IBOutlet weak var taxDocumentsViews: UIView!
    @IBOutlet weak var taxesPayersView: UIView!
    @IBOutlet weak var addTaxInfoButtonLabel: UIButton!
    @IBOutlet weak var addVatIdNumberButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
    }
    
    func setupCornerRadius() {
        addTaxInfoButtonLabel.layer.cornerRadius = addTaxInfoButtonLabel.frame.height / 4
        addVatIdNumberButtonLabel.layer.cornerRadius = addVatIdNumberButtonLabel.frame.height / 4
    }

}
