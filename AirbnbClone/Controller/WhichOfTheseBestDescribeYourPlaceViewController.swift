//
//  WhichOfTheseBestDescribeYourPlaceViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 23/01/2025.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class WhichOfTheseBestDescribeYourPlaceViewController: UIViewController {

    @IBOutlet weak var saveAndExitButtonLabel: UIButton!
    @IBOutlet weak var questionsButtonLabel: UIButton!
    @IBOutlet weak var backButtonLabel: UIButton!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let db = Firestore.firestore()
    
    var selectedPlaceName: String?
    
    var rating: String?
    var hostName: String?
    
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
        DescribeYourPlace(placeImageName: "building", placeName: "Hotel"),
        DescribeYourPlace(placeImageName: "sailboat", placeName: "Houseboat"),
        DescribeYourPlace(placeImageName: "tent", placeName: "Kezhan"),
        DescribeYourPlace(placeImageName: "tent.2", placeName: "Minsu"),
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
        
        self.transitioningDelegate = self
        
        nextButtonLabel.isEnabled = false
        nextButtonLabel.backgroundColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)
        nextButtonLabel.tintColor = UIColor.white
        
        collectionView.register(
            UINib(nibName: K.HostYourPlaceCell.NibNames.describeYourPlaceheaderCellNibName, bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: K.HostYourPlaceCell.Identifiers.describeYourPlaceheaderCellIdentifier
        )
        
        collectionView.register(UINib(nibName: K.HostYourPlaceCell.NibNames.describeYourPlaceCollectionCellNibName, bundle: nil), forCellWithReuseIdentifier: K.HostYourPlaceCell.Identifiers.describeYourPlaceCollectionCellIdentifier)
        
        randomSetupForRatingAndHostName()
        setupCornerRadius()
        setupBorderWidth()
        setupButtonUnderline()
    }
    
    func randomSetupForRatingAndHostName() {
        rating = String(format: "%.2f", Float.random(in: 0.0...5.0))
        let names = ["John", "Bob", "Charlie", "David", "Michael", "Jimmy", "Trevor", "Franklin", "Tommy Vercette"]
        hostName = names.randomElement()
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
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func nextButtonPressed(_ sender: UIButton) {
        print("Next Button is pressed")
        
        if let userID = Auth.auth().currentUser?.uid, let placeName = selectedPlaceName, let placeHostName = hostName, let placeRating = rating {
            
            guard let listingID = UserDefaults.standard.string(forKey: "Listing ID") else {
                return
            }
            
            print(listingID)
            
            db.collection(K.HostYourPlaceCell.FStore.postsField)
                .document(listingID)
                .setData([
                K.HostYourPlaceCell.FStore.userIDField : userID,
                K.HostYourPlaceCell.FStore.hostNameField : placeHostName,
                K.HostYourPlaceCell.FStore.ratingField : placeRating,
                K.HostYourPlaceCell.FStore.WhichOfTheseBestDescribeYourPlace.bestDescribeYourPlaceNameField : placeName,
                K.HostYourPlaceCell.FStore.dateField : Date().timeIntervalSince1970
            ]) { error in
                if let e = error {
                    print("There was an issue saving data to Firestore, \(e.localizedDescription)")
                } else {
                    print("Successfully saved place description to Firestore.")
                    self.performSegue(withIdentifier: K.HostYourPlaceCell.Segues.whichOfTheseBestDescribeYourPlaceToWhichTypeOfPlaceGuestHaveSegue, sender: self)
                }
            }
            
            /*
             
             let listingID = UUID().uuidString
             UserDefaults.standard.set(listingID, forKey: "Listing ID")
             print(listingID)
             
             db.collection(K.HostYourPlaceCell.FStore.postsField)
                 .document(userID)
                 .collection(K.HostYourPlaceCell.FStore.WhichOfTheseBestDescribeYourPlace.placeDescriptionField)
                 .document(listingID)
                 .setData([
                 K.HostYourPlaceCell.FStore.userIDField : userID,
                 K.HostYourPlaceCell.FStore.WhichOfTheseBestDescribeYourPlace.bestDescribeYourPlaceNameField : placeName,
                 K.HostYourPlaceCell.FStore.dateField : Date().timeIntervalSince1970,
             ]) { error in
                 if let e = error {
                     print("There was an issue saving data to Firestore, \(e.localizedDescription)")
                 } else {
                     print("Successfully saved place description to Firestore.")
                     self.performSegue(withIdentifier: K.HostYourPlaceCell.Segues.whichOfTheseBestDescribeYourPlaceToWhichTypeOfPlaceGuestHaveSegue, sender: self)
                 }
             }
            
            db.collection(K.HostYourPlaceCell.FStore.placeDescriptionField).addDocument(data: [
                K.HostYourPlaceCell.FStore.userIDField : userID,
                K.HostYourPlaceCell.FStore.bestDescribeYourPlaceNameField : placeName,
                K.HostYourPlaceCell.FStore.dateField : Date().timeIntervalSince1970,
            ]) { error in
                if let e = error {
                    print("There was an issue saving data to Firestore, \(e.localizedDescription)")
                } else {
                    print("Successfully saved place description to Firestore.")
                    self.performSegue(withIdentifier: K.HostYourPlaceCell.Segues.whichOfTheseBestDescribeYourPlaceToWhichTypeOfPlaceGuestHaveSegue, sender: self)
                }
            }
             
            */
            
        }
        
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: K.HostYourPlaceCell.Identifiers.describeYourPlaceheaderCellIdentifier, for: indexPath) as? DescribeYourPlaceHeaderCell
            
            return headerView ?? UICollectionViewCell()
            
        }
        
        return UICollectionReusableView()
        
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 120)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? DescribeYourPlaceCollectionCell {
            cell.mainView.layer.borderWidth = 2
            cell.mainView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
            cell.isSelected = true
            
            let selectedPlace = describeYourPlace[indexPath.row]
            self.selectedPlaceName = selectedPlace.placeName
        }
        
        // Enable the next button when a cell is selected
        nextButtonLabel.isEnabled = true
        nextButtonLabel.backgroundColor = UIColor.black
        nextButtonLabel.tintColor = UIColor.white
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? DescribeYourPlaceCollectionCell {
            cell.mainView.layer.borderWidth = 0.4
            cell.mainView.backgroundColor = UIColor.white
            cell.isSelected = false
        }
        
        // Disable the next button if no cells are selected
        if collectionView.indexPathsForSelectedItems?.isEmpty ?? true {
            nextButtonLabel.isEnabled = false
            nextButtonLabel.backgroundColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)
            nextButtonLabel.tintColor = UIColor.white
        }
        
    }
    
}

extension WhichOfTheseBestDescribeYourPlaceViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideOutToLeftAnimator() // Use our custom animator for sliding out to the left
    }
    
}
