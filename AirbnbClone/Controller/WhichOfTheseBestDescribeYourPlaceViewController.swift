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
        
        DescribeYourPlace(placeImageName: "", placeName: "House"),
        DescribeYourPlace(placeImageName: "", placeName: "Flat/apartment"),
        DescribeYourPlace(placeImageName: "", placeName: "Barn"),
        DescribeYourPlace(placeImageName: "", placeName: "Bed & breaktast"),
        DescribeYourPlace(placeImageName: "", placeName: "Boat"),
        DescribeYourPlace(placeImageName: "", placeName: "Cabin"),
        DescribeYourPlace(placeImageName: "", placeName: "Campervan/motorhome"),
        DescribeYourPlace(placeImageName: "", placeName: "Casa particular"),
        DescribeYourPlace(placeImageName: "", placeName: "Castle"),
        DescribeYourPlace(placeImageName: "", placeName: "Cave"),
        DescribeYourPlace(placeImageName: "", placeName: "Container"),
        DescribeYourPlace(placeImageName: "", placeName: "Cycladic home"),
        DescribeYourPlace(placeImageName: "", placeName: "Dammuso"),
        DescribeYourPlace(placeImageName: "", placeName: "Dome"),
        DescribeYourPlace(placeImageName: "", placeName: "Earth home"),
        DescribeYourPlace(placeImageName: "", placeName: "Farm"),
        DescribeYourPlace(placeImageName: "", placeName: "Guest house"),
        DescribeYourPlace(placeImageName: "", placeName: "Hotel"),
        DescribeYourPlace(placeImageName: "", placeName: "Houseboat"),
        DescribeYourPlace(placeImageName: "", placeName: "Kezhan"),
        DescribeYourPlace(placeImageName: "", placeName: "Minsu"),
        DescribeYourPlace(placeImageName: "", placeName: "Riad"),
        DescribeYourPlace(placeImageName: "", placeName: "Ryokan"),
        DescribeYourPlace(placeImageName: "", placeName: "Shepherd's hut"),
        DescribeYourPlace(placeImageName: "", placeName: "Tent"),
        DescribeYourPlace(placeImageName: "", placeName: "Tiny home"),
        DescribeYourPlace(placeImageName: "", placeName: "Tower"),
        DescribeYourPlace(placeImageName: "", placeName: "Tree house"),
        DescribeYourPlace(placeImageName: "", placeName: "Trullo"),
        DescribeYourPlace(placeImageName: "", placeName: "Windmill"),
        DescribeYourPlace(placeImageName: "", placeName: "Yurt")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        
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
        <#code#>
    }
    
}
