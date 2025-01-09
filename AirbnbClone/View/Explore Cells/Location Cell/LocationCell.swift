//
//  LocationCell.swift
//  AirbnbClone
//
//  Created by Elexoft on 09/01/2025.
//

import UIKit

class LocationCell: UITableViewCell {
    
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var availableDates: UILabel!
    @IBOutlet weak var placeHostedName: UILabel!
    @IBOutlet weak var placePrice: UILabel!
    @IBOutlet weak var dayNightLabel: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images: [String] = ["hotelroomimage1", "hotelroomimage2", "hotelroomimage3", "hotelroomimage4"]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: K.ExploreCells.NibNames.locationPictureViewCellNibName, bundle: nil), forCellWithReuseIdentifier: K.ExploreCells.Identifiers.locationPictureViewCellIdentifier)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(placeName: String, placeHosterName: String, availableDates: [String], priceOfPlace: String, dayTime: String, rating: String) {
        
        self.placeName.text = placeName
        self.placeHostedName.text = "Hosted by \(placeHosterName)"
        self.availableDates.text = "\(availableDates[0]) - \(availableDates[1])"
        self.placePrice.text = priceOfPlace
        self.dayNightLabel.text = dayTime
        self.rating.text = rating
        
    }
    
}

extension LocationCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let image = images[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.ExploreCells.Identifiers.locationPictureViewCellIdentifier, for: indexPath) as? LocationPictureViewCell
        
        cell?.configureData(imageName: image)
        
        return cell ?? UICollectionViewCell()
    }
    
}

extension LocationCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemPerRow: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 1 : 1
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
