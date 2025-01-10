//
//  ExploreLocationDetailViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 10/01/2025.
//

import UIKit

class ExploreLocationDetailViewController: UIViewController {

    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var bedroomCollectionView: UICollectionView!
    @IBOutlet weak var reviewCollectionView: UICollectionView!
    
    var images: [String] = ["hotelroomimage1", "hotelroomimage2", "hotelroomimage3", "hotelroomimage4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
        
        bedroomCollectionView.dataSource = self
        bedroomCollectionView.delegate = self
        
        reviewCollectionView.dataSource = self
        reviewCollectionView.delegate = self
        
    }

}

extension ExploreLocationDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case imagesCollectionView:
            return images.count
        case bedroomCollectionView:
            return 0
        case reviewCollectionView:
            return 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case imagesCollectionView:
            
//            let cell = imagesCollectionView.de
            
            
            
//        case bedroomCollectionView:
//            return 0
//        case reviewCollectionView:
//            return 0
        default:
            return UICollectionViewCell()
        }
        
    }
    
    
}

extension ExploreLocationDetailViewController: UICollectionViewDelegateFlowLayout {
    
}
