//
//  UploadedPhotosCollectionCell.swift
//  AirbnbClone
//
//  Created by Elexoft on 30/01/2025.
//

import UIKit

class UploadedPhotosCollectionCell: UICollectionViewCell {

    @IBOutlet weak var uploadedImageVIew: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureData(uploadedImage: String) {
        self.uploadedImageVIew.image = UIImage(named: uploadedImage)
    }
    
}
