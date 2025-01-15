//
//  AddEmergencyContactMainViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 15/01/2025.
//

import UIKit

class AddEmergencyContactMainViewController: UIViewController {

    @IBOutlet weak var addNowButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
    }
 
    func setupCornerRadius() {
        addNowButtonLabel.layer.cornerRadius = addNowButtonLabel.frame.height / 5
    }
    
    
    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
