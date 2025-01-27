//
//  ShareSafetyDetailsScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 27/01/2025.
//

import UIKit

class ShareSafetyDetailsScreenViewController: UIViewController {
    
    @IBOutlet weak var saveAndExitButtonLabel: UIButton!
    @IBOutlet weak var questionsButtonLabel: UIButton!
    @IBOutlet weak var backButtonLabel: UIButton!
    @IBOutlet weak var createListingButtonLabel: UIButton!
    
    @IBOutlet weak var exteriorSecurityButtonLabel: UIButton!
    @IBOutlet weak var noiseDecibelButtonLabel: UIButton!
    @IBOutlet weak var weaponsButtonLabel: UIButton!
    
    var exteriorSecurityisSelected = false
    var noiseDecibelisSelected = false
    var weaponsisSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
        setupBorderWidth()
        setupButtonUnderline()
        
        exteriorSecurityButtonLabel.setImage(UIImage(systemName: "square"), for: .normal)
        noiseDecibelButtonLabel.setImage(UIImage(systemName: "square"), for: .normal)
        weaponsButtonLabel.setImage(UIImage(systemName: "square"), for: .normal)
    }
    
    func setupCornerRadius() {
        saveAndExitButtonLabel.layer.cornerRadius = saveAndExitButtonLabel.frame.height / 2
        questionsButtonLabel.layer.cornerRadius = questionsButtonLabel.frame.height / 2
        createListingButtonLabel.layer.cornerRadius = createListingButtonLabel.frame.height / 5
    }
    
    func setupBorderWidth() {
        saveAndExitButtonLabel.layer.borderWidth = 0.3
        questionsButtonLabel.layer.borderWidth = 0.3
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

    
    @IBAction func exteriorSecurityButtonPressed(_ sender: UIButton) {
        
        // Toggle the state
        exteriorSecurityisSelected.toggle()  // This flips the value of isSelected
        
        // Change the button's image based on the state
        if exteriorSecurityisSelected {
            exteriorSecurityButtonLabel.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            exteriorSecurityButtonLabel.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        
    }
    

    @IBAction func noiseDecibelButtonPressed(_ sender: UIButton) {
        
        // Toggle the state
        noiseDecibelisSelected.toggle()  // This flips the value of isSelected
        
        // Change the button's image based on the state
        if noiseDecibelisSelected {
            noiseDecibelButtonLabel.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            noiseDecibelButtonLabel.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        
    }
    
    @IBAction func weaponsButtonPressed(_ sender: UIButton) {
        
        // Toggle the state
        weaponsisSelected.toggle()  // This flips the value of isSelected
        
        // Change the button's image based on the state
        if weaponsisSelected {
            weaponsButtonLabel.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            weaponsButtonLabel.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        
    }
    
}
