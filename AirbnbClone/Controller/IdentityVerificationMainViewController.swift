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
    @IBOutlet weak var identifyVerificationWorksButtonsLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerradius()
        setupButtonUnderline()
    }
    
    func setupCornerradius() {
        privacyPolicyTextView.layer.cornerRadius = privacyPolicyTextView.frame.height / 5
        addanIDButtonLabel.layer.cornerRadius = addanIDButtonLabel.frame.height / 5
    }
    
    func setupButtonUnderline() {
        guard let buttonText = identifyVerificationWorksButtonsLabel.titleLabel?.text else {return}
        
        // Create an NSMutableAttributedString from the button's title text
        let attributedString = NSMutableAttributedString(string: buttonText)
        
        // Add underline attribute to the full text
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: buttonText.count))
        
        // Set the attributed text to the button's title
        identifyVerificationWorksButtonsLabel.setAttributedTitle(attributedString, for: .normal)
        
        // Optional: Change the text color (you can set any color you prefer)
        identifyVerificationWorksButtonsLabel.setTitleColor(UIColor.blue, for: .normal)
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
