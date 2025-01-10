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
    
    var roomsData: [RoomData] = [
        RoomData(noOfBedrooms: "1", bedSize: "1"),
        RoomData(noOfBedrooms: "3", bedSize: "1"),
        RoomData(noOfBedrooms: "2", bedSize: "1"),
        RoomData(noOfBedrooms: "4", bedSize: "1")
    ]
    
    var locationReviewData: [LocationReviewData] = [
        
        LocationReviewData(noOfMonthsAgo: "3", reviewDescription: "Aamir sir is a great host and very welcoming. We stayed at My Kashmir Home on our way back from an exhausting 7 day trek...", reviewerImage: "hotelroomimage3", reviewerName: "Peeyush", reviewerTimeoOnAirbnb: "8"),
        LocationReviewData(noOfMonthsAgo: "3", reviewDescription: "Aamir sir is a great host and very welcoming. We stayed at My Kashmir Home on our way back from an exhausting 7 day trek...", reviewerImage: "hotelroomimage2", reviewerName: "Peeyush", reviewerTimeoOnAirbnb: "8"),
        LocationReviewData(noOfMonthsAgo: "3", reviewDescription: "Aamir sir is a great host and very welcoming. We stayed at My Kashmir Home on our way back from an exhausting 7 day trek...", reviewerImage: "hotelroomimage4", reviewerName: "Peeyush", reviewerTimeoOnAirbnb: "8"),
        LocationReviewData(noOfMonthsAgo: "3", reviewDescription: "Aamir sir is a great host and very welcoming. We stayed at My Kashmir Home on our way back from an exhausting 7 day trek...", reviewerImage: "hotelroomimage1", reviewerName: "Peeyush", reviewerTimeoOnAirbnb: "8")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
        
        bedroomCollectionView.dataSource = self
        bedroomCollectionView.delegate = self
        
        reviewCollectionView.dataSource = self
        reviewCollectionView.delegate = self
        
        imagesCollectionView.register(UINib(nibName: K.ExploreLocationDetailCells.NibNames.locationImagesCellNibName, bundle: nil), forCellWithReuseIdentifier: K.ExploreLocationDetailCells.Identifiers.locationImagesCellIdentifier)
        
        bedroomCollectionView.register(UINib(nibName: K.ExploreLocationDetailCells.NibNames.bedroomCellNibName, bundle: nil), forCellWithReuseIdentifier: K.ExploreLocationDetailCells.Identifiers.bedroomCellIdentifier)
        
        reviewCollectionView.register(UINib(nibName: K.ExploreLocationDetailCells.NibNames.reviewCellNibName, bundle: nil), forCellWithReuseIdentifier: K.ExploreLocationDetailCells.Identifiers.reviewCellIdentifier)
        
        
    }

}

extension ExploreLocationDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case imagesCollectionView:
            return images.count
        case bedroomCollectionView:
            return roomsData.count
        case reviewCollectionView:
            return 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case imagesCollectionView:
            
            let image = images[indexPath.row]
            
            let cell = imagesCollectionView.dequeueReusableCell(withReuseIdentifier: K.ExploreLocationDetailCells.Identifiers.locationImagesCellIdentifier, for: indexPath) as? LocationImagesCell
            
            cell?.configureData(imageName: image)
            
            return cell ?? UICollectionViewCell()
            
        case bedroomCollectionView:
            
            let room = roomsData[indexPath.row]
            
            let cell = bedroomCollectionView.dequeueReusableCell(withReuseIdentifier: K.ExploreLocationDetailCells.Identifiers.bedroomCellIdentifier, for: indexPath) as? BedroomsCell
            cell?.configureData(bedroomNo: room.noOfBedrooms, bedSize: room.bedSize)
            return cell ?? UICollectionViewCell()
            
            
        case reviewCollectionView:
            
            let locationReview = locationReviewData[indexPath.row]
            
            let cell = reviewCollectionView.dequeueReusableCell(withReuseIdentifier: K.ExploreLocationDetailCells.Identifiers.reviewCellIdentifier, for: indexPath) as? ReviewCell
            
            cell?.configureData(noOfMonthsAgo: locationReview.noOfMonthsAgo, reviewDescription: locationReview.reviewDescription, reviewerImage: locationReview.reviewerImage, reviewerName: locationReview.reviewerName, reviewerTimeOnAirbnb: locationReview.reviewerTimeoOnAirbnb)
            
            return cell ?? UICollectionViewCell()
            
            
        default:
            return UICollectionViewCell()
        }
        
    }
    
    
}

extension ExploreLocationDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case imagesCollectionView:
            
            let itemPerRow: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 1 : 1
            let padding: CGFloat = 10
            let totalPadding = padding * (itemPerRow - 1)
            let availableWidth = collectionView.frame.width - totalPadding
            let itemWidth = availableWidth / itemPerRow

            return CGSize(width: itemWidth, height: itemWidth)
            
//        case bedroomCollectionView:
//            return roomsData.count
//        case reviewCollectionView:
//            return 0
            
        default:
            return CGSize()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}
