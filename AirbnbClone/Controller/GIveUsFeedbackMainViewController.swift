//
//  GIveUsFeedbackMainViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 14/01/2025.
//

import UIKit

class GIveUsFeedbackMainViewController: UIViewController {

    @IBOutlet weak var pleaseSelectView: UIView!
    @IBOutlet weak var contactUsButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
        setupBorderRadius()
    }
    
    func setupCornerRadius() {
        pleaseSelectView.layer.cornerRadius = pleaseSelectView.frame.height / 4
        contactUsButtonLabel.layer.cornerRadius = contactUsButtonLabel.frame.height / 4
    }
    
    func setupBorderRadius() {
        pleaseSelectView.layer.borderWidth = 0.8
        contactUsButtonLabel.layer.borderWidth = 0.5
    }

}
