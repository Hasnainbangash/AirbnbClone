//
//  WishlistsScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 07/01/2025.
//

import UIKit

class WishlistsScreenViewController: UIViewController {

    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var allImagesView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupCornerRadius()
        setupBorderWidth()
        setupBorderShadow()
        setupButtonUnderline()
        
    }
    
    func setupCornerRadius() {
        allImagesView.layer.cornerRadius = allImagesView.frame.height / 10
    }
    
    func setupBorderWidth() {
        // Border settings
        allImagesView.layer.borderWidth = 5.0
        allImagesView.layer.borderColor = UIColor.white.cgColor
    }
    
    func setupBorderShadow() {
        // Shadow settings
        allImagesView.layer.shadowColor = UIColor.black.cgColor  // Shadow color
        allImagesView.layer.shadowOpacity = 0.3                 // Shadow opacity (0.0 to 1.0)
        allImagesView.layer.shadowOffset = CGSize(width: 0, height: 3) // Shadow offset (you can change this)
        allImagesView.layer.shadowRadius = 5                     // Shadow blur radius (the higher the more blur)
        
        // Make the shadow more "realistic" by enabling shadow path
        allImagesView.layer.masksToBounds = false // Important for shadow to appear outside bounds
        allImagesView.layer.shadowPath = UIBezierPath(rect: allImagesView.bounds).cgPath
    }
    
    func setupButtonUnderline() {
        guard let buttonText = editButton.titleLabel?.text else {return}
        
        // Create an NSMutableAttributedString from the button's title text
        let attributedString = NSMutableAttributedString(string: buttonText)
        
        // Add underline attribute to the full text
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: buttonText.count))
        
        // Set the attributed text to the button's title
        editButton.setAttributedTitle(attributedString, for: .normal)
        
        // Optional: Change the text color (you can set any color you prefer)
        editButton.setTitleColor(UIColor.blue, for: .normal)
    }
    
}
