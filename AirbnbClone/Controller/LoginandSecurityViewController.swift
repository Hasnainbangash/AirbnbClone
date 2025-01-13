//
//  LoginandSecurityViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 13/01/2025.
//

import UIKit

class LoginandSecurityViewController: UIViewController {

    @IBOutlet weak var learnAboutSafetyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateSafetyTipsLabel()
    }
    
    func updateSafetyTipsLabel() {
        // Full text in the label
        let fullText = "Learn about safety tips for guests and hosts."
        
        // Create a mutable attributed string
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // Define the color rgba(0, 132, 137, 1)
        let customColor = UIColor(red: 0/255.0, green: 132/255.0, blue: 137/255.0, alpha: 1.0)
        
        // Apply color to "guests" and "hosts" words
        attributedString.addAttribute(.foregroundColor, value: customColor, range: (fullText as NSString).range(of: "guests"))
        attributedString.addAttribute(.foregroundColor, value: customColor, range: (fullText as NSString).range(of: "hosts"))
        
        // Set the styled text to the label
        learnAboutSafetyLabel.attributedText = attributedString
    }
    
}
