//
//  MapLocationCell.swift
//  AirbnbClone
//
//  Created by Elexoft on 21/01/2025.
//

import UIKit

class MapLocationCell: UICollectionViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureData(imageName: String) {
        self.pictureImageView.image = UIImage(named: imageName)
    }
    
}
