//
//  PerosnalInformationMainViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 15/01/2025.
//

import UIKit

class PerosnalInformationMainViewController: UIViewController {
    
    // Edit Buttons IBOutlet
    @IBOutlet weak var legalNameEditButtonLabel: UIButton!
    @IBOutlet weak var preferredFirstNameEditButtonLabel: UIButton!
    @IBOutlet weak var phoneNumberEditButtonLabel: UIButton!
    @IBOutlet weak var emailEditButtonLabel: UIButton!
    @IBOutlet weak var addressEditButtonLabel: UIButton!
    @IBOutlet weak var emergencyContactEditButtonLabel: UIButton!
    @IBOutlet weak var governmentIdEditButtonLabel: UIButton!
    
    // Cancel Buttons IBOutlet
    @IBOutlet weak var legalNameCancelButtonLabel: UIButton!
    @IBOutlet weak var preferredFirstNameCancelButtonLabel: UIButton!
    @IBOutlet weak var emailCancelButtonLabel: UIButton!
    @IBOutlet weak var addressCancelButtonLabel: UIButton!
    
    // Views IBOutlet
    @IBOutlet weak var firstNameView: UIView!
    @IBOutlet weak var surnameView: UIView!
    @IBOutlet weak var preferredFirstNameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var addressAndRegionView: UIView!
    @IBOutlet weak var streetView: UIView!
    @IBOutlet weak var flatSuiteView: UIView!
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var postCodeView: UIView!
    
    // Save and continue button IBOutlet
    @IBOutlet weak var legalNameContinueAndSaveButtonLabel: UIButton!
    @IBOutlet weak var preferredFirstNameContinueAndSaveButtonLabel: UIButton!
    @IBOutlet weak var emailContinueAndSaveButtonLabel: UIButton!
    @IBOutlet weak var addressContinueAndSaveButtonLabel: UIButton!
    
    // Stack views IBOutlet
    
    @IBOutlet weak var legalNameStackView: UIStackView!
    @IBOutlet weak var legalNameSimpleStackView: UIStackView!
    @IBOutlet weak var legalNameEditableStackView: UIStackView!
    
    @IBOutlet weak var preferredNameStackView: UIStackView!
    @IBOutlet weak var preferredNameSimpleStackView: UIStackView!
    @IBOutlet weak var preferredNameEditableStackView: UIStackView!
    
    @IBOutlet weak var phoneNumberStackView: UIStackView!
    
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var emailSimpleStackView: UIStackView!
    @IBOutlet weak var emailEditableStackView: UIStackView!
    
    @IBOutlet weak var addressStackView: UIStackView!
    @IBOutlet weak var addressSimpleStackView: UIStackView!
    @IBOutlet weak var addressEditableStackView: UIStackView!
    
    @IBOutlet weak var emergencyContactStackView: UIStackView!
    
    @IBOutlet weak var governmentIdStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        hideEditableStackViews()
        
