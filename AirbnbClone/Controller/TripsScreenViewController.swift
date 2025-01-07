//
//  TripsScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 07/01/2025.
//

import UIKit

class TripsScreenViewController: UIViewController {

    @IBOutlet weak var startSearchingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupCornerRadius()
        setupBorderWidth()
        
    }
    
    func setupCornerRadius() {
        startSearchingButton.layer.cornerRadius = startSearchingButton.frame.height / 5
    }
    
    func setupBorderWidth() {
        startSearchingButton.layer.borderWidth = 1.0
    }

}
