//
//  AddPhoneNumberViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 15/01/2025.
//

import UIKit

class AddPhoneNumberViewController: UIViewController {

    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var varifyButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
        setupBorderWidth()
    }
    
    func setupCornerRadius() {
        phoneNumberView.layer.cornerRadius = phoneNumberView.frame.height / 9
        varifyButtonLabel.layer.cornerRadius = varifyButtonLabel.frame.height / 5
        
    }
    
    func setupBorderWidth() {
        phoneNumberView.layer.borderWidth = 0.7
    }

    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
