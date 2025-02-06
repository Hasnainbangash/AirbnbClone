//
//  LogoutCustomViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 06/02/2025.
//

import UIKit
import FirebaseAuth

class LogoutCustomAlertViewController: UIViewController {

    @IBOutlet weak var yesButtonLabel: UIButton!
    @IBOutlet weak var noButtonLabel: UIButton!
    @IBOutlet weak var logoutAlertMainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
    }

    func setupCornerRadius() {
        
        yesButtonLabel.layer.cornerRadius = yesButtonLabel.frame.height / 2
        noButtonLabel.layer.cornerRadius = noButtonLabel.frame.height / 2
        logoutAlertMainView.layer.cornerRadius = logoutAlertMainView.frame.height / 9
        
    }
    
    @IBAction func yesButtonPressed(_ sender: UIButton) {
        print("Yess button pressed")
        do {
            try Auth.auth().signOut()
            
            // Instantiate the storyboard and the login view controller
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginAndSignupToAirbnbScreenViewController") as? LoginAndSignupToAirbnbScreenViewController {
                
                // Create a new UINavigationController with loginVC as the root
                let navController = UINavigationController(rootViewController: loginVC)
                
                // Set the new navigation controller as the root view controller of the app window
                if let window = UIApplication.shared.keyWindow {
                    window.rootViewController = navController
                    window.makeKeyAndVisible()
                }
            }
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func noButtonPressed(_ sender: UIButton) {
        print("No button pressed")
        UIView.animate(withDuration: 0.3) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
