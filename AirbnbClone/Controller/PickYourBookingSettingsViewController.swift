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
    
    @IBOutlet weak var approvedYourBookingView: UIView!
    @IBOutlet weak var useInstantBookView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
        setupBorderWidth()
        setupButtonUnderline()
        
        approvedYourBookingView.layer.borderWidth = 2
        useInstantBookView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
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
