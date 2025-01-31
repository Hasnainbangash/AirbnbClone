//
//  CreateYourDescriptionViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 24/01/2025.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class CreateYourDescriptionViewController: UIViewController {

    @IBOutlet weak var saveAndExitButtonLabel: UIButton!
    @IBOutlet weak var questionsButtonLabel: UIButton!
    @IBOutlet weak var backButtonLabel: UIButton!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    @IBOutlet weak var textFieldView: UITextView!
    @IBOutlet weak var charactersAvailableCount: UILabel!
    
    let db = Firestore.firestore()
    
    let maxCharacterLimit = 500
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.transitioningDelegate = self
        
        textFieldView.delegate = self

        setupCornerRadius()
        setupBorderWidth()
        setupButtonUnderline()
    }
    
    func setupCornerRadius() {
        saveAndExitButtonLabel.layer.cornerRadius = saveAndExitButtonLabel.frame.height / 2
        questionsButtonLabel.layer.cornerRadius = questionsButtonLabel.frame.height / 2
        nextButtonLabel.layer.cornerRadius = nextButtonLabel.frame.height / 5
        
        textFieldView.layer.cornerRadius = textFieldView.frame.height / 9
    }
    
    func setupBorderWidth() {
        saveAndExitButtonLabel.layer.borderWidth = 0.3
        questionsButtonLabel.layer.borderWidth = 0.3
        
        textFieldView.layer.borderWidth = 1.5
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

    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        if let userID = Auth.auth().currentUser?.uid, let placeDescription = textFieldView.text {
            
            guard let listingID = UserDefaults.standard.string(forKey: "Listing ID") else {
                return
            }
            
            db.collection(K.HostYourPlaceCell.FStore.postsField)
                .document(userID)
                .collection(K.HostYourPlaceCell.FStore.CreateYourDescription.createYourDescriptionField)
                .document(listingID)
                .setData([
                    K.HostYourPlaceCell.FStore.userIDField : userID,
                    K.HostYourPlaceCell.FStore.CreateYourDescription.placeDescriptionField: placeDescription,
                    K.HostYourPlaceCell.FStore.dateField : Date().timeIntervalSince1970,
                    K.HostYourPlaceCell.FStore.listingIDField: listingID // Store listing ID for easy reference
                ]) { error in
                    if let e = error {
                        print("There was an issue saving data to Firestore: \(e.localizedDescription)")
                    } else {
                        print("Successfully saved your place description to Firestore.")
                        self.performSegue(withIdentifier: K.HostYourPlaceCell.Segues.createYourDescriptionToFinishUpAndPublishSegue, sender: self)
                    }
                }
            
        }
        
    }
    
}

extension CreateYourDescriptionViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideOutToLeftAnimator() // Use our custom animator for sliding out to the left
    }
    
}

extension CreateYourDescriptionViewController: UITextViewDelegate {
    
    func updateCharacterCount() {
        let currentText = textFieldView.text ?? ""
        let charactersLeft = maxCharacterLimit - currentText.count
        
        // Update character count label
        charactersAvailableCount.text = "\(charactersLeft)"
        
        // Enable/disable next button based on the character count
        updateNextButtonState()
    }
    
    func updateNextButtonState() {
        let currentText = textFieldView.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        if currentText.isEmpty || currentText.count > maxCharacterLimit {
            nextButtonLabel.isEnabled = false
            nextButtonLabel.backgroundColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)
            nextButtonLabel.tintColor = UIColor.white
        } else {
            nextButtonLabel.isEnabled = true
            nextButtonLabel.backgroundColor = UIColor.black
            nextButtonLabel.tintColor = UIColor.white
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let currentText = textView.text ?? ""
        
        // If the current text exceeds the max limit, truncate it
        if currentText.count > maxCharacterLimit {
            textView.text = String(currentText.prefix(maxCharacterLimit))
        }
        
        // Update character count
        updateCharacterCount()
    }
}
