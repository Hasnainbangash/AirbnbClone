//
//  WhichOfTheseBestDescribeYourPlaceViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 23/01/2025.
//

import UIKit

class WhichOfTheseBestDescribeYourPlaceViewController: UIViewController {

    @IBOutlet weak var saveAndExitButtonLabel: UIButton!
    @IBOutlet weak var backButtonLabel: UIButton!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var describeYourPlace: [DescribeYourPlace] = [
        
        DescribeYourPlace(placeImageName: "house", placeName: "House"),
        DescribeYourPlace(placeImageName: "building.2", placeName: "Flat/apartment"),
        DescribeYourPlace(placeImageName: "building.columns", placeName: "Barn"),
        DescribeYourPlace(placeImageName: "cup.and.heat.waves", placeName: "Bed & breaktast"),
        DescribeYourPlace(placeImageName: "sailboat", placeName: "Boat"),
        DescribeYourPlace(placeImageName: "house", placeName: "Cabin"),
        DescribeYourPlace(placeImageName: "car.side", placeName: "Campervan/motorhome"),
        DescribeYourPlace(placeImageName: "building", placeName: "Casa particular"),
        DescribeYourPlace(placeImageName: "building.columns", placeName: "Castle"),
        DescribeYourPlace(placeImageName: "mountain.2", placeName: "Cave"),
        DescribeYourPlace(placeImageName: "rectangle.split.3x1", placeName: "Container"),
        DescribeYourPlace(placeImageName: "house", placeName: "Cycladic home"),
        DescribeYourPlace(placeImageName: "tree", placeName: "Dammuso"),
        DescribeYourPlace(placeImageName: "building.columns.circle", placeName: "Dome"),
        DescribeYourPlace(placeImageName: "globe.asia.australia", placeName: "Earth home"),
        DescribeYourPlace(placeImageName: "house.lodge", placeName: "Farm"),
        DescribeYourPlace(placeImageName: "house", placeName: "Guest house"),
        DescribeYourPlace(placeImageName: "Cycladic homes", placeName: "Hotel"),
        DescribeYourPlace(placeImageName: "Boat", placeName: "Houseboat"),
        DescribeYourPlace(placeImageName: "", placeName: "Kezhan"),
        DescribeYourPlace(placeImageName: "sailboat", placeName: "Minsu"),
        DescribeYourPlace(placeImageName: "building.columns", placeName: "Riad"),
        DescribeYourPlace(placeImageName: "house.lodge", placeName: "Ryokan"),
        DescribeYourPlace(placeImageName: "homekit", placeName: "Shepherd's hut"),
        DescribeYourPlace(placeImageName: "tent", placeName: "Tent"),
        DescribeYourPlace(placeImageName: "house", placeName: "Tiny home"),
        DescribeYourPlace(placeImageName: "airport.extreme.tower", placeName: "Tower"),
        DescribeYourPlace(placeImageName: "tree", placeName: "Tree house"),
        DescribeYourPlace(placeImageName: "tent.2", placeName: "Trullo"),
        DescribeYourPlace(placeImageName: "wind", placeName: "Windmill"),
        DescribeYourPlace(placeImageName: "house", placeName: "Yurt")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupCornerRadius()
        setupBorderWidth()
        setupButtonUnderline()
    }
    
    func setupCornerRadius() {
        saveAndExitButtonLabel.layer.cornerRadius = saveAndExitButtonLabel.frame.height / 2
        nextButtonLabel.layer.cornerRadius = nextButtonLabel.frame.height / 5
    }
    
    func setupBorderWidth() {
        saveAndExitButtonLabel.layer.borderWidth = 0.3
    }
    
    func setupButtonUnderline() {
        guard let buttonText = backButtonLabel.titleLabel?.text else {return}
        
        // Create an NSMutableAttributedString from the button's title text
        let attributedString = NSMutableAttributedString(string: buttonText)
        
        // Add underline attribute to the full text
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: buttonText.count))
        
        // Set the attributed text to the button's title
        backButtonLabel.setAttributedTitle(attributedString, for: .normal)
        
        // Optional: Change the text color (you can set any color you prefer)
        backButtonLabel.setTitleColor(UIColor.black, for: .normal)
    }

}

extension WhichOfTheseBestDescribeYourPlaceViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return describeYourPlace.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let describePlace = describeYourPlace[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.HostYourPlaceCell.Identifiers.describeYourPlaceCollectionCellIdentifier, for: indexPath) as? DescribeYourPlaceCollectionCell
        
        cell?.configureCell(placeImageName: describePlace.placeImageName, placeName: describePlace.placeName)
        
        return cell ?? UICollectionViewCell()
        
        
    }
    
}

extension WhichOfTheseBestDescribeYourPlaceViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemPerRow: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 4 : 2
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
