//
//  IdentityVerificationMainViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 15/01/2025.
//

import UIKit

class IdentityVerificationMainViewController: UIViewController {

    @IBOutlet weak var privacyPolicyTextView: UIView!
    @IBOutlet weak var addanIDButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerradius()
    }
    
    func setupCornerradius() {
        privacyPolicyTextView.layer.cornerRadius = privacyPolicyTextView.frame.height / 5
        addanIDButtonLabel.layer.cornerRadius = addanIDButtonLabel.frame.height / 5
    }

}
