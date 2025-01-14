//
//  FindaCoHostMainViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 14/01/2025.
//

import UIKit

class FindaCoHostMainViewController: UIViewController {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var locationButtonView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
        setupBorderRadius()
        setupBorderShadow()
    }
    
    func setupCornerRadius() {
        searchView.layer.cornerRadius = searchView.frame.height / 2
        locationButtonView.layer.cornerRadius = locationButtonView.frame.height / 4
    }
    
    func setupBorderRadius() {
        searchView.layer.borderWidth = 0.05
        searchView.layer.borderColor = UIColor.white.cgColor
    }
    
    func setupBorderShadow() {
        // Shadow settings
        searchView.layer.shadowColor = UIColor.black.cgColor  // Shadow color
        searchView.layer.shadowOpacity = 0.1 // Shadow opacity (0.0 to 1.0)
        searchView.layer.shadowOffset = CGSize(width: 0, height: 3) // Shadow offset (you can change this)
        searchView.layer.shadowRadius = 2 // Shadow blur radius (the higher the more blur)
        
        // Make the shadow more "realistic" by enabling shadow path
        searchView.layer.masksToBounds = false // Important for shadow to appear outside bounds
        // Create a rounded rectangle path that matches the view's corner radius
        let shadowPath = UIBezierPath(roundedRect: searchView.bounds,
                                      cornerRadius: searchView.layer.cornerRadius)
        searchView.layer.shadowPath = shadowPath.cgPath
    }

}
