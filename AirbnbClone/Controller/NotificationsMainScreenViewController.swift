//
//  NotificationsMainScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 14/01/2025.
//

import UIKit

class NotificationsMainScreenViewController: UIViewController {

    @IBOutlet weak var offersAndUpdatesView: UIView!
    @IBOutlet weak var accountsView: UIView!
    
    @IBOutlet weak var offersAndUpdatesStackView: UIStackView!
    @IBOutlet weak var accountStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        accountsView.backgroundColor = .white
        offersAndUpdatesView.isHidden = false
        accountStackView.isHidden = true
    }

    @IBAction func notificationsButtons(_ sender: UIButton) {
        
        resetButtonsView()
        
        guard let buttonTitle = sender.titleLabel?.text else {
            print(sender.titleLabel?.text ?? "No title")
            return
        }

        print(buttonTitle)
        switch buttonTitle {
        case "Offers and updates":
            offersAndUpdatesView.backgroundColor = .black
            offersAndUpdatesStackView.isHidden = false
            accountStackView.isHidden = true
            break
        case "Account":
            accountsView.backgroundColor = .black
            accountStackView.isHidden = false
            offersAndUpdatesStackView.isHidden = true
            break
        default:
            break
        }
        
    }
    
    func resetButtonsView() {
        offersAndUpdatesView.backgroundColor = .white
        offersAndUpdatesStackView.isHidden = false
        
        accountsView.backgroundColor = .white
        accountStackView.isHidden = false
    }
}
