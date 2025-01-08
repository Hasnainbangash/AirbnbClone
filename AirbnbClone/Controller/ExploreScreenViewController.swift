//
//  ExploreScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 08/01/2025.
//

import UIKit

class ExploreScreenViewController: UIViewController {

    @IBOutlet weak var settingButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
        setupBorderWidth()
        
    }
    
    func setupCornerRadius() {
        settingButtonLabel.layer.cornerRadius = settingButtonLabel.frame.height / 2
    }
    
    func setupBorderWidth() {
        settingButtonLabel.layer.borderWidth = 0.7
    }

}
