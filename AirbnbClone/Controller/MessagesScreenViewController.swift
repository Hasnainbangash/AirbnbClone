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
        allButtonLabel.backgroundColor = .black
        allButtonLabel.tintColor = .white
        setupCornerRadius()
    }
    
    func setupCornerRadius() {
        searchButtonLabel.layer.cornerRadius = searchButtonLabel.frame.height / 2
        settingButtonLabel.layer.cornerRadius = searchButtonLabel.frame.height / 2
        allButtonLabel.layer.cornerRadius = allButtonLabel.frame.height / 2
        travellingButtonLabel.layer.cornerRadius = travellingButtonLabel.frame.height / 2
        supportButtonLabel.layer.cornerRadius = supportButtonLabel.frame.height / 2
    }
    
    
    @IBAction func messagesCategoryButtons(_ sender: UIButton) {
        
        resetButtonStyles()
        
        guard let buttonTitle = sender.titleLabel?.text else {
            print(sender.titleLabel?.text ?? "No title")
            return
        }

        print(buttonTitle)
        switch buttonTitle {
        case "All":
            allButtonLabel.backgroundColor = .black
            allButtonLabel.tintColor = .white
            break
        case "Travelling":
            travellingButtonLabel.backgroundColor = .black
            travellingButtonLabel.tintColor = .white
            break
        case "Support":
            supportButtonLabel.backgroundColor = .black
            supportButtonLabel.tintColor = .white
            break
        default:
            break
        }
    }

    func resetButtonStyles() {
        allButtonLabel.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        allButtonLabel.tintColor = .black
        
        travellingButtonLabel.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        travellingButtonLabel.tintColor = .black
        
        supportButtonLabel.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        supportButtonLabel.tintColor = .black
    }
    
}
