//
//  ViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 07/01/2025.
//

import UIKit
import CountryPickerView
import FirebaseAuth

class LoginAndSignupToAirbnbScreenViewController: UIViewController {

    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var emailButtonView: UIView!
    @IBOutlet weak var facebookButtonView: UIView!
    @IBOutlet weak var googleButtonView: UIView!
    @IBOutlet weak var appleButtonView: UIView!
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    let countryPickerView = CountryPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countryPickerView.delegate = self
        countryPickerView.isHidden = false
        
        countryNameLabel.text = ""
        
        setupCornerRadius()
        setupBorderWidth()
        
        // Add CountryPickerView as a subview and set its constraints
        view.addSubview(countryPickerView)
        countryPickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countryPickerView.leadingAnchor.constraint(equalTo: countryNameLabel.leadingAnchor),
            countryPickerView.trailingAnchor.constraint(equalTo: countryNameLabel.trailingAnchor),
            countryPickerView.bottomAnchor.constraint(equalTo: countryNameLabel.bottomAnchor),
            countryPickerView.heightAnchor.constraint(equalToConstant: countryNameLabel.frame.height) // Adjust height as needed
        ])
        
    }
    
    func setupCornerRadius() {
        phoneNumberView.layer.cornerRadius = phoneNumberView.frame.height / 9
        continueButton.layer.cornerRadius = continueButton.frame.height / 5
        emailButtonView.layer.cornerRadius = emailButtonView.frame.height / 5
        facebookButtonView.layer.cornerRadius = facebookButtonView.frame.height / 5
        googleButtonView.layer.cornerRadius = googleButtonView.frame.height / 5
        appleButtonView.layer.cornerRadius = appleButtonView.frame.height / 5
    }
    
    func setupBorderWidth() {
        phoneNumberView.layer.borderWidth = 0.7
        emailButtonView.layer.borderWidth = 1.0
        facebookButtonView.layer.borderWidth = 1.0
        googleButtonView.layer.borderWidth = 1.0
        appleButtonView.layer.borderWidth = 1.0
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        if let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty, let countryCode = countryCodeLabel.text, !countryCode.isEmpty {
            
            let phoneNumberWithCountryCode = countryCode + phoneNumber
            
            PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumberWithCountryCode, uiDelegate: nil) { verificationID, error in
                  if let error = error {
                      print("Error occured")
                      print(error.localizedDescription)
                  } else {
                      // Sign in using the verificationID and the code sent to the user
                      
                      print("Phone vaification is cucceesful moving to next screne now")
                      // Storing the verificationID in UserDefaults
                      UserDefaults.standard.set(verificationID, forKey: K.LoginAndSignupScreen.FStore.authVerificationId)
                      
                      self.performSegue(withIdentifier: K.LoginAndSignupScreen.Segues.loginSingupToSmsCodeScreenSegue, sender: self)
                      
                  }
              }
            
            
        }
    }
    
}

extension LoginAndSignupToAirbnbScreenViewController: CountryPickerViewDelegate {
    
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        
        // Get the phone code
        let phoneCode = country.phoneCode
        
        // Check if the phone code already contains the '+' sign
        if phoneCode.hasPrefix("+") {
            countryCodeLabel.text = phoneCode
        } else {
            // Add the '+' sign manually if it doesn't already exist
            countryCodeLabel.text = "+" + phoneCode
        }
        
        // Optionally, update the country name label if needed
        // countryNameLabel.text = country.name
        
        // Hide the picker when a country is selected
//        countryPickerView.isHidden = true
        
    }
    
}
