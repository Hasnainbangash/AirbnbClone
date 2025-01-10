//
//  BedroomsCell.swift
//  AirbnbClone
//
//  Created by Elexoft on 10/01/2025.
//

import UIKit

class BedroomsCell: UICollectionViewCell {

    @IBOutlet weak var bedroomNo: UILabel!
    @IBOutlet weak var bedSize: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureData(bedroomNo: String, bedSize: String) {
        
        self.bedroomNo.text = "Bedroom \(bedroomNo)"
        
        self.bedSize.text = "\(bedSize) bed"
        
    }

}
