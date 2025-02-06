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
        
        yesButtonLabel.layer.cornerRadius = yesButtonLabel.frame.height / 2
        noButtonLabel.layer.cornerRadius = noButtonLabel.frame.height / 2
        logoutAlertMainView.layer.cornerRadius = logoutAlertMainView.frame.height / 9
        
    }
    
    @IBAction func yesButtonPressed(_ sender: UIButton) {
        print("Yess button pressed")
    }
    
    @IBAction func noButtonPressed(_ sender: UIButton) {
        print("No button pressed")
        UIView.animate(withDuration: 0.3) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
