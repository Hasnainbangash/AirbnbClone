//
//  DescribeYourPlaceCollectionCell.swift
//  AirbnbClone
//
//  Created by Elexoft on 23/01/2025.
//

import UIKit

class DescribeYourPlaceCollectionCell: UICollectionViewCell {

    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(placeImageName: String, placeName: String) {
        
        self.placeImageView.image = UIImage(systemName: placeImageName)
        self.placeName.text = placeName
        
    }
    
}
