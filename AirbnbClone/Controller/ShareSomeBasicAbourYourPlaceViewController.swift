//
//  ShareSomeBasicAbourYourPlaceViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 24/01/2025.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ShareSomeBasicAbourYourPlaceViewController: UIViewController {
    
    @IBOutlet weak var saveAndExitButtonLabel: UIButton!
    @IBOutlet weak var questionsButtonLabel: UIButton!
    @IBOutlet weak var backButtonLabel: UIButton!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    @IBOutlet weak var numberofGuests: UILabel!
    @IBOutlet weak var numberOfBedrooms: UILabel!
    @IBOutlet weak var numberOfBeds: UILabel!
    @IBOutlet weak var numberOfBathrooms: UILabel!
    
    var currentGuests: Int = 0
    var currentBedrooms: Int = 0
    var currentBeds: Int = 0
    var currentBathrooms: Int = 0
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.transitioningDelegate = self
        
        setupInitialCount()
        setupCornerRadius()
        setupBorderWidth()
        setupButtonUnderline()
    }
    
    func setupInitialCount() {
        
        // Set the initial guest count
        numberofGuests.text = "\(currentGuests)"
        
        // Set the initial bedrooms count
        numberOfBedrooms.text = "\(currentBedrooms)"
        
        // Set the initial beds count
        numberOfBeds.text = "\(currentBeds)"
        
        // Set the initial bathrooms count
        numberOfBathrooms.text = "\(currentBathrooms)"
        
    }
    
    func setupCornerRadius() {
        saveAndExitButtonLabel.layer.cornerRadius = saveAndExitButtonLabel.frame.height / 2
        questionsButtonLabel.layer.cornerRadius = questionsButtonLabel.frame.height / 2
        nextButtonLabel.layer.cornerRadius = nextButtonLabel.frame.height / 5
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
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        if let userID = Auth.auth().currentUser?.uid {
            
            guard let listingID = UserDefaults.standard.string(forKey: "Listing ID") else {
                return
            }
            
            db.collection(K.HostYourPlaceCell.FStore.usersField)
                .document(userID)
                .collection(K.HostYourPlaceCell.FStore.ShareSomeBasicAboutYourPlace.shareSomeBasicAboutYourPlaceField)
                .document(listingID)
                .setData([
                    K.HostYourPlaceCell.FStore.userIDField : userID,
                    K.HostYourPlaceCell.FStore.ShareSomeBasicAboutYourPlace.numberOfGuestsField : currentGuests,
                    K.HostYourPlaceCell.FStore.ShareSomeBasicAboutYourPlace.numberOfBedroomsField : currentBedrooms,
                    K.HostYourPlaceCell.FStore.ShareSomeBasicAboutYourPlace.numberOfBedsField : currentBeds,
                    K.HostYourPlaceCell.FStore.ShareSomeBasicAboutYourPlace.numberOfBathroomsField : currentBathrooms,
                    K.HostYourPlaceCell.FStore.dateField : Date().timeIntervalSince1970,
                    K.HostYourPlaceCell.FStore.listingIDField: listingID // Store listing ID for easy reference
                ]) { error in
                    if let e = error {
                        print("There was an issue saving data to Firestore: \(e.localizedDescription)")
                    } else {
                        print("Successfully saved place description to Firestore.")
                        self.performSegue(withIdentifier: K.HostYourPlaceCell.Segues.shareSomeBasicAboutYourPlaceToMakeYourPlaceStandoutSegue, sender: self)
                    }
                }
            
        }
        
    }
    
    @IBAction func guestsButtons(_ sender: UIButton) {
        
        // Increase or decrease the guest count based on the tag
        if sender.tag == 1 {
            currentGuests += 1  // Add 1 guest
        } else if sender.tag == 2 {
            if currentGuests > 0 {
                currentGuests -= 1  // Subtract 1 guest (but not below 0)
            }
        }
        
        // Update the numberofGuests label
        numberofGuests.text = "\(currentGuests)"
        
    }
    
    @IBAction func bedroomsButtons(_ sender: UIButton) {
        
        // Increase or decrease the guest count based on the tag
        if sender.tag == 1 {
            currentBedrooms += 1  // Add 1 guest
        } else if sender.tag == 2 {
            if currentBedrooms > 0 {
                currentBedrooms -= 1  // Subtract 1 guest (but not below 0)
            }
        }
        
        // Update the numberofGuests label
        numberOfBedrooms.text = "\(currentBedrooms)"
        
    }
    
    @IBAction func bedsButtons(_ sender: UIButton) {
        
        // Increase or decrease the guest count based on the tag
        if sender.tag == 1 {
            currentBeds += 1  // Add 1 guest
        } else if sender.tag == 2 {
            if currentBeds > 0 {
                currentBeds -= 1  // Subtract 1 guest (but not below 0)
            }
        }
        
        // Update the numberofGuests label
        numberOfBeds.text = "\(currentBeds)"
        
    }
    
    @IBAction func bathroomsButtons(_ sender: UIButton) {
        
        // Increase or decrease the guest count based on the tag
        if sender.tag == 1 {
            currentBathrooms += 1  // Add 1 guest
        } else if sender.tag == 2 {
            if currentBathrooms > 0 {
                currentBathrooms -= 1  // Subtract 1 guest (but not below 0)
            }
        }
        
        // Update the numberofGuests label
        numberOfBathrooms.text = "\(currentBathrooms)"
        
    }
    
}

extension ShareSomeBasicAbourYourPlaceViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideOutToLeftAnimator() // Use our custom animator for sliding out to the left
    }
    
}
