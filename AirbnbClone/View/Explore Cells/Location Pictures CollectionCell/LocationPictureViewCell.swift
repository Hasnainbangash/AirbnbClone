//
//  LocationPictureViewCell.swift
//  AirbnbClone
//
//  Created by Elexoft on 09/01/2025.
//

import UIKit

class LocationPictureViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureData(imageName: String) {
        self.imageView.image = UIImage(named: imageName)
    }
    
}
