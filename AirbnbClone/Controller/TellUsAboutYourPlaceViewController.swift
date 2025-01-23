//
//  TellUsAboutYourPlaceViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 23/01/2025.
//

import UIKit

class TellUsAboutYourPlaceViewController: UIViewController {

    @IBOutlet weak var saveAndExitButtonLabel: UIButton!
    @IBOutlet weak var backButtonLabel: UIButton!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
        setupBorderWidth()
    }
    
    func setupCornerRadius() {
        saveAndExitButtonLabel.layer.cornerRadius = saveAndExitButtonLabel.frame.height / 4
        nextButtonLabel.layer.cornerRadius = nextButtonLabel.frame.height / 4
    }
    
    func setupBorderWidth() {
        saveAndExitButtonLabel.layer.borderWidth = 0.3
    }

}
