//
//  GIveUsFeedbackMainViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 14/01/2025.
//

import UIKit

class GIveUsFeedbackMainViewController: UIViewController {

    @IBOutlet weak var needHelpLabel: UILabel!
    @IBOutlet weak var pleaseSelectView: UIView!
    @IBOutlet weak var contactUsButtonLabel: UIButton!
    @IBOutlet weak var submitButtonlabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
        setupBorderRadius()
        setupAttributedString()
    }
    
    func setupCornerRadius() {
        pleaseSelectView.layer.cornerRadius = pleaseSelectView.frame.height / 6
        contactUsButtonLabel.layer.cornerRadius = contactUsButtonLabel.frame.height / 6
        submitButtonlabel.layer.cornerRadius = submitButtonlabel.frame.height / 6
    }
    
    func setupBorderRadius() {
        pleaseSelectView.layer.borderWidth = 0.8
        contactUsButtonLabel.layer.borderWidth = 0.5
    }

    func setupAttributedString() {
        let fullText = "If you do have a specific question or need help resolving a problem, you can visit our Help Centre or contact us to connect with our support team."
        
        // Create an attributed string with the full text
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // Define the range of the clickable part
        let helpCentreRange = (fullText as NSString).range(of: "Help Centre")
        let contactUsRange = (fullText as NSString).range(of: "contact us")
        
        // Create the gray color
        let clickableColor = UIColor.black
        
        // Setting the color first
        attributedString.addAttribute(.foregroundColor, value: clickableColor, range: helpCentreRange)
        attributedString.addAttribute(.foregroundColor, value: clickableColor, range: contactUsRange)
        
        // Here adding the custom link accessibility
        attributedString.addAttribute(.accessibilityTextCustom, value: "helpCentre://", range: helpCentreRange)
        attributedString.addAttribute(.accessibilityTextCustom, value: "helpCentre://", range: contactUsRange)
        
        // Adding the underline
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: helpCentreRange)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: contactUsRange)
        
        // Set the attributed text to the UILabel
        needHelpLabel.attributedText = attributedString
        
        // Enable interaction on the label
        needHelpLabel.isUserInteractionEnabled = true
        
        // Add tap gesture recognizer to detect taps on the label
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        needHelpLabel.addGestureRecognizer(tapGesture)
    }
    
    // Handle the tap event
    @objc func labelTapped(_ gesture: UITapGestureRecognizer) {
        print("Help centre label tapped")
        print("Going to standard and requirement now")
        navigateToStandardAndRequirement()
    }
    
    // Method to navigate to the Help Centre screen
    func navigateToStandardAndRequirement() {
        print("Standard and requirement screen is open now")
        // let helpCentreVC = HelpCentreViewController()
        // navigationController?.pushViewController(helpCentreVC, animated: true)
    }
    
}
