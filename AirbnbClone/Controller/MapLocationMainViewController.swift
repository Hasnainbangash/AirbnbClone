//
//  MapLocationMainViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 21/01/2025.
//

import UIKit

class MapLocationMainViewController: UIViewController {

    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var availableDates: UILabel!
    @IBOutlet weak var placeHostedName: UILabel!
    @IBOutlet weak var placePrice: UILabel!
    @IBOutlet weak var dayNightLabel: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
