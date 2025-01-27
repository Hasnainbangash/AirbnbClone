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
    
    @IBOutlet weak var guestPricesBeforeTaxesStackView: UIStackView!
    
    @IBOutlet weak var allPricesStackView: UIStackView!
    
    @IBOutlet weak var guestPriceMainView: UIView!
    @IBOutlet weak var guestPriceSubView: UIView!
    
    @IBOutlet weak var guestPriceMainStackView: UIStackView!
    @IBOutlet weak var guestPriceSubStackView: UIStackView!
    
    @IBOutlet weak var youEarnMainView: UIView!
    @IBOutlet weak var youEarnSubView: UIView!
    
    @IBOutlet weak var youEarnMainStackView: UIStackView!
    @IBOutlet weak var youEarnSubStackView: UIStackView!
    
    @IBOutlet weak var similarListingView: UIView!
    @IBOutlet weak var learnMoreAboutPricingButtonLabel: UIButton!
    
    @IBOutlet weak var similarListingStackView: UIStackView!
    
    @IBOutlet weak var showLessStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
        setupBorderWidth()
        setupButtonUnderline()
        
        allPricesStackView.isHidden = true
        guestPriceMainStackView.isHidden = true
        youEarnSubStackView.isHidden = true
    }
    
    func setupCornerRadius() {
        saveAndExitButtonLabel.layer.cornerRadius = saveAndExitButtonLabel.frame.height / 2
        questionsButtonLabel.layer.cornerRadius = questionsButtonLabel.frame.height / 2
        nextButtonLabel.layer.cornerRadius = nextButtonLabel.frame.height / 5
        
        guestPriceMainView.layer.cornerRadius = guestPriceMainView.frame.height / 5
        guestPriceSubView.layer.cornerRadius = guestPriceSubView.frame.height / 9
        
        youEarnMainView.layer.cornerRadius = youEarnMainView.frame.height / 5
        youEarnSubView.layer.cornerRadius = youEarnSubView.frame.height / 9
        
        similarListingView.layer.cornerRadius = similarListingView.frame.height / 2

    }
    
    func setupBorderWidth() {
        saveAndExitButtonLabel.layer.borderWidth = 0.3
        questionsButtonLabel.layer.borderWidth = 0.3
        
        guestPriceMainView.layer.borderWidth = 0.3
        guestPriceSubView.layer.borderWidth = 1.0
        
        youEarnMainView.layer.borderWidth = 0.3
        youEarnSubView.layer.borderWidth = 1.0
        
        similarListingView.layer.borderWidth = 0.3
        
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
    
    
    @IBAction func showPricesButtonPressed(_ sender: UIButton) {
        
        allPricesStackView.isHidden = false
        guestPricesBeforeTaxesStackView.isHidden = true
        showLessStackView.isHidden = false
        similarListingStackView.isHidden = true
        
    }
    
    
    @IBAction func showLessButtonPressed(_ sender: UIButton) {
        
        showLessStackView.isHidden = true
        allPricesStackView.isHidden = true
        guestPricesBeforeTaxesStackView.isHidden = false
        similarListingStackView.isHidden = false
        
    }
    
    @IBAction func guestPriceMainViewButtonPressed(_ sender: UIButton) {
        
        guestPriceMainStackView.isHidden = true
        guestPriceSubStackView.isHidden = false
        
        youEarnMainStackView.isHidden = false
        youEarnSubStackView.isHidden = true
        
    }
    
    @IBAction func youEarnMainViewButtonPressed(_ sender: UIButton) {
        
        youEarnMainStackView.isHidden = true
        youEarnSubStackView.isHidden = false
        
        guestPriceMainStackView.isHidden = false
        guestPriceSubStackView.isHidden = true
        
    }
    
}
