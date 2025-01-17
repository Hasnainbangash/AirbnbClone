//
//  CategoryCell.swift
//  AirbnbClone
//
//  Created by Elexoft on 08/01/2025.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categorySelectView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        categorySelectView.backgroundColor = .red
        
    }
    
    func configureCell(categoryImageName: String, categoryName: String) {
        
        self.categoryImageView.image = UIImage(systemName: categoryImageName)
        
        self.categoryName.text = categoryName
        
    }
    
}
