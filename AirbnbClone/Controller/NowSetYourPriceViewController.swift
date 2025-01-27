//
//  NowSetYourPriceViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 27/01/2025.
//

import UIKit

class NowSetYourPriceViewController: UIViewController {
    
    @IBOutlet weak var saveAndExitButtonLabel: UIButton!
    @IBOutlet weak var questionsButtonLabel: UIButton!
    @IBOutlet weak var backButtonLabel: UIButton!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    @IBOutlet weak var guestPriceMainView: UIView!
    @IBOutlet weak var guestPriceSubView: UIView!
    
    @IBOutlet weak var youEarnMainView: UIView!
    @IBOutlet weak var youEarnSubView: UIView!
    
    @IBOutlet weak var similarListingView: UIView!
    @IBOutlet weak var learnMoreAboutPricingButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
        setupBorderWidth()
        setupButtonUnderline()
    }
    
    func setupCornerRadius() {
        saveAndExitButtonLabel.layer.cornerRadius = saveAndExitButtonLabel.frame.height / 2
        questionsButtonLabel.layer.cornerRadius = questionsButtonLabel.frame.height / 2
        nextButtonLabel.layer.cornerRadius = nextButtonLabel.frame.height / 5
        
        guestPriceMainView.layer.cornerRadius = guestPriceMainView.frame.height / 5
        guestPriceSubView.layer.cornerRadius = guestPriceSubView.frame.height / 7
        
        youEarnMainView.layer.cornerRadius = youEarnMainView.frame.height / 5
        youEarnSubView.layer.cornerRadius = youEarnSubView.frame.height / 7

    }
    
    func setupBorderWidth() {
        saveAndExitButtonLabel.layer.borderWidth = 0.3
        questionsButtonLabel.layer.borderWidth = 0.3
        
        guestPriceMainView.layer.borderWidth = 0.3
        guestPriceSubView.layer.borderWidth = 0.3
        
        youEarnMainView.layer.borderWidth = 0.3
        youEarnSubView.layer.borderWidth = 0.3
        
    }
    
    func setupButtonUnderline() {
        // For back button
        guard let backButtonText = backButtonLabel.titleLabel?.text else {return}
        
        // Create an NSMutableAttributedString from the button's title text
        let backAttributedString = NSMutableAttributedString(string: backButtonText)
        
        // Add underline attribute to the full text
        backAttributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: backButtonText.count))
        
        // Set the attributed text to the button's title
        backButtonLabel.setAttributedTitle(backAttributedString, for: .normal)
        
        // Optional: Change the text color (you can set any color you prefer)
        backButtonLabel.setTitleColor(UIColor.black, for: .normal)
        
        // For Learn more about pricing button
        guard let learnAboutPricingButtonText = backButtonLabel.titleLabel?.text else {return}
        
        // Create an NSMutableAttributedString from the button's title text
        let pricingAttributedString = NSMutableAttributedString(string: learnAboutPricingButtonText)
        
        // Add underline attribute to the full text
        pricingAttributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: learnAboutPricingButtonText.count))
        
        // Set the attributed text to the button's title
        backButtonLabel.setAttributedTitle(pricingAttributedString, for: .normal)
        
        // Optional: Change the text color (you can set any color you prefer)
        backButtonLabel.setTitleColor(UIColor.black, for: .normal)
    }
    
}
