//
//  HostAnExperienceMainViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 14/01/2025.
//

import UIKit

class HostAnExperienceMainViewController: UIViewController {

    @IBOutlet weak var grabberView: UIView!
    @IBOutlet weak var letsGoButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
    }
    

    func setupCornerRadius() {
        grabberView.layer.cornerRadius = grabberView.frame.height / 2
        letsGoButtonLabel.layer.cornerRadius = letsGoButtonLabel.frame.height / 5
    }

}
