//
//  WhichTypeOfPlaceWillGuestsHaveViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 23/01/2025.
//

import UIKit

class WhichTypeOfPlaceWillGuestsHaveViewController: UIViewController {
    
    @IBOutlet weak var saveAndExitButtonLabel: UIButton!
    @IBOutlet weak var questionsButtonLabel: UIButton!
    @IBOutlet weak var backButtonLabel: UIButton!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    @IBOutlet weak var entirePlaceView: UIView!
    @IBOutlet weak var roomView: UIView!
    @IBOutlet weak var sharedRoomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCornerRadius()
        setupBorderWidth()
        setupButtonUnderline()
        
        entirePlaceView.layer.borderWidth = 2
        entirePlaceView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
    }
    
    func setupCornerRadius() {
        saveAndExitButtonLabel.layer.cornerRadius = saveAndExitButtonLabel.frame.height / 2
        questionsButtonLabel.layer.cornerRadius = questionsButtonLabel.frame.height / 2
        nextButtonLabel.layer.cornerRadius = nextButtonLabel.frame.height / 5
        
        entirePlaceView.layer.cornerRadius = entirePlaceView.frame.height / 7
        roomView.layer.cornerRadius = roomView.frame.height / 7
        sharedRoomView.layer.cornerRadius = sharedRoomView.frame.height / 7
    }
    
    func setupBorderWidth() {
        saveAndExitButtonLabel.layer.borderWidth = 0.3
        questionsButtonLabel.layer.borderWidth = 0.3
        
        entirePlaceView.layer.borderWidth = 0.3
        roomView.layer.borderWidth = 0.3
        sharedRoomView.layer.borderWidth = 0.3
    }
    
    func setupButtonUnderline() {
        guard let buttonText = backButtonLabel.titleLabel?.text else {return}
        
        // Create an NSMutableAttributedString from the button's title text
        let attributedString = NSMutableAttributedString(string: buttonText)
        
        // Add underline attribute to the full text
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: buttonText.count))
        
        // Set the attributed text to the button's title
        backButtonLabel.setAttributedTitle(attributedString, for: .normal)
        
        // Optional: Change the text color (you can set any color you prefer)
        backButtonLabel.setTitleColor(UIColor.black, for: .normal)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func typeOfPlaceSelectedButton(_ sender: UIButton) {
        
        print(sender.tag)
        
        resetViewStyles()
        
        switch sender.tag {
        case 1:
            entirePlaceView.layer.borderWidth = 2
            entirePlaceView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
            break
        case 2:
            roomView.layer.borderWidth = 2
            roomView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
            break
        case 3:
            sharedRoomView.layer.borderWidth = 2
            sharedRoomView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
            break
        default:
            break
        }
        
    }
    
    func resetViewStyles() {
        entirePlaceView.layer.borderWidth = 0.3
        entirePlaceView.backgroundColor = UIColor.white
        
        roomView.layer.borderWidth = 0.3
        roomView.backgroundColor = UIColor.white
        
        sharedRoomView.layer.borderWidth = 0.3
        sharedRoomView.backgroundColor = UIColor.white
    }
    
}
