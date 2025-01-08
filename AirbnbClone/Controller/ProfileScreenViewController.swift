//
//  ProfileScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 08/01/2025.
//

import UIKit

class ProfileScreenViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupCornerRadius()
    }
    
    func setupCornerRadius() {
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 3
    }
    
}
