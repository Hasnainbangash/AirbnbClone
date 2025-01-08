//
//  ExploreScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 08/01/2025.
//

import UIKit

class ExploreScreenViewController: UIViewController {

    @IBOutlet weak var settingButtonLabel: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var exploreCategories: [ExploreCategories] = [
        
        ExploreCategories(categoryName: "Amazing Views", categoryImage: "window.awning")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupCornerRadius()
        setupBorderWidth()
        
    }
    
    func setupCornerRadius() {
        settingButtonLabel.layer.cornerRadius = settingButtonLabel.frame.height / 2
    }
    
    func setupBorderWidth() {
        settingButtonLabel.layer.borderWidth = 0.7
    }

}

extension ExploreScreenViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exploreCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let exploreCategory = exploreCategories[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.ExploreCells.Identifiers.categoryCellIdentifier, for: indexPath) as? CategoryCell
        cell?.configureCell(categoryImageName: exploreCategory.categoryImage, categoryName: exploreCategory.categoryName)
        return cell ?? UICollectionViewCell()
    }
    
}

extension ExploreScreenViewController: UICollectionViewDelegateFlowLayout {
    
}
