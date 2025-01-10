//
//  LocationImagesCell.swift
//  AirbnbClone
//
//  Created by Elexoft on 10/01/2025.
//

import UIKit

class LocationImagesCell: UICollectionViewCell {

    @IBOutlet weak var locationImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureData(imageName: String) {
        self.locationImageView.image = UIImage(named: imageName)
    }
    
}
