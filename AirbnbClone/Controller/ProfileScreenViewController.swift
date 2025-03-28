//
//  ProfileScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 08/01/2025.
//

import UIKit
import FirebaseAuth

class ProfileScreenViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var yourHomeView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupCornerRadius()
        setupBorderWidth()
        setupBorderShadow()
    }
    
    func setupCornerRadius() {
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        yourHomeView.layer.cornerRadius = yourHomeView.frame.height / 7
    }
    
    func setupBorderWidth() {
        // Border settings
        yourHomeView.layer.borderWidth = 1.0
        yourHomeView.layer.borderColor = UIColor.white.cgColor
    }
    
    func setupBorderShadow() {
        // Shadow settings
        yourHomeView.layer.shadowColor = UIColor.black.cgColor  // Shadow color
        yourHomeView.layer.shadowOpacity = 0.1 // Shadow opacity (0.0 to 1.0)
        yourHomeView.layer.shadowOffset = CGSize(width: 0, height: 5) // Shadow offset (you can change this)
        yourHomeView.layer.shadowRadius = 3 // Shadow blur radius (the higher the more blur)
        
        // Make the shadow more "realistic" by enabling shadow path
        yourHomeView.layer.masksToBounds = false // Important for shadow to appear outside bounds
        yourHomeView.layer.shadowPath = UIBezierPath(rect: yourHomeView.bounds).cgPath
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        
        print("Logout button pressed")
//        do {
//            try Auth.auth().signOut()
//            
//            // Instantiate the storyboard and the login view controller
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            if let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginAndSignupToAirbnbScreenViewController") as? LoginAndSignupToAirbnbScreenViewController {
//                
//                // Create a new UINavigationController with loginVC as the root
//                let navController = UINavigationController(rootViewController: loginVC)
//                
//                // Set the new navigation controller as the root view controller of the app window
//                if let window = UIApplication.shared.keyWindow {
//                    window.rootViewController = navController
//                    window.makeKeyAndVisible()
//                }
//            }
//        } catch let signOutError as NSError {
//            print("Error signing out: %@", signOutError)
//        }
        
        // Create a storyboard reference
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Try to instantiate the view controller from the storyboard
        if let alertVC = storyboard.instantiateViewController(withIdentifier: "LogoutCustomAlertViewController") as? LogoutCustomAlertViewController {
            
            // Set modal presentation style and transition
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .coverVertical
            
            // Present the view controller first
            self.present(alertVC, animated: false, completion: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        // Profile
        case K.ProfileMainScreen.Segues.ProfileScreenToShowProfileSegue:
            self.tabBarController?.tabBar.isHidden = true
            break
        // Settings
        case K.ProfileMainScreen.Segues.ProfileScreenToPersonalInformationSegue:
            self.tabBarController?.tabBar.isHidden = true
            break
        case K.ProfileMainScreen.Segues.ProfileScreenToLoginandSecuritySegue:
            self.tabBarController?.tabBar.isHidden = true
            break
        case K.ProfileMainScreen.Segues.ProfileScreenToPaymentandPayoutsSegue:
            self.tabBarController?.tabBar.isHidden = true
            break
        case K.ProfileMainScreen.Segues.ProfileScreenToTaxesSegue:
            self.tabBarController?.tabBar.isHidden = true
            break
        case K.ProfileMainScreen.Segues.ProfileScreenToTranslationSegue:
            self.tabBarController?.tabBar.isHidden = true
            break
        case K.ProfileMainScreen.Segues.ProfileScreenToNotificationsSegue:
            self.tabBarController?.tabBar.isHidden = true
            break
        case K.ProfileMainScreen.Segues.ProfileScreenToPrivacyandSharingSegue:
            self.tabBarController?.tabBar.isHidden = true
            break
        case K.ProfileMainScreen.Segues.ProfileScreenToTravelforWorkSegue:
            self.tabBarController?.tabBar.isHidden = true
            break
        // Hosting
        case K.ProfileMainScreen.Segues.ProfileScreenToListyourSpaceSegue:
            self.tabBarController?.tabBar.isHidden = true
            break
        case K.ProfileMainScreen.Segues.ProfileScreenToLearnAboutHostingSegue:
            self.tabBarController?.tabBar.isHidden = true
            break
        case K.ProfileMainScreen.Segues.ProfileScreenToHostanExperienceSegue:
            self.tabBarController?.tabBar.isHidden = true
            break
        // Support
        case K.ProfileMainScreen.Segues.ProfileScreenToGiveusFeedbackSegue:
            self.tabBarController?.tabBar.isHidden = true
            break
        default:
            break

        }
        
    }
    
}
