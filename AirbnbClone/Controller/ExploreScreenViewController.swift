//
//  ExploreScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 08/01/2025.
//

import UIKit

class ExploreScreenViewController: UIViewController {

    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var settingButtonLabel: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var exploreCategories: [ExploreCategories] = [
        
        ExploreCategories(categoryName: "Lake", categoryImage: "water.waves"),
        ExploreCategories(categoryName: "Icons", categoryImage: "line.horizontal.star.fill.line.horizontal"),
        ExploreCategories(categoryName: "Arctic", categoryImage: "snowflake"),
        ExploreCategories(categoryName: "Islands", categoryImage: "sun.haze"),
        ExploreCategories(categoryName: "Top cities", categoryImage: "building.2"),
        ExploreCategories(categoryName: "Design", categoryImage: "house.and.flag"),
        ExploreCategories(categoryName: "Rooms", categoryImage: "bed.double"),
        ExploreCategories(categoryName: "Amazing Views", categoryImage: "window.casement"),
        ExploreCategories(categoryName: "Mansions", categoryImage: "building.columns"),
        ExploreCategories(categoryName: "Tropical", categoryImage: "tree"),
        ExploreCategories(categoryName: "Tiny homes", categoryImage: "house"),
        ExploreCategories(categoryName: "OMG!", categoryImage: "manatsign.bank.building"),
        ExploreCategories(categoryName: "Trending", categoryImage: "flame"),
        ExploreCategories(categoryName: "Earth homes", categoryImage: "house"),
        ExploreCategories(categoryName: "Castles", categoryImage: "building.columns"),
        ExploreCategories(categoryName: "Bed & breakfasts", categoryImage: "cup.and.heat.waves"),
        ExploreCategories(categoryName: "Camping", categoryImage: "tent"),
        ExploreCategories(categoryName: "Historical homes", categoryImage: "building.columns"),
        ExploreCategories(categoryName: "Cabins", categoryImage: "house"),
        ExploreCategories(categoryName: "A-frames", categoryImage: "tent.2"),
        ExploreCategories(categoryName: "Countryside", categoryImage: "cloud.sun"),
        ExploreCategories(categoryName: "Luxe", categoryImage: "bell.circle"),
        ExploreCategories(categoryName: "Houseboats", categoryImage: "house"),
        ExploreCategories(categoryName: "Riads", categoryImage: "building.columns"),
        ExploreCategories(categoryName: "Containers", categoryImage: "square.grid.3x1.below.line.grid.1x2"),
        ExploreCategories(categoryName: "Barns", categoryImage: "building.columns"),
        ExploreCategories(categoryName: "Top of ther world", categoryImage: "mountain.2"),
        ExploreCategories(categoryName: "National parks", categoryImage: "tree"),
        ExploreCategories(categoryName: "Caves", categoryImage: "mountain.2.circle"),
        ExploreCategories(categoryName: "Amazing pools", categoryImage: "water.waves"),
        ExploreCategories(categoryName: "New", categoryImage: "key.horizontal"),
        ExploreCategories(categoryName: "Farms", categoryImage: "house.lodge"),
        ExploreCategories(categoryName: "Off-the-grid", categoryImage: "square.grid.3x3"),
        ExploreCategories(categoryName: "Cycladic homes", categoryImage: "house"),
        ExploreCategories(categoryName: "Dammusi", categoryImage: "homekit"),
        ExploreCategories(categoryName: "Surfing", categoryImage: "sailboat"),
        ExploreCategories(categoryName: "Yurts", categoryImage: "tent.2"),
        ExploreCategories(categoryName: "Treehouses", categoryImage: "tree"),
        ExploreCategories(categoryName: "Beachfront", categoryImage: "sun.dust"),
        ExploreCategories(categoryName: "Beach", categoryImage: "beach.umbrella"),
        ExploreCategories(categoryName: "Camper vans", categoryImage: "bus.fill"),
        ExploreCategories(categoryName: "Lakefront", categoryImage: "thermometer.and.liquid.waves.snowflake"),
        ExploreCategories(categoryName: "Golfing", categoryImage: "figure.golf"),
        ExploreCategories(categoryName: "Skiing", categoryImage: "line.diagonal"),
        ExploreCategories(categoryName: "Hanoks", categoryImage: "house"),
        ExploreCategories(categoryName: "Vineyards", categoryImage: "tent"),
        ExploreCategories(categoryName: "Chef's kitchen", categoryImage: "hat.cap"),
        ExploreCategories(categoryName: "Windmills", categoryImage: "millsign.bank.building"),
        ExploreCategories(categoryName: "Shepherd's huts", categoryImage: "house"),
        ExploreCategories(categoryName: "Ryokans", categoryImage: "tent"),
        ExploreCategories(categoryName: "Minsus", categoryImage: "house.lodge"),
        ExploreCategories(categoryName: "Domes", categoryImage: "tent.2"),
        ExploreCategories(categoryName: "Desert", categoryImage: "tree"),
        ExploreCategories(categoryName: "Casas particulares", categoryImage: "window.awning"),
        ExploreCategories(categoryName: "Towers", categoryImage: "airport.extreme.tower"),
        ExploreCategories(categoryName: "Adapted", categoryImage: "house.lodge"),
        ExploreCategories(categoryName: "Ski-in/out", categoryImage: "waveform.and.person.filled"),
        ExploreCategories(categoryName: "Play", categoryImage: "figure.cricket"),
        ExploreCategories(categoryName: "Boats", categoryImage: "sailboat"),
        ExploreCategories(categoryName: "Creative spaces", categoryImage: "paintpalette"),
        ExploreCategories(categoryName: "Grand pianos", categoryImage: "pianokeys"),
        ExploreCategories(categoryName: "Trulli", categoryImage: "house")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupCornerRadius()
        setupBorderWidth()
        setupBorderShadow()
        
    }
    
    func setupCornerRadius() {
        settingButtonLabel.layer.cornerRadius = settingButtonLabel.frame.height / 2
        searchBarView.layer.cornerRadius = searchBarView.frame.height / 2
    }
    
    func setupBorderWidth() {
        settingButtonLabel.layer.borderWidth = 0.7
        searchBarView.layer.borderWidth = 0.4
        searchBarView.layer.borderColor = UIColor.white.cgColor
    }
    
    func setupBorderShadow() {
        // Shadow settings
        searchBarView.layer.shadowColor = UIColor.black.cgColor  // Shadow color
        searchBarView.layer.shadowOpacity = 0.1 // Shadow opacity (0.0 to 1.0)
        searchBarView.layer.shadowOffset = CGSize(width: 0, height: 3) // Shadow offset (you can change this)
        searchBarView.layer.shadowRadius = 2 // Shadow blur radius (the higher the more blur)
        
        // Make the shadow more "realistic" by enabling shadow path
        searchBarView.layer.masksToBounds = false // Important for shadow to appear outside bounds
        searchBarView.layer.shadowPath = UIBezierPath(rect: searchBarView.bounds).cgPath
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemPerRow: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 6 : 4
        let padding: CGFloat = 10
        let totalPadding = padding * (itemPerRow - 1)
        let availableWidth = collectionView.frame.width - totalPadding
        let itemWidth = availableWidth / itemPerRow

        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}
