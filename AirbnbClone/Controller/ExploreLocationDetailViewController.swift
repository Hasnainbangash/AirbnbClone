//
//  ExploreLocationDetailViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 10/01/2025.
//

import UIKit
import MapKit
import FirebaseAuth
import FirebaseFirestore

class ExploreLocationDetailViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var likeButtonLabel: UIBarButtonItem!
    @IBOutlet weak var placeTitleName: UILabel!
    @IBOutlet weak var hosterImageView1: UIImageView!
    @IBOutlet weak var hosterImageView2: UIImageView!
    @IBOutlet weak var meetYourHostView: UIView!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var bedroomCollectionView: UICollectionView!
    @IBOutlet weak var reviewCollectionView: UICollectionView!
    @IBOutlet weak var showAllAmentitiesButtonLabel: UIButton!
    @IBOutlet weak var showAllReviewsButtonLabel: UIButton!
    @IBOutlet weak var totalImagesCountLabel: UILabel!
    @IBOutlet weak var totalReviewPercentLabel: UILabel!
    @IBOutlet weak var checkAvailabilityButtonLabel: UIButton!
    
    @IBOutlet weak var anotherLocationName: UILabel!
    @IBOutlet weak var NoOfGuestsBedroomBedBathroom: UILabel!
    @IBOutlet weak var reviewRating: UILabel!
    @IBOutlet weak var reviewAnotherRating: UILabel!
    @IBOutlet weak var hostName: UILabel!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var hostAnotherName: UILabel!
    
    var images: [String] = ["hotelroomimage7", "hotelroomimage8", "hotelroomimage9", "hotelroomimage10"]
    
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
    
    let db = Firestore.firestore()
    
    var listingID: String?
    
    var isFavourate: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
        imagesCollectionView.isPagingEnabled = true
        
        bedroomCollectionView.dataSource = self
        bedroomCollectionView.delegate = self
        
        reviewCollectionView.dataSource = self
        reviewCollectionView.delegate = self
        
        scrollView.delegate = self
        navigationBar.isHidden = false
        
        mapView.delegate = self
        
        imagesCollectionView.register(UINib(nibName: K.ExploreLocationDetailCells.NibNames.locationImagesCellNibName, bundle: nil), forCellWithReuseIdentifier: K.ExploreLocationDetailCells.Identifiers.locationImagesCellIdentifier)
        
        bedroomCollectionView.register(UINib(nibName: K.ExploreLocationDetailCells.NibNames.bedroomCellNibName, bundle: nil), forCellWithReuseIdentifier: K.ExploreLocationDetailCells.Identifiers.bedroomCellIdentifier)
        
        reviewCollectionView.register(UINib(nibName: K.ExploreLocationDetailCells.NibNames.reviewCellNibName, bundle: nil), forCellWithReuseIdentifier: K.ExploreLocationDetailCells.Identifiers.reviewCellIdentifier)
        
        // Set total images count
        totalImagesCountLabel.text = "1 / \(images.count)"
        
        setupCornerRadius()
        setupBorderRadius()
        setupBorderShadow()
        
        print(listingID ?? "No lisitng ID")
        fetchDataFromFirestore()
        
    }
    
    func setupCornerRadius() {
        hosterImageView1.layer.cornerRadius = hosterImageView1.frame.height / 2
        
        hosterImageView2.layer.cornerRadius = hosterImageView2.frame.height / 2
        
        meetYourHostView.layer.cornerRadius = meetYourHostView.frame.height / 2
        
        showAllAmentitiesButtonLabel.layer.cornerRadius = showAllAmentitiesButtonLabel.frame.height / 4
        
        showAllReviewsButtonLabel.layer.cornerRadius = showAllReviewsButtonLabel.frame.height / 4
        
        meetYourHostView.layer.cornerRadius = meetYourHostView.frame.height / 8
        
        checkAvailabilityButtonLabel.layer.cornerRadius = checkAvailabilityButtonLabel.frame.height / 5
    }
    
    func setupBorderRadius() {
        showAllAmentitiesButtonLabel.layer.borderWidth = 0.7
        showAllReviewsButtonLabel.layer.borderWidth = 0.7
        meetYourHostView.layer.borderWidth = 5.0
        meetYourHostView.layer.borderColor = UIColor.white.cgColor
    }
    
    func setupBorderShadow() {
        // Shadow settings
        meetYourHostView.layer.shadowColor = UIColor.black.cgColor  // Shadow color
        meetYourHostView.layer.shadowOpacity = 0.1 // Shadow opacity (0.0 to 1.0)
        meetYourHostView.layer.shadowOffset = CGSize(width: 0, height: 5) // Shadow offset (you can change this)
        meetYourHostView.layer.shadowRadius = 3 // Shadow blur radius (the higher the more blur)
        
        // Make the shadow more "realistic" by enabling shadow path
        meetYourHostView.layer.masksToBounds = false // Important for shadow to appear outside bounds
        meetYourHostView.layer.shadowPath = UIBezierPath(rect: meetYourHostView.bounds).cgPath
    }
    
    func fetchDataFromFirestore() {
        
        if let listingID = listingID {
            
            db.collection(K.HostYourPlaceCell.FStore.postsField)
                .document(listingID)
                .addSnapshotListener { querySnapshot, error in
                    
                    if let e = error {
                        print("There was an issue retrieving data from Firestore: \(e)")
                        return
                    }
                    
                    if let snapshotDocuments = querySnapshot {
                        let data = snapshotDocuments.data()
                        
                        if let hostName = data?[K.HostYourPlaceCell.FStore.hostNameField] as? String,
                           let locationName = data?[K.HostYourPlaceCell.FStore.WhereYourPlaceLocated.placeNameField] as? String,
                           let reviewRating = data?[K.HostYourPlaceCell.FStore.ratingField] as? String,
                           let NoOfGuests = data?[K.HostYourPlaceCell.FStore.ShareSomeBasicAboutYourPlace.numberOfGuestsField] as? Int,
                           let NoOfBedrooms = data?[K.HostYourPlaceCell.FStore.ShareSomeBasicAboutYourPlace.numberOfBedroomsField] as? Int,
                           let NoOfBeds = data?[K.HostYourPlaceCell.FStore.ShareSomeBasicAboutYourPlace.numberOfBedsField] as? Int,
                           let NoOfBathrooms = data?[K.HostYourPlaceCell.FStore.ShareSomeBasicAboutYourPlace.numberOfBathroomsField] as? Int,
                           let locationLatitude = data?[K.HostYourPlaceCell.FStore.WhereYourPlaceLocated.placeLatitudeField] as? Double,
                           let locationLongitude = data?[K.HostYourPlaceCell.FStore.WhereYourPlaceLocated.placeLongitudeField] as? Double,
                           let placeName = data?[K.HostYourPlaceCell.FStore.NowLetsGiveYourCasaATitle.placeTitleField] as? String,
                           let isFavourate = data?[K.HostYourPlaceCell.FStore.isFavourateField] as? Bool {
                            
                            DispatchQueue.main.async {
                                self.placeTitleName.text = placeName
                                self.hostName.text = hostName
                                self.locationName.text = locationName
                                self.hostAnotherName.text = hostName
                                self.totalReviewPercentLabel.text = reviewRating
                                self.anotherLocationName.text = "Farm stay in \(locationName)"
                                self.NoOfGuestsBedroomBedBathroom.text = "\(NoOfGuests) Guests. \(NoOfBedrooms) Bedrooms. \(NoOfBeds) Beds. \(NoOfBathrooms) Bathrooms."
                                self.reviewRating.text = "\(reviewRating) ."
                                self.reviewAnotherRating.text = "\(reviewRating) ."
                                self.showLocationOnMap(latitude: locationLatitude, longitude: locationLongitude)
                                
                                self.isFavourate = isFavourate
                                
                                if isFavourate == true {
                                    self.likeButtonLabel.image = UIImage(systemName: "heart.circle.fill")
                                } else {
                                    self.likeButtonLabel.image = UIImage(systemName: "heart.circle")
                                }
                                
                            }
                            
                        }
                    }
                }
        }
        
    }
    
    func showLocationOnMap(latitude: Double, longitude: Double) {
        
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let clLocation = CLLocation(latitude: latitude, longitude: longitude)
        
        addRadiusCircle(location: clLocation)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "Exact location provided after booking."
        
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(pin)
        
        let region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 20000,
            longitudinalMeters: 20000
        )
        
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func likeButtonPressed(_ sender: UIBarButtonItem) {
        
        if let listingID = listingID {
            
            isFavourate.toggle()
            
            if isFavourate == true {
                likeButtonLabel.image = UIImage(systemName: "heart.circle.fill")
            } else {
                likeButtonLabel.image = UIImage(systemName: "heart.circle")
            }
            
            db.collection(K.HostYourPlaceCell.FStore.postsField)
                .document(listingID)
                .updateData([
                    K.HostYourPlaceCell.FStore.isFavourateField : isFavourate
                ]) { error in
                    if let e = error {
                        print("There was an issue saving data to Firestore: \(e.localizedDescription)")
                    } else {
                        print("Successfully saved favourate location to Firestore.")
                    }
                }
            
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

private var previousOffset: CGFloat = 0

extension ExploreLocationDetailViewController: UIScrollViewDelegate {

    // Tracking the behaviour of scrolling
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        
        // Here hiding navigation bar as scrolling down
        if currentOffset > previousOffset {
            hideNavigationBar()
        }
        // Here showing navigation bar as scrolling up
        else if currentOffset < previousOffset {
            showNavigationBar()
        }
        
        previousOffset = currentOffset
    }

    // Function to hide the navigation bar
    func hideNavigationBar() {
        UIView.animate(withDuration: 0.3) {
            self.navigationBar.alpha = 0
        }
        self.navigationBar.isHidden = true
    }

    // Function to show the navigation bar
    func showNavigationBar() {
        UIView.animate(withDuration: 0.3) {
            self.navigationBar.alpha = 1
        }
        self.navigationBar.isHidden = false
    }
}

extension ExploreLocationDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case imagesCollectionView:
            let suffleImages = Array(images.shuffled().prefix(5))
            return suffleImages.count
        case bedroomCollectionView:
            return roomsData.count
        case reviewCollectionView:
            return locationReviewData.count
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
            
        case bedroomCollectionView:
            
            let itemPerRow: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 2 : 2
            let padding: CGFloat = 10
            let totalPadding = padding * (itemPerRow - 1)
            let availableWidth = collectionView.frame.width - totalPadding
            let itemWidth = availableWidth / itemPerRow

            return CGSize(width: itemWidth, height: itemWidth)
            
            
        case reviewCollectionView:
            
            let itemPerRow: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 2 : 2
            let padding: CGFloat = 10
            let totalPadding = padding * (itemPerRow - 1)
            let availableWidth = collectionView.frame.width - totalPadding
            let itemWidth = availableWidth / itemPerRow

            return CGSize(width: itemWidth, height: itemWidth)
            
        default:
            return CGSize()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case imagesCollectionView:
            return 0
        case bedroomCollectionView:
            return 15
//        case reviewCollectionView:
//            return locationReviewData.count
        default:
            return 0
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if scrollView == imagesCollectionView {
            // Get the current index after scrolling stops
            let currentIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
            
            // Update the totalImagesCountLabel to show the current image index (1-based index)
            totalImagesCountLabel.text = "\(currentIndex + 1) / \(images.count)"
        }
        
    }
    
}

extension ExploreLocationDetailViewController: MKMapViewDelegate {
    
    func addRadiusCircle(location: CLLocation){
        self.mapView.delegate = self
        let circle = MKCircle(center: location.coordinate, radius: 5000 as CLLocationDistance)
        self.mapView.addOverlay(circle)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKCircle {
            let circle = MKCircleRenderer(overlay: overlay)
            circle.strokeColor = UIColor.red
            circle.fillColor = UIColor.red.withAlphaComponent(0.1)
            circle.lineWidth = 1
            return circle
        }
        return MKOverlayRenderer()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        // Create and tint the image
        let image = UIImage(systemName: "house.circle.fill")
        let tintedImage = image?.withTintColor(UIColor(red: 219/255, green: 12/255, blue: 100/255, alpha: 1))
        
        // Resize the tinted image
        let size = CGSize(width: 60, height: 60)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        tintedImage?.draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        annotationView?.image = resizedImage
        annotationView?.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        return annotationView
    }
    
}
