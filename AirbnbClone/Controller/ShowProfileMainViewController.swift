//
//  ShowProfileMainViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 13/01/2025.
//

import UIKit

class ShowProfileMainViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var getTheBadgeButtonLabel: UIButton!
    @IBOutlet weak var createProfileButtonLabel: UIButton!
    @IBOutlet weak var profileDataView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
        setupBorderRadius()
        setupBorderShadow()
    }
    
    func setupCornerRadius() {
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        
        getTheBadgeButtonLabel.layer.cornerRadius = getTheBadgeButtonLabel.frame.height / 5
        
        createProfileButtonLabel.layer.cornerRadius = createProfileButtonLabel.frame.height / 5
        
        profileDataView.layer.cornerRadius = profileDataView.frame.height / 10
    }
    
    func setupBorderRadius() {
        getTheBadgeButtonLabel.layer.borderWidth = 0.5
        profileDataView.layer.borderWidth = 1.0
        profileDataView.layer.borderColor = UIColor.white.cgColor
    }
    
    func setupBorderShadow() {
        // Shadow settings
        profileDataView.layer.shadowColor = UIColor.black.cgColor  // Shadow color
        profileDataView.layer.shadowOpacity = 0.1 // Shadow opacity (0.0 to 1.0)
        profileDataView.layer.shadowOffset = CGSize(width: 0, height: 5) // Shadow offset (you can change this)
        profileDataView.layer.shadowRadius = 3 // Shadow blur radius (the higher the more blur)
        
        // Make the shadow more "realistic" by enabling shadow path
        profileDataView.layer.masksToBounds = false // Important for shadow to appear outside bounds
        profileDataView.layer.shadowPath = UIBezierPath(rect: profileDataView.bounds).cgPath
    }

}
