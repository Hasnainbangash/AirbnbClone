//
//  RecentlyViewedViewCell.swift
//  AirbnbClone
//
//  Created by Elexoft on 07/01/2025.
//

import UIKit

class RecentlyViewedViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var bedsLabel: UILabel!
    @IBOutlet weak var bedroomsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCornerRadius() {
        imageView.layer.cornerRadius = imageView.frame.height / 5
    }
    
    func configureCell(placeImage: String?, placeName: String, totalBeds: String, totalbedRooms: String) {
        
//        self.imageView.image = UIImage(named: placeName)
        self.placeName.text = placeName
        self.bedsLabel.text = totalBeds + " beds ."
        self.bedroomsLabel.text = totalbedRooms + " bedrooms"
        
    }

}
