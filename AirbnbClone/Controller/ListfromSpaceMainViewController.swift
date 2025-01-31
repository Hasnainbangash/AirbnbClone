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

    @IBAction func getStartedButton(_ sender: UIButton) {
        let listingID = UUID().uuidString
        UserDefaults.standard.set(listingID, forKey: "Listing ID")
        print(listingID)
        self.performSegue(withIdentifier: K.HostYourPlaceCell.Segues.listFromSpaceToTellUsAbutYourPlaceSegue, sender: self)
    }
    
}
