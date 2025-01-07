//
//  RecentlyViewedScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 07/01/2025.
//

import UIKit

class RecentlyViewedScreenViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var recentlyViewed: [RecentlyViewed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        
    }

}

extension RecentlyViewedScreenViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recentlyViewed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.RecentlyViewedCell.Identifiers.recentlyViewedCellIdentifier, for: indexPath) as? RecentlyViewedViewCell
        
        cell?.configureCell(placeImage: nil, placeName: "Villa in Mashobra", totalBeds: "3", totalbedRooms: "3")
        
        
        return cell ?? UICollectionViewCell()
        
    }
    
}
