//
//  PickYourBookingSettingsViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 27/01/2025.
//

import UIKit

class PickYourBookingSettingsViewController: UIViewController {
    
    @IBOutlet weak var saveAndExitButtonLabel: UIButton!
    @IBOutlet weak var questionsButtonLabel: UIButton!
    @IBOutlet weak var backButtonLabel: UIButton!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    @IBOutlet weak var youCanChangeThisLabel: UILabel!
    
    @IBOutlet weak var approvedYourBookingView: UIView!
    @IBOutlet weak var useInstantBookView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
        setupBorderWidth()
        setupButtonUnderline()
        setupLabelUnderline()
        
        self.transitioningDelegate = self
        
        approvedYourBookingView.layer.borderWidth = 2
        approvedYourBookingView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
    }
    
    func setupCornerRadius() {
        saveAndExitButtonLabel.layer.cornerRadius = saveAndExitButtonLabel.frame.height / 2
        questionsButtonLabel.layer.cornerRadius = questionsButtonLabel.frame.height / 2
        nextButtonLabel.layer.cornerRadius = nextButtonLabel.frame.height / 5
        
        approvedYourBookingView.layer.cornerRadius = approvedYourBookingView.frame.height / 10
        useInstantBookView.layer.cornerRadius = useInstantBookView.frame.height / 7
    }
    
    func setupBorderWidth() {
        saveAndExitButtonLabel.layer.borderWidth = 0.3
        questionsButtonLabel.layer.borderWidth = 0.3
        
        approvedYourBookingView.layer.borderWidth = 0.3
        useInstantBookView.layer.borderWidth = 0.3
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
        
        let fullText = "You can change this at any time. Learn more"
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
        youCanChangeThisLabel.attributedText = attributedString
        
        // Enable interaction on the label
        youCanChangeThisLabel.isUserInteractionEnabled = true
        
        // Add tap gesture recognizer to detect taps on the label
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        youCanChangeThisLabel.addGestureRecognizer(tapGesture)
        
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
    
    @IBAction func pickYourBookingSelectedButton(_ sender: UIButton) {
        
        print(sender.tag)
        
        resetViewStyles()
        
        switch sender.tag {
        case 1:
            approvedYourBookingView.layer.borderWidth = 2
            approvedYourBookingView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
            break
        case 2:
            useInstantBookView.layer.borderWidth = 2
            useInstantBookView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
            break
        default:
            break
        }
        
    }
    
    func resetViewStyles() {
        approvedYourBookingView.layer.borderWidth = 0.3
        approvedYourBookingView.backgroundColor = UIColor.white
        
        useInstantBookView.layer.borderWidth = 0.3
        useInstantBookView.backgroundColor = UIColor.white
    }

}

extension PickYourBookingSettingsViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideOutToLeftAnimator() // Use our custom animator for sliding out to the left
    }
    
}
