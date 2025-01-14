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
    
    @IBOutlet weak var taxesPayersStackView: UIStackView!
    @IBOutlet weak var taxDocumentsStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        taxDocumentsViews.backgroundColor = .white
        taxesPayersView.isHidden = false
        taxDocumentsStackView.isHidden = true
        
        setupCornerRadius()
    }
    
    func setupCornerRadius() {
        addTaxInfoButtonLabel.layer.cornerRadius = addTaxInfoButtonLabel.frame.height / 5
        addVatIdNumberButtonLabel.layer.cornerRadius = addVatIdNumberButtonLabel.frame.height / 5
    }

    @IBAction func taxViewButtons(_ sender: UIButton) {
        
        resetButtonsView()
        
        guard let buttonTitle = sender.titleLabel?.text else {
            print(sender.titleLabel?.text ?? "No title")
            return
        }

        print(buttonTitle)
        switch buttonTitle {
        case "Taxespayers":
            taxesPayersView.backgroundColor = .black
            taxesPayersStackView.isHidden = false
            taxDocumentsStackView.isHidden = true
            break
        case "Tax documents":
            taxDocumentsViews.backgroundColor = .black
            taxDocumentsStackView.isHidden = false
            taxesPayersStackView.isHidden = true
            break
        default:
            break
        }
        
    }
    
    func resetButtonsView() {
        taxesPayersView.backgroundColor = .white
        taxesPayersStackView.isHidden = false
        
        taxDocumentsViews.backgroundColor = .white
        taxDocumentsStackView.isHidden = false
    }
}
