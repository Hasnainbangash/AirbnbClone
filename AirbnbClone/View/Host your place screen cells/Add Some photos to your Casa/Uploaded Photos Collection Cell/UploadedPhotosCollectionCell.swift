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

    func configureData(uploadedPhoto: AddSomePhoto) {
        if uploadedPhoto.isAsset {
            self.uploadedImageVIew.image = UIImage(named: uploadedPhoto.image as! String)
        } else {
            self.uploadedImageVIew.image = uploadedPhoto.image as? UIImage
        }
    }
    
}
