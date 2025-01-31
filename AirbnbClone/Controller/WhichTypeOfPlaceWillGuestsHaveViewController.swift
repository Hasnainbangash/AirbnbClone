//
//  WhichTypeOfPlaceWillGuestsHaveViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 23/01/2025.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class WhichTypeOfPlaceWillGuestsHaveViewController: UIViewController {
    
    @IBOutlet weak var saveAndExitButtonLabel: UIButton!
    @IBOutlet weak var questionsButtonLabel: UIButton!
    @IBOutlet weak var backButtonLabel: UIButton!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    @IBOutlet weak var entirePlaceView: UIView!
    @IBOutlet weak var entirePlaceNameLabel: UILabel!
    @IBOutlet weak var entirePlaceDescriptionLabel: UILabel!
    
    @IBOutlet weak var roomView: UIView!
    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var roomDescriptionLabel: UILabel!
    
    @IBOutlet weak var sharedRoomView: UIView!
    @IBOutlet weak var sharedRoomNameLabel: UILabel!
    @IBOutlet weak var shareRoomDescriptionLabel: UILabel!
    
    var typeOfPlaceName: String?
    var typeOfPlaceDescription: String?
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.transitioningDelegate = self
        
        setupCornerRadius()
        setupBorderWidth()
        setupButtonUnderline()
        
        entirePlaceView.layer.borderWidth = 2
        entirePlaceView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        typeOfPlaceName = entirePlaceNameLabel.text
        typeOfPlaceDescription = entirePlaceDescriptionLabel.text
    }
    
    func setupCornerRadius() {
        saveAndExitButtonLabel.layer.cornerRadius = saveAndExitButtonLabel.frame.height / 2
        questionsButtonLabel.layer.cornerRadius = questionsButtonLabel.frame.height / 2
        nextButtonLabel.layer.cornerRadius = nextButtonLabel.frame.height / 5
        
        entirePlaceView.layer.cornerRadius = entirePlaceView.frame.height / 7
        roomView.layer.cornerRadius = roomView.frame.height / 7
        sharedRoomView.layer.cornerRadius = sharedRoomView.frame.height / 7
    }
    
    func setupBorderWidth() {
        saveAndExitButtonLabel.layer.borderWidth = 0.3
        questionsButtonLabel.layer.borderWidth = 0.3
        
        entirePlaceView.layer.borderWidth = 0.3
        roomView.layer.borderWidth = 0.3
        sharedRoomView.layer.borderWidth = 0.3
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
        print("Next button pressed")
        
        if let userID = Auth.auth().currentUser?.uid, let placeName = typeOfPlaceName, let placeDescription = typeOfPlaceDescription {
    
            guard let listingID = UserDefaults.standard.string(forKey: "Listing ID") else {
                return
            }
            
            print(listingID)
            
            db.collection(K.HostYourPlaceCell.FStore.postsField)
                .document(userID)
                .collection(K.HostYourPlaceCell.FStore.WhichTypeOfplaceWillGuestHave.placeTypeDescriptionField)
                .document(listingID)  // Use the unique listing ID
                .setData([
                    K.HostYourPlaceCell.FStore.userIDField : userID,
                    K.HostYourPlaceCell.FStore.WhichTypeOfplaceWillGuestHave.placeNameField : placeName,
                    K.HostYourPlaceCell.FStore.WhichTypeOfplaceWillGuestHave.placeDescriptionField : placeDescription,
                    K.HostYourPlaceCell.FStore.dateField : Date().timeIntervalSince1970,
                    K.HostYourPlaceCell.FStore.listingIDField: listingID // Store listing ID for easy reference
                ]) { error in
                    if let e = error {
                        print("There was an issue saving data to Firestore: \(e.localizedDescription)")
                    } else {
                        print("Successfully saved place description to Firestore.")
                        self.performSegue(withIdentifier: K.HostYourPlaceCell.Segues.whichTypeOfPlaceGuestHaveSegueToWhereYourPlaceLocatedSegue, sender: self)
                    }
                }
        }
        
    }
    
    @IBAction func typeOfPlaceSelectedButton(_ sender: UIButton) {
        
        print(sender.tag)
        
        resetViewStyles()
        
        switch sender.tag {
        case 1:
            entirePlaceView.layer.borderWidth = 2
            entirePlaceView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
            typeOfPlaceName = entirePlaceNameLabel.text
            typeOfPlaceDescription = entirePlaceDescriptionLabel.text
            break
        case 2:
            roomView.layer.borderWidth = 2
            roomView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
            typeOfPlaceName = roomNameLabel.text
            typeOfPlaceDescription = roomDescriptionLabel.text
            break
        case 3:
            sharedRoomView.layer.borderWidth = 2
            sharedRoomView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
            typeOfPlaceName = sharedRoomNameLabel.text
            typeOfPlaceDescription = shareRoomDescriptionLabel.text
            break
        default:
            break
        }
        
    }
    
    func resetViewStyles() {
        
        typeOfPlaceName = ""
        typeOfPlaceDescription = ""
        
        entirePlaceView.layer.borderWidth = 0.3
        entirePlaceView.backgroundColor = UIColor.white
        
        roomView.layer.borderWidth = 0.3
        roomView.backgroundColor = UIColor.white
        
        sharedRoomView.layer.borderWidth = 0.3
        sharedRoomView.backgroundColor = UIColor.white
    }
    
}

extension WhichTypeOfPlaceWillGuestsHaveViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideOutToLeftAnimator() // Use our custom animator for sliding out to the left
    }
    
}
