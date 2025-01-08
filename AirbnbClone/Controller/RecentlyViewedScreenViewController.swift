//
//  RecentlyViewedScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 07/01/2025.
//

import UIKit

class RecentlyViewedScreenViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var recentlyViewed: [RecentlyViewed] = [
        
        RecentlyViewed(placeImage: "hotelroomimage1", placeName: "Room in Manali", totalBeds: "3", totalBedrooms: "3"),
        RecentlyViewed(placeImage: "hotelroomimage2", placeName: "Villa in Mashobra", totalBeds: "2", totalBedrooms: "2"),
        RecentlyViewed(placeImage: "hotelroomimage3", placeName: "Room in Paris", totalBeds: "4", totalBedrooms: "4"),
        RecentlyViewed(placeImage: "hotelroomimage4", placeName: "Manali, India", totalBeds: "1", totalBedrooms: "1"),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(
            UINib(nibName: K.RecentlyViewedCell.NibNames.headerCellNibName, bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: K.RecentlyViewedCell.Identifiers.headerCellIdentifier
        )
        
        collectionView.register(UINib(nibName: K.RecentlyViewedCell.NibNames.recentlyViewedCellNibName, bundle: nil), forCellWithReuseIdentifier: K.RecentlyViewedCell.Identifiers.recentlyViewedCellIdentifier)
        
    }

}

extension RecentlyViewedScreenViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recentlyViewed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let recentlyView = recentlyViewed[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.RecentlyViewedCell.Identifiers.recentlyViewedCellIdentifier, for: indexPath) as? RecentlyViewedViewCell
        
        cell?.configureCell(placeImage: recentlyView.placeImage, placeName: recentlyView.placeName, totalBeds: recentlyView.totalBeds, totalbedRooms: recentlyView.totalBedrooms)
        
        
        return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: K.RecentlyViewedCell.Identifiers.headerCellIdentifier, for: indexPath) as? HeaderCell
            
            return headerView ?? UICollectionViewCell()
            
        }
        fatalError("Unexpected Error")
    }
    
}

extension RecentlyViewedScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemPerRow: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 4 : 2
        let padding: CGFloat = 10
        let totalPadding = padding * (itemPerRow - 1)
        let availableWidth = collectionView.frame.width - totalPadding
        let itemWidth = availableWidth / itemPerRow

        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 80)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
