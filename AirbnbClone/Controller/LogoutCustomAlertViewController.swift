//
//  LogoutCustomViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 06/02/2025.
//

import UIKit

class LogoutCustomAlertViewController: UIViewController {

    @IBOutlet weak var yesButtonLabel: UIButton!
    @IBOutlet weak var noButtonLabel: UIButton!
    @IBOutlet weak var logoutAlertMainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
    }

    func setupCornerRadius() {
        
        yesButtonLabel.layer.cornerRadius = yesButtonLabel.frame.height / 3
        noButtonLabel.layer.cornerRadius = noButtonLabel.frame.height / 3
        logoutAlertMainView.layer.cornerRadius = logoutAlertMainView.frame.height / 4
        
    }
    
}
