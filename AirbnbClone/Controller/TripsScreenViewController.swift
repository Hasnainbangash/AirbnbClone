//
//  TripsScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 07/01/2025.
//

import UIKit

class TripsScreenViewController: UIViewController {

    @IBOutlet weak var startSearchingButton: UIButton!
    @IBOutlet weak var helpCentreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupCornerRadius()
        setupBorderWidth()
        
        let fullText = "Can't find your reservation here? Visit the Help Centre"
        // Create an attributed string with the full text
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // Define the range of the clickable part ("Visit the Help Centre")
        let clickableRange = (fullText as NSString).range(of: "Visit the Help Centre")
        
        // Add the link attribute to make it look like a hyperlink
        attributedString.addAttribute(.link, value: "helpCentre://", range: clickableRange)
        
        // Change textColor to black
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: clickableRange)
        
        // Adding the underline
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: clickableRange)
        
        // Set the attributed text to the UILabel
        helpCentreLabel.attributedText = attributedString
        
        // Enable interaction on the label
        helpCentreLabel.isUserInteractionEnabled = true
        
        // Add tap gesture recognizer to detect taps on the label
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        helpCentreLabel.addGestureRecognizer(tapGesture)
        
    }
    
    func setupCornerRadius() {
        startSearchingButton.layer.cornerRadius = startSearchingButton.frame.height / 5
    }
    
    func setupBorderWidth() {
        startSearchingButton.layer.borderWidth = 1.0
    }
    
    // Handle the tap event
    @objc func labelTapped(_ gesture: UITapGestureRecognizer) {
        print("Help centre label tapped")
        print("Going to help screen now")
        navigateToHelpCentre()
    }

    // Method to navigate to the Help Centre screen
    func navigateToHelpCentre() {
        print("Help screen is open now")
        // let helpCentreVC = HelpCentreViewController()
        // navigationController?.pushViewController(helpCentreVC, animated: true)
    }
}
