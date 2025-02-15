//
//  WishlistsScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 07/01/2025.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class WishlistsScreenViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var wishlistLocationData: [WishlistLocationData] = [
        
        
    ]
    
    var listingID: String?
    
    let db = Firestore.firestore()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchDataFromFirestore()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: K.WishlistScreenCell.NibNames.wishlistHeaderCellNibName, bundle: nil), forCellReuseIdentifier: K.WishlistScreenCell.Identifiers.wishlistHeaderCellIdentifier)
        tableView.register(UINib(nibName: K.ExploreCells.NibNames.locationCellNibName, bundle: nil), forCellReuseIdentifier: K.ExploreCells.Identifiers.locationCellIdentifier)
        
        // fetchDataFromFirestore()
    }
    
    func fetchDataFromFirestore() {
        
        wishlistLocationData.removeAll()
        tableView.reloadData()
        
        print("--------------------------------------")
        print("Fetching the data from firestore in wishlist screen")
        
        if let userID = Auth.auth().currentUser?.uid {
            
            guard let listingID = UserDefaults.standard.string(forKey: "Listing ID") else {
                return
            }
            
            db.collection(K.HostYourPlaceCell.FStore.postsField)
                .order(by: K.HostYourPlaceCell.FStore.dateField, descending: true)
                .addSnapshotListener { querySnapshot, error in
                    
                    if let e = error {
                        print("There was an issue retrieving data from Firestore: \(e)")
                        return
                    }
                    
                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            
                            if let isFavourate = data[K.HostYourPlaceCell.FStore.isFavourateField] as? Bool, isFavourate == true {
                                
                                if let price = data[K.HostYourPlaceCell.FStore.NowSetYourPrice.placePriceField] as? String, let locationName = data[K.HostYourPlaceCell.FStore.WhereYourPlaceLocated.placeNameField] as? String, let hostname = data[K.HostYourPlaceCell.FStore.hostNameField] as? String, let rating = data[K.HostYourPlaceCell.FStore.ratingField] as? String {
                                    
                                    let listingID = doc.documentID
                                    
                                    print(price)
                                    
                                    let images = ["hotelroomimage3", "hotelroomimage5", "hotelroomimage1", "hotelroomimage4", "hotelroomimage2", "hotelroomimage6", "hotelroomimage7", "hotelroomimage8", "hotelroomimage9", "hotelroomimage10", "hotelroomimage11"]
                                    let suffleImage = Array(images.shuffled().prefix(5))
                                    
                                    let newData = WishlistLocationData(listingID: listingID, images: suffleImage, locationName: locationName, hosterName: hostname, availableDates: ["28 Feb", "6 March"], price: price, dateNightTime: "night", rating: rating)
                                    self.wishlistLocationData.append(newData)
                                    
                                    DispatchQueue.main.async {
                                        self.tableView.reloadData()
                                    }
                                    
                                }
                            }
                        }
                    }
                }
        }
        
    }
    
}

extension WishlistsScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishlistLocationData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < wishlistLocationData.count {
            let locationData = wishlistLocationData[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: K.ExploreCells.Identifiers.locationCellIdentifier, for: indexPath) as? LocationCell
            
            cell?.configureCell(images: locationData.images, placeName: locationData.locationName, placeHosterName: locationData.hosterName, availableDates: locationData.availableDates, priceOfPlace: locationData.price, dayTime: locationData.dateNightTime, rating: locationData.rating, listingId: locationData.listingID)
            
            cell?.delegate = self
            
            return cell ?? UITableViewCell()
            
        }
        return UITableViewCell()
    }
    
}

extension WishlistsScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row < wishlistLocationData.count {
            
            let locationData = wishlistLocationData[indexPath.row]
            
            self.listingID = locationData.listingID
            
            self.performSegue(withIdentifier: K.WishlistScreenCell.Segues.wishlistScreenToExploreLocationScreenSegue, sender: self)
            
            self.tableView.deselectRow(at: indexPath, animated: true)
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.WishlistScreenCell.Identifiers.wishlistHeaderCellIdentifier) as? WishlistHeaderCell
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.WishlistScreenCell.Segues.wishlistScreenToExploreLocationScreenSegue {
            if let destinationVC = segue.destination as? ExploreLocationDetailViewController {
                destinationVC.listingID = listingID
            }
        }
    }
    
}

extension WishlistsScreenViewController: LocationCellDelegateProtocol {
    func movingListingID(listingId: String) {
        self.listingID = listingId
        self.performSegue(withIdentifier: K.WishlistScreenCell.Segues.wishlistScreenToExploreLocationScreenSegue, sender: self)
    }
}