        setupCornerRadius()
        setupBorderRadius()
        setupEditButtonUnderline()
        setupCancelButtonUnderline()
    }
    
    func hideEditableStackViews() {
        legalNameEditableStackView.isHidden = true
        preferredNameEditableStackView.isHidden = true
        emailEditableStackView.isHidden = true
        addressEditableStackView.isHidden = true
    }
    
    @IBAction func legalNameButton(_ sender: UIButton) {
        
        guard let buttonTitle = sender.titleLabel?.text else {
            print(sender.titleLabel?.text ?? "No title")
            return
        }

        print(buttonTitle)
        
        switch buttonTitle {
        case "Edit":
            legalNameSimpleStackView.isHidden = true
            legalNameEditableStackView.isHidden = false
            break
        case "Cancel":
            legalNameSimpleStackView.isHidden = false
            legalNameEditableStackView.isHidden = true
            break
        default:
            break
        }
        
    }
    
    
    @IBAction func preferredFirstNameButton(_ sender: UIButton) {
        
        guard let buttonTitle = sender.titleLabel?.text else {
            print(sender.titleLabel?.text ?? "No title")
            return
        }

        print(buttonTitle)
        switch buttonTitle {
        case "Edit":
            preferredNameSimpleStackView.isHidden = true
            preferredNameEditableStackView.isHidden = false
            break
        case "Cancel":
            preferredNameSimpleStackView.isHidden = false
            preferredNameEditableStackView.isHidden = true
            break
        default:
            break
        }
        
    }
    
    
    @IBAction func emailButton(_ sender: UIButton) {
        
        guard let buttonTitle = sender.titleLabel?.text else {
            print(sender.titleLabel?.text ?? "No title")
            return
        }

        print(buttonTitle)
        switch buttonTitle {
        case "Edit":
            emailSimpleStackView.isHidden = true
            emailEditableStackView.isHidden = false
            break
        case "Cancel":
            emailSimpleStackView.isHidden = false
            emailEditableStackView.isHidden = true
            break
        default:
            break
        }
        
    }
    
    @IBAction func addressButton(_ sender: UIButton) {
        
        guard let buttonTitle = sender.titleLabel?.text else {
            print(sender.titleLabel?.text ?? "No title")
            return
        }

        print(buttonTitle)
        switch buttonTitle {
        case "Edit":
            addressSimpleStackView.isHidden = true
            addressEditableStackView.isHidden = false
            break
        case "Cancel":
            addressSimpleStackView.isHidden = false
            addressEditableStackView.isHidden = true
            break
        default:
            break
        }
        
    }
    
    func resetStackViews() {
        
        legalNameSimpleStackView.isHidden = false
        legalNameEditableStackView.isHidden = false
        
        preferredNameSimpleStackView.isHidden = false
        preferredNameEditableStackView.isHidden = false
        
        emailSimpleStackView.isHidden = false
        emailEditableStackView.isHidden = false
        
        addressSimpleStackView.isHidden = false
        addressEditableStackView.isHidden = false
        
    }
    
    
}

// MARK: - setupCornerRadius and setupBoderRadius

extension PerosnalInformationMainViewController {
    
    func setupCornerRadius() {
        // Setting corning radius of text field views
        firstNameView.layer.cornerRadius = firstNameView.frame.height / 8
        surnameView.layer.cornerRadius = surnameView.frame.height / 8
        preferredFirstNameView.layer.cornerRadius = preferredFirstNameView.frame.height / 8
        emailView.layer.cornerRadius = emailView.frame.height / 8
        addressAndRegionView.layer.cornerRadius = addressAndRegionView.frame.height / 8
        streetView.layer.cornerRadius = streetView.frame.height / 8
        flatSuiteView.layer.cornerRadius = flatSuiteView.frame.height / 8
        cityView.layer.cornerRadius = cityView.frame.height / 8
        countryView.layer.cornerRadius = countryView.frame.height / 8
        postCodeView.layer.cornerRadius = postCodeView.frame.height / 8
        
        // Corning radius of continue and save buttons
        legalNameContinueAndSaveButtonLabel.layer.cornerRadius = legalNameContinueAndSaveButtonLabel.frame.height / 5
        preferredFirstNameContinueAndSaveButtonLabel.layer.cornerRadius = preferredFirstNameContinueAndSaveButtonLabel.frame.height / 5
        emailContinueAndSaveButtonLabel.layer.cornerRadius = emailContinueAndSaveButtonLabel.frame.height / 5
        addressContinueAndSaveButtonLabel.layer.cornerRadius = addressContinueAndSaveButtonLabel.frame.height / 5
    }
    
    func setupBorderRadius() {
        // Setting border radius of text field views
        firstNameView.layer.borderWidth = 0.5
        surnameView.layer.borderWidth = 0.5
        preferredFirstNameView.layer.borderWidth = 0.5
        emailView.layer.borderWidth = 0.5
        addressAndRegionView.layer.borderWidth = 0.5
        streetView.layer.borderWidth = 0.5
        flatSuiteView.layer.borderWidth = 0.5
        cityView.layer.borderWidth = 0.5
        countryView.layer.borderWidth = 0.5
        postCodeView.layer.borderWidth = 0.5
    }
    
}

// MARK: - buttonUnderlineFunctions

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
