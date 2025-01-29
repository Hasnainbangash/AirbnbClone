//
//  SmsCodeScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 28/01/2025.
//

import UIKit
import FirebaseAuth

class SmsCodeScreenViewController: UIViewController {

    @IBOutlet weak var sendAgainButtonLabel: UIButton!
    @IBOutlet weak var moreOptionsButtonLabel: UIButton!
    @IBOutlet weak var continueButtonLabel: UIButton!
    @IBOutlet weak var smsCodeTextField: UITextField!
    
    var verificationID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Retrieving the verificationID from UserDefaults
        verificationID = UserDefaults.standard.string(forKey: K.LoginAndSignupScreen.FStore.authVerificationId)
        
        setupCornerRadius()
        setupButtonUnderline()
    }
    
    func setupCornerRadius() {
        continueButtonLabel.layer.cornerRadius = continueButtonLabel.frame.height / 5
    }
    
    func setupButtonUnderline() {
        
        // For send again button
        guard let sendAgainbuttonText = sendAgainButtonLabel.titleLabel?.text else {return}
        
        // Create an NSMutableAttributedString from the button's title text
        let sendAgainAttributedString = NSMutableAttributedString(string: sendAgainbuttonText)
        
        // Add underline attribute to the full text
        sendAgainAttributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: sendAgainbuttonText.count))
        
        // Set the attributed text to the button's title
        sendAgainButtonLabel.setAttributedTitle(sendAgainAttributedString, for: .normal)
        
        // Optional: Change the text color (you can set any color you prefer)
        sendAgainButtonLabel.setTitleColor(UIColor.black, for: .normal)
        
        // For more options button
        guard let moreOptionbuttonText = moreOptionsButtonLabel.titleLabel?.text else {return}
        
        // Create an NSMutableAttributedString from the button's title text
        let moreOptionAttributedString = NSMutableAttributedString(string: moreOptionbuttonText)
        
        // Add underline attribute to the full text
        moreOptionAttributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: moreOptionbuttonText.count))
        
        // Set the attributed text to the button's title
        moreOptionsButtonLabel.setAttributedTitle(moreOptionAttributedString, for: .normal)
        
        // Optional: Change the text color (you can set any color you prefer)
        moreOptionsButtonLabel.setTitleColor(UIColor.black, for: .normal)

    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendAgainCodeButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        if let verificationCode = smsCodeTextField.text, !verificationCode.isEmpty, let verificationID = verificationID {
            
            print("Verification ID is \(verificationID)")
            
            // Use the verificationID and verificationCode to create credentials
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Login is failed due to error \(error.localizedDescription)")
                } else {
                    print("Login get successfull")
                    self.performSegue(withIdentifier: K.LoginAndSignupScreen.Segues.smsCodeToExploreMainScreenSegue, sender: self)
                }

            }

        }
        
    }
    
}
