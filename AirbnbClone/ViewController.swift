//
//  ViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 07/01/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var emailButtonView: UIView!
    @IBOutlet weak var facebookButtonView: UIView!
    @IBOutlet weak var googleButtonView: UIView!
    @IBOutlet weak var appleButtonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupCornerRadius()
        setupBorderWidth()
        
    }
    
    func setupCornerRadius() {
        phoneNumberView.layer.cornerRadius = phoneNumberView.frame.height / 9
        continueButton.layer.cornerRadius = continueButton.frame.height / 5
        emailButtonView.layer.cornerRadius = emailButtonView.frame.height / 5
        facebookButtonView.layer.cornerRadius = facebookButtonView.frame.height / 5
        googleButtonView.layer.cornerRadius = googleButtonView.frame.height / 5
        appleButtonView.layer.cornerRadius = appleButtonView.frame.height / 5
    }
    
    func setupBorderWidth() {
        phoneNumberView.layer.borderWidth = 0.7
        emailButtonView.layer.borderWidth = 1.0
        facebookButtonView.layer.borderWidth = 1.0
        googleButtonView.layer.borderWidth = 1.0
        appleButtonView.layer.borderWidth = 1.0
    }
    
    
    
}
