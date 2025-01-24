//
//  TellGuestWhatYourPlaceHasToOfferViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 24/01/2025.
//

import UIKit

class TellGuestWhatYourPlaceHasToOfferViewController: UIViewController {

    @IBOutlet weak var saveAndExitButtonLabel: UIButton!
    @IBOutlet weak var questionsButtonLabel: UIButton!
    @IBOutlet weak var backButtonLabel: UIButton!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var guestFavourates: [DescribeYourPlace] = [
        
        DescribeYourPlace(placeImageName: "wifi", placeName: "Wifi"),
        DescribeYourPlace(placeImageName: "tv", placeName: "TV"),
        DescribeYourPlace(placeImageName: "square.split.bottomrightquarter", placeName: "Kitchen"),
        DescribeYourPlace(placeImageName: "washer", placeName: "Washing machine"),
        DescribeYourPlace(placeImageName: "parkingsign.radiowaves.left.and.right", placeName: "Free parking on premises"),
        DescribeYourPlace(placeImageName: "parkingsign.radiowaves.left.and.right.slash", placeName: "Paid parking on premises"),
        DescribeYourPlace(placeImageName: "snowflake", placeName: "Air conditioning"),
        DescribeYourPlace(placeImageName: "lamp.table.fill", placeName: "Dedicated workspace"),
        
    ]
    
    var safetyItems: [DescribeYourPlace] = [
        
        DescribeYourPlace(placeImageName: "figure.pool.swim", placeName: "Pool"),
        DescribeYourPlace(placeImageName: "bathtub", placeName: "Hot tub"),
        DescribeYourPlace(placeImageName: "building", placeName: "Patio"),
        DescribeYourPlace(placeImageName: "fork.knife", placeName: "BBQ grill"),
        DescribeYourPlace(placeImageName: "table.furniture", placeName: "Outdoor dining area"),
        DescribeYourPlace(placeImageName: "flame", placeName: "Firepit"),
        DescribeYourPlace(placeImageName: "fork.knife", placeName: "Pool table"),
        DescribeYourPlace(placeImageName: "fireplace", placeName: "Indoor fireplace"),
        DescribeYourPlace(placeImageName: "pianokeys", placeName: "Piano"),
        DescribeYourPlace(placeImageName: "figure.walk.treadmill", placeName: "Exercise equipment"),
        DescribeYourPlace(placeImageName: "water.waves", placeName: "Lake access"),
        DescribeYourPlace(placeImageName: "cloud.sun", placeName: "Beach access"),
        DescribeYourPlace(placeImageName: "figure.skiing.downhill", placeName: "Ski-in/out"),
        DescribeYourPlace(placeImageName: "shower", placeName: "Outdoor Shower"),
        
    ]
    
    var standoutAmenities: [DescribeYourPlace] = [
        
        DescribeYourPlace(placeImageName: "light.beacon.min", placeName: "Smoke alarm"),
        DescribeYourPlace(placeImageName: "cross.case", placeName: "First aid kit"),
        DescribeYourPlace(placeImageName: "fire.extinguisher", placeName: "Fire extingusher"),
        DescribeYourPlace(placeImageName: "light.beacon.max", placeName: "Carbon monoxide alarm"),
        
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
        questionsButtonLabel.layer.cornerRadius = questionsButtonLabel.frame.height / 2
        nextButtonLabel.layer.cornerRadius = nextButtonLabel.frame.height / 5
    }
    
    func setupBorderWidth() {
        saveAndExitButtonLabel.layer.borderWidth = 0.3
        questionsButtonLabel.layer.borderWidth = 0.3
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

extension TellGuestWhatYourPlaceHasToOfferViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 1:
            return guestFavourates.count
        case 2:
            return standoutAmenities.count
        case 3:
            return safetyItems.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 1:
            
            let guestFavourate = guestFavourates[indexPath.row]
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.HostYourPlaceCell.Identifiers.guestFavourateBodyCollectionCellIdentifier, for: indexPath) as? GuestsFavourateBodyCell
            
            cell?.configureCell(placeImageName: guestFavourate.placeImageName, placeName: guestFavourate.placeName)
            
            return cell ?? UICollectionViewCell()
            
        case 2:
            
            let standoutAmenity = standoutAmenities[indexPath.row]
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.HostYourPlaceCell.Identifiers.standoutAmenitiesBodyCollectionCellIdentifier, for: indexPath) as? StandoutAmenitiesBodyCell
            
            cell?.configureCell(placeImageName: standoutAmenity.placeImageName, placeName: standoutAmenity.placeName)
            
            return cell ?? UICollectionViewCell()
            
        case 3:
            
            let safetyItem = safetyItems[indexPath.row]
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.HostYourPlaceCell.Identifiers.safetyItemsBodyCollectionCellIdentifier, for: indexPath) as? SafeyItemsBodyCell
            
            cell?.configureCell(placeImageName: safetyItem.placeImageName, placeName: safetyItem.placeName)
            
            return cell ?? UICollectionViewCell()
            
        default:
            return UICollectionViewCell()
        }
        
    }
    
    
}
