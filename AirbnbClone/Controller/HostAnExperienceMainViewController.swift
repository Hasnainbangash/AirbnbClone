//
//  HostAnExperienceMainViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 14/01/2025.
//

import UIKit

class HostAnExperienceMainViewController: UIViewController {
    
    @IBOutlet weak var grabberView: UIView!
    @IBOutlet weak var submitYourExperienceLabel: UILabel!
    @IBOutlet weak var letsGoButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isHidden = true
        
        setupCornerRadius()
        setupAttributedString()
    }
    
    func setupCornerRadius() {
        grabberView.layer.cornerRadius = grabberView.frame.height / 2
        letsGoButtonLabel.layer.cornerRadius = letsGoButtonLabel.frame.height / 5
    }
    
    func setupAttributedString() {
        let fullText = "Submit your experience and it will be reviewed to make sure it meets the standards and requirements. Many factors go into whether an experience is approved. If your experience is approved, you'll be able to start hosting."
        
        // Create an attributed string with the full text
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // Define the range of the clickable part
        let clickableRange = (fullText as NSString).range(of: "standards and requirements")
        
        // Create the gray color
        let clickableColor = UIColor(red: 106/255, green: 106/255, blue: 106/255, alpha: 1)
        
        // Setting the color first
        attributedString.addAttribute(.foregroundColor, value: clickableColor, range: clickableRange)
        
        // Here adding the custom link accessibility
        attributedString.addAttribute(.accessibilityTextCustom, value: "helpCentre://", range: clickableRange)
        
        // Adding the underline
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: clickableRange)
        
        // Set the attributed text to the UILabel
        submitYourExperienceLabel.attributedText = attributedString
        
        // Enable interaction on the label
        submitYourExperienceLabel.isUserInteractionEnabled = true
        
        // Add tap gesture recognizer to detect taps on the label
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        submitYourExperienceLabel.addGestureRecognizer(tapGesture)
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
    
    
    @IBAction func closeButton(_ sender: UIButton) {
        print("Closed button clicked")
        self.dismiss(animated: true, completion: nil)
    }
    
}
