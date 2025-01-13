//
//  ReviewCell.swift
//  AirbnbClone
//
//  Created by Elexoft on 10/01/2025.
//

import UIKit

class ReviewCell: UICollectionViewCell {

    @IBOutlet weak var noOfMonthsAgo: UILabel!
    @IBOutlet weak var reviewDescription: UILabel!
    @IBOutlet weak var showmoreLabel: UILabel!
    @IBOutlet weak var reviewerImage: UIImageView!
    @IBOutlet weak var reviewerName: UILabel!
    @IBOutlet weak var reviewerTimeoOnAirbnb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupCornerRadius()
    }
    
    func setupCornerRadius() {
        reviewerImage.layer.cornerRadius = reviewerImage.frame.height / 2
    }
    
    func configureData(noOfMonthsAgo: String, reviewDescription: String,
                       reviewerImage: String, reviewerName: String, reviewerTimeOnAirbnb: String) {
        
        self.noOfMonthsAgo.text = noOfMonthsAgo + "months ago"
        self.reviewDescription.text = reviewDescription
        self.reviewerImage.image = UIImage(named: reviewerImage)
        self.reviewerName.text = reviewerName
        self.reviewerTimeoOnAirbnb.text = reviewerTimeOnAirbnb + "years on Airbnb"
        
        
    }

}
