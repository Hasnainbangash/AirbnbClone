//
//  AddDiscountScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 27/01/2025.
//

import UIKit

class AddDiscountScreenViewController: UIViewController {

    @IBOutlet weak var saveAndExitButtonLabel: UIButton!
    @IBOutlet weak var questionsButtonLabel: UIButton!
    @IBOutlet weak var backButtonLabel: UIButton!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    @IBOutlet weak var newListingPromotionView: UIView!
    @IBOutlet weak var weeklyDiscountView: UIView!
    @IBOutlet weak var monthlyDiscountView: UIView!
    
    @IBOutlet weak var onlyOneDiscountAppliedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupCornerRadius()
        setupBorderWidth()
        setupButtonUnderline()
        setupLabelUnderline()
    }
    
    func setupCornerRadius() {
        saveAndExitButtonLabel.layer.cornerRadius = saveAndExitButtonLabel.frame.height / 2
        questionsButtonLabel.layer.cornerRadius = questionsButtonLabel.frame.height / 2
        nextButtonLabel.layer.cornerRadius = nextButtonLabel.frame.height / 5
        
        newListingPromotionView.layer.cornerRadius = newListingPromotionView.frame.height / 7
        weeklyDiscountView.layer.cornerRadius = weeklyDiscountView.frame.height / 7
        monthlyDiscountView.layer.cornerRadius = monthlyDiscountView.frame.height / 7
    }
    
    func setupBorderWidth() {
        saveAndExitButtonLabel.layer.borderWidth = 0.3
        questionsButtonLabel.layer.borderWidth = 0.3
        
        newListingPromotionView.layer.borderWidth = 0.3
        weeklyDiscountView.layer.borderWidth = 0.3
        monthlyDiscountView.layer.borderWidth = 0.3
    }
    
    func setupButtonUnderline() {
        guard let buttonText = backButtonLabel.titleLabel?.text else {return}
        
        // Create an NSMutableAttributedString from the button's title text
        let attributedString = NSMutableAttributedString(string: buttonText)
        
        // Add underline attribute to the full text
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: buttonText.count))
        
        // Set the attributed text to the button's title
        backButtonLabel.setAttributedTitle(attributedString, for: .normal)
        
        // Optional: Change the text color (you can set any color you prefer)
        backButtonLabel.setTitleColor(UIColor.black, for: .normal)
    }
    
    func setupLabelUnderline() {
        
        let fullText = "Only one discount will be applied per stay. Learn more"
        // Create an attributed string with the full text
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // Define the range of the clickable part ("Visit the Help Centre")
        let clickableRange = (fullText as NSString).range(of: "Learn more")
        
        // Add the link attribute to make it look like a hyperlink
        attributedString.addAttribute(.link, value: "helpCentre://", range: clickableRange)
        
        // Change textColor to black
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: clickableRange)
        
        // Adding the underline
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: clickableRange)
        
        // Set the attributed text to the UILabel
        onlyOneDiscountAppliedLabel.attributedText = attributedString
        
        // Enable interaction on the label
        onlyOneDiscountAppliedLabel.isUserInteractionEnabled = true
        
        // Add tap gesture recognizer to detect taps on the label
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        onlyOneDiscountAppliedLabel.addGestureRecognizer(tapGesture)
        
    }
    
    // Handle the tap event
    @objc func labelTapped(_ gesture: UITapGestureRecognizer) {
        print("Learn more label tapped")
        print("Going to learn screen now")
        navigateToHelpCentre()
    }

    // Method to navigate to the Help Centre screen
    func navigateToHelpCentre() {
        print("Learn screen is open now")
        // let helpCentreVC = HelpCentreViewController()
        // navigationController?.pushViewController(helpCentreVC, animated: true)
    }

}
