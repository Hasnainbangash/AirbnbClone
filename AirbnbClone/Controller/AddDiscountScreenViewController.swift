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
    
    @IBOutlet weak var newListingPromotionButtonLabel: UIButton!
    @IBOutlet weak var weeklyDiscountButtonLabel: UIButton!
    @IBOutlet weak var monthlyDiscountButtonLabel: UIButton!
    
    @IBOutlet weak var onlyOneDiscountAppliedLabel: UILabel!
    
    var newListingPromotionisSelected = true
    var weeklyDiscountisSelected = true
    var monthlyDisocuntisSelected = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupCornerRadius()
        setupBorderWidth()
        setupButtonUnderline()
        setupLabelUnderline()
        
        self.transitioningDelegate = self
        
        newListingPromotionButtonLabel.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        weeklyDiscountButtonLabel.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        monthlyDiscountButtonLabel.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
    }
    
    func setupCornerRadius() {
        saveAndExitButtonLabel.layer.cornerRadius = saveAndExitButtonLabel.frame.height / 2
        questionsButtonLabel.layer.cornerRadius = questionsButtonLabel.frame.height / 2
        nextButtonLabel.layer.cornerRadius = nextButtonLabel.frame.height / 5
        
        newListingPromotionView.layer.cornerRadius = newListingPromotionView.frame.height / 9
        weeklyDiscountView.layer.cornerRadius = weeklyDiscountView.frame.height / 9
        monthlyDiscountView.layer.cornerRadius = monthlyDiscountView.frame.height / 9
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
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func newListingPromotionSeletedButtonPressed(_ sender: UIButton) {
        
        // Toggle the state
        newListingPromotionisSelected.toggle()  // This flips the value of isSelected
        
        // Change the button's image based on the state
        if newListingPromotionisSelected {
            newListingPromotionButtonLabel.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            newListingPromotionButtonLabel.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        
    }
    
    @IBAction func weeklyDiscountSelectedButtonPressed(_ sender: UIButton) {
        
        // Toggle the state
        weeklyDiscountisSelected.toggle()  // This flips the value of isSelected
        
        // Change the button's image based on the state
        if weeklyDiscountisSelected {
            weeklyDiscountButtonLabel.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            weeklyDiscountButtonLabel.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        
    }
    
    @IBAction func monthlyDiscountSelectedButtonPressed(_ sender: UIButton) {
        
        // Toggle the state
        monthlyDisocuntisSelected.toggle()  // This flips the value of isSelected
        
        // Change the button's image based on the state
        if monthlyDisocuntisSelected {
            monthlyDiscountButtonLabel.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            monthlyDiscountButtonLabel.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        
    }
    
}

extension AddDiscountScreenViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideOutToLeftAnimator() // Use our custom animator for sliding out to the left
    }
    
}
