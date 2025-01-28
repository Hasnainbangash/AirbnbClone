//
//  FinishAFewLastStepsViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 28/01/2025.
//

import UIKit

class FinishAFewLastStepsViewController: UIViewController {

    @IBOutlet weak var listingImageView: UIImageView!
    @IBOutlet weak var listingDiscription: UILabel!
    @IBOutlet weak var listinglocationName: UILabel!
    @IBOutlet weak var finishupButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
    }

    func setupCornerRadius() {
        listingImageView.layer.cornerRadius = listingImageView.frame.height / 9
        finishupButtonLabel.layer.cornerRadius = finishupButtonLabel.frame.height / 5
    }
    
}
