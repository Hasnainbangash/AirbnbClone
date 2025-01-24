//
//  SafeyItemsBodyCell.swift
//  AirbnbClone
//
//  Created by Elexoft on 24/01/2025.
//

import UIKit

class SafeyItemsBodyCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCornerRadius()
        setupBorderWidth()
    }
    
    func setupCornerRadius() {
        mainView.layer.cornerRadius = mainView.frame.height / 7
    }
    
    func setupBorderWidth() {
        mainView.layer.borderWidth = 0.4
    }

    func configureCell(placeImageName: String, placeName: String) {
        
        self.placeImageView.image = UIImage(systemName: placeImageName)
        self.placeName.text = placeName
        
    }

}
