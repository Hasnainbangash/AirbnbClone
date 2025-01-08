//
//  MessagesScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 08/01/2025.
//

import UIKit

class MessagesScreenViewController: UIViewController {

    @IBOutlet weak var searchButtonLabel: UIButton!
    @IBOutlet weak var settingButtonLabel: UIButton!
    @IBOutlet weak var allButtonLabel: UIButton!
    @IBOutlet weak var travellingButtonLabel: UIButton!
    @IBOutlet weak var supportButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
    }
    
    func setupCornerRadius() {
        searchButtonLabel.layer.cornerRadius = searchButtonLabel.frame.height / 2
        settingButtonLabel.layer.cornerRadius = searchButtonLabel.frame.height / 2
        allButtonLabel.layer.cornerRadius = allButtonLabel.frame.height / 2
        travellingButtonLabel.layer.cornerRadius = travellingButtonLabel.frame.height / 2
        supportButtonLabel.layer.cornerRadius = supportButtonLabel.frame.height / 2
    }

}
