//
//  MessageHomeCell.swift
//  AirbnbClone
//
//  Created by Elexoft on 17/01/2025.
//

import UIKit

class MessageHomeCell: UITableViewCell {

    @IBOutlet weak var receiverImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var timeDay: UILabel!
    @IBOutlet weak var lastMessage: UILabel!
    @IBOutlet weak var messageStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCornerRadius()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCornerRadius() {
        receiverImageView.layer.cornerRadius = receiverImageView.frame.height / 2
    }
    
    func configureCell(receiverImage: String, name: String, timeDay: String, lastMessage: String, messageStatus: String) {
        
        self.receiverImageView.image = UIImage(named: receiverImage)
        self.name.text = name
        self.timeDay.text = timeDay
        self.lastMessage.text = "Airbnb: This case is closed. Still new the update"
        self.messageStatus.text = messageStatus
        
    }
    
}
