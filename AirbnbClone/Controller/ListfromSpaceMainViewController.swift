//
//  ListfromSpaceMainViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 13/01/2025.
//

import UIKit

class ListfromSpaceMainViewController: UIViewController {

    @IBOutlet weak var getStartedButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
    }
    
    func setupCornerRadius() {
        getStartedButtonLabel.layer.cornerRadius = getStartedButtonLabel.frame.height / 5
    }

}
