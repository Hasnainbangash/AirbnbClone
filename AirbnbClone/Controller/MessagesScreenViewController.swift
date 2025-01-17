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
    
    @IBOutlet weak var tableView: UITableView!
    
    var messagesData: [MessagesData] = [
        
        MessagesData(receiverImageName: "profileImage", name: "Franklin", timeDay: "tuesday", lastMessage: nil, messageStatus: "closed"),
        MessagesData(receiverImageName: "profileImage", name: "Jimmy", timeDay: "thursday", lastMessage: nil, messageStatus: "open"),
        MessagesData(receiverImageName: "profileImage", name: "Michael", timeDay: "wednesday", lastMessage: nil, messageStatus: "closed"),
        MessagesData(receiverImageName: "profileImage", name: "Trevor", timeDay: "friday", lastMessage: nil, messageStatus: "closed"),
        MessagesData(receiverImageName: "profileImage", name: "John", timeDay: "monday", lastMessage: nil, messageStatus: "open")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        allButtonLabel.backgroundColor = .black
        allButtonLabel.tintColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: K.MessageScreenCell.NibNames.messageHomeCellNibName, bundle: nil), forCellReuseIdentifier: K.MessageScreenCell.Identifiers.messageHomeCellIdentifier)
        
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

extension MessagesScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let messageData = messagesData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.MessageScreenCell.Identifiers.messageHomeCellIdentifier, for: indexPath) as? MessageHomeCell
        
        cell?.configureCell(receiverImage: messageData.receiverImageName, name: messageData.name, timeDay: messageData.timeDay, lastMessage: messageData.lastMessage, messageStatus: messageData.messageStatus)
        
        return cell ?? UITableViewCell()
        
    }
    
}

extension MessagesScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
