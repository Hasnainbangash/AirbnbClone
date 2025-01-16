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
    
    private var mainStackViews: [UIStackView] = []
    private var blurViews: [UIVisualEffectView] = []
    
    private var blurEffectView: UIVisualEffectView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setupMainStackViews()
        hideEditableStackViews()
        setupCornerRadius()
        setupBorderRadius()
        setupEditButtonUnderline()
        setupCancelButtonUnderline()
        setupBlurEffects()
    }
    
    private func setupMainStackViews() {
        mainStackViews = [
            legalNameStackView,
            preferredNameStackView,
            phoneNumberStackView,
            emailStackView,
            addressStackView,
            emergencyContactStackView,
            governmentIdStackView
        ].compactMap { $0 }
    }
    
    private func setupBlurEffects() {
        // Create blur effect for each main stack view
        for stackView in mainStackViews {
            let blurEffect = UIVisualEffectView(effect: UIBlurEffect(style: .light))
            blurEffect.frame = stackView.bounds
            blurEffect.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            blurEffect.isHidden = true
            blurEffect.alpha = 0.5
            stackView.addSubview(blurEffect)
            blurViews.append(blurEffect)
        }
    }
    
    private func enableEditMode(for activeStackView: UIStackView) {
        // Disable and blur all stack views except the active one
        for (index, stackView) in mainStackViews.enumerated() {
            if stackView != activeStackView {
                stackView.isUserInteractionEnabled = false
                blurViews[index].isHidden = false
            }
        }
    }
    
    private func disableEditMode() {
        // Enable all stack views and hide all blur effects
        mainStackViews.forEach { $0.isUserInteractionEnabled = true }
        blurViews.forEach { $0.isHidden = true }
    }
    
    private func hideEditableStackViews() {
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
            enableEditMode(for: legalNameStackView)
            break
        case "Cancel":
            legalNameSimpleStackView.isHidden = false
            legalNameEditableStackView.isHidden = true
            disableEditMode()
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
            enableEditMode(for: preferredNameStackView)
            break
        case "Cancel":
            preferredNameSimpleStackView.isHidden = false
            preferredNameEditableStackView.isHidden = true
            disableEditMode()
            break
        default:
            break
        }
        
    }
    
    /*
    func addBlurEffect() {
        // Remove existing blur if any
        removeBlurEffect()
        
        // Create and add new blur effect
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(blurEffectView)
        self.blurEffectView = blurEffectView
    }
    
    func removeBlurEffect() {
        blurEffectView?.removeFromSuperview()
        blurEffectView = nil
    }
    
    @IBAction func phoneNumberButton(_ sender: UIButton) {
        // Add blur effect before presenting the sheet
        addBlurEffect()
        
        // Get reference to storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate from storyboard
        if let vc = storyboard.instantiateViewController(withIdentifier: "AddPhoneNumberViewController") as? AddPhoneNumberViewController {
            // Initialize Navigation Controller with the second screen
            let navVC = UINavigationController(rootViewController: vc)
            
            // Make sure the navigation bar is hidden when presenting the bottom sheet
            navVC.setNavigationBarHidden(true, animated: false)
            
            // Configure the bottom sheet presentation controller
            if let sheet = navVC.sheetPresentationController {
                sheet.detents = [
                    .custom(resolver: { context in
                        0.6 * context.maximumDetentValue
                    }),
                    .large()
                ]
                
                sheet.preferredCornerRadius = 20
                sheet.prefersEdgeAttachedInCompactHeight = true
                sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                sheet.largestUndimmedDetentIdentifier = .large
                
                // Add delegate to handle dismissal
                navVC.presentationController?.delegate = self
            }
            
            // Present the navigation controller with the bottom sheet
            present(navVC, animated: true)
        }
    }
    
     */
    
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
            enableEditMode(for: emailStackView)
            break
        case "Cancel":
            emailSimpleStackView.isHidden = false
            emailEditableStackView.isHidden = true
            disableEditMode()
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
            enableEditMode(for: addressStackView)
            break
        case "Cancel":
            addressSimpleStackView.isHidden = false
            addressEditableStackView.isHidden = true
            disableEditMode()
            break
        default:
            break
        }
        
    }
    
}

// MARK: - UIAdaptivePresentationControllerDelegate
extension PerosnalInformationMainViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        // Remove blur effect when sheet is dismissed
        removeBlurEffect()
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
