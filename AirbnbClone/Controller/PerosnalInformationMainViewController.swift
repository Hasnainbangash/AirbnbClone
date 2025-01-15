//
//  PerosnalInformationMainViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 15/01/2025.
//

import UIKit

class PerosnalInformationMainViewController: UIViewController {

    @IBOutlet weak var legalNameEditButtonLabel: UIButton!
    @IBOutlet weak var preferredFirstNameEditButtonLabel: UIButton!
    @IBOutlet weak var phoneNumberEditButtonLabel: UIButton!
    @IBOutlet weak var emailEditButtonLabel: UIButton!
    @IBOutlet weak var addressEditButtonLabel: UIButton!
    @IBOutlet weak var emergencyContactEditButtonLabel: UIButton!
    @IBOutlet weak var governmentIdEditButtonLabel: UIButton!
    
    
    @IBOutlet weak var legalNameCancelButtonLabel: UIButton!
    @IBOutlet weak var preferredFirstNameCancelButtonLabel: UIButton!
    @IBOutlet weak var emailCancelButtonLabel: UIButton!
    @IBOutlet weak var addressCancelButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupEditButtonUnderline()
        setupCancelButtonUnderline()
    }

}



// MARK: - ButtonUnderlineFunctions

extension PerosnalInformationMainViewController {
    
    func setupEditButtonUnderline() {
        let editbuttons = [
            legalNameEditButtonLabel,
            preferredFirstNameEditButtonLabel,
            phoneNumberEditButtonLabel,
            emailEditButtonLabel,
            addressEditButtonLabel,
            emergencyContactEditButtonLabel,
            governmentIdEditButtonLabel
        ]
        
        editbuttons.forEach { button in
            if let button = button {
                setupButtonUnderline(editButton: button)
            }
        }
    }
    
    func setupCancelButtonUnderline() {
        let cancelbuttons = [
            legalNameCancelButtonLabel,
            preferredFirstNameCancelButtonLabel,
            emailCancelButtonLabel,
            addressCancelButtonLabel,
        ]
        
        cancelbuttons.forEach { button in
            if let button = button {
                setupButtonUnderline(editButton: button)
            }
        }
    }
    
    func setupButtonUnderline(editButton: UIButton) {
        guard let buttonText = editButton.titleLabel?.text else {return}
        
        // Create an NSMutableAttributedString from the button's title text
        let attributedString = NSMutableAttributedString(string: buttonText)
        
        // Add underline attribute to the full text
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: buttonText.count))
        
        // Set the attributed text to the button's title
        editButton.setAttributedTitle(attributedString, for: .normal)
        
        // Optional: Change the text color (you can set any color you prefer)
        editButton.setTitleColor(UIColor.blue, for: .normal)
    }
    
}
