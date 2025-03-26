//
//  ExploreSecondScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 09/01/2025.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import NVActivityIndicatorView

class ExploreSecondScreenViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ExplorelocationsData: [ExploreLocationData] = [
        
        
    ]
    
    var listingID: String?
    
    let db = Firestore.firestore()
    
    var activityIndicator: NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        
        tableView.register(UINib(nibName: K.ExploreCells.NibNames.locationCellNibName, bundle: nil), forCellReuseIdentifier: K.ExploreCells.Identifiers.locationCellIdentifier)
        
        setupActivityIndicator()
        fetchDataFromFirestore()
    }
    
    func setupActivityIndicator() {
        // Create and configure the activity indicator
        let size: CGFloat = 50.0
        let frame = CGRect(x: (view.frame.width - size) / 2, y: (view.frame.height - size) / 2, width: size, height: size)
        activityIndicator = NVActivityIndicatorView(frame: frame, type: .ballSpinFadeLoader, color: UIColor(red: 228/255, green: 29/255, blue: 86/255, alpha: 1), padding: 0)
        
        // Add activity indicator to the view
        view.addSubview(activityIndicator)
    }
    
    func fetchDataFromFirestore() {
        
        activityIndicator.startAnimating()
        
        if let userID = Auth.auth().currentUser?.uid {
            
            guard let listingID = UserDefaults.standard.string(forKey: "Listing ID") else {
                return
            }
            
            db.collection(K.HostYourPlaceCell.FStore.postsField)
                .order(by: K.HostYourPlaceCell.FStore.dateField, descending: true)
                .addSnapshotListener { querySnapshot, error in
                    
                    if let e = error {
                        print("There was an issue retrieving data from Firestore: \(e)")
                        self.activityIndicator.stopAnimating()
                        return
                    }
                    
                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            
                            if let price = data[K.HostYourPlaceCell.FStore.NowSetYourPrice.placePriceField] as? String, let locationName = data[K.HostYourPlaceCell.FStore.WhereYourPlaceLocated.placeNameField] as? String, let hostname = data[K.HostYourPlaceCell.FStore.hostNameField] as? String, let rating = data[K.HostYourPlaceCell.FStore.ratingField] as? String {
                                
                                let listingID = doc.documentID
                                
                                print(price)
                                
                                let images = ["hotelroomimage3", "hotelroomimage5", "hotelroomimage1", "hotelroomimage4", "hotelroomimage2", "hotelroomimage6", "hotelroomimage7", "hotelroomimage8", "hotelroomimage9", "hotelroomimage10", "hotelroomimage11"]
                                let suffleImage = Array(images.shuffled().prefix(5))
                                
                                let newData = ExploreLocationData(listingID: listingID, images: suffleImage, locationName: locationName, hosterName: hostname, availableDates: ["28 Feb", "6 March"], price: price, dateNightTime: "night", rating: rating)
                                self.ExplorelocationsData.append(newData)
                                
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                                
                            }
                        }
                    }
                    
                    self.activityIndicator?.stopAnimating()
                    
                }
        }
        
    }
    
}

extension ExploreSecondScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExplorelocationsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let locationData = ExplorelocationsData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.ExploreCells.Identifiers.locationCellIdentifier, for: indexPath) as? LocationCell
        
        cell?.configureCell(images: locationData.images, placeName: locationData.locationName, placeHosterName: locationData.hosterName, availableDates: locationData.availableDates, priceOfPlace: locationData.price, dayTime: locationData.dateNightTime, rating: locationData.rating, listingId: locationData.listingID)
        
        cell?.delegate = self
        
        return cell ?? UITableViewCell()
        
    }
    
}

extension ExploreSecondScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let locationData = ExplorelocationsData[indexPath.row]
        self.listingID = locationData.listingID
        
        // Added the animations of the skrink to the table view cell
        UIView.animate(withDuration: 0.3, animations: {
            tableView.cellForRow(at: indexPath)?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                tableView.cellForRow(at: indexPath)?.transform = .identity
            }
            
            self.performSegue(withIdentifier: K.ExploreCells.Segue.ExploreSecondScreenToExploreLocationDataSegue, sender: self)
        }
        
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.ExploreCells.Segue.ExploreSecondScreenToExploreLocationDataSegue {
            if let destinationVC = segue.destination as? ExploreLocationDetailViewController {
                destinationVC.listingID = listingID
            }
        }
    }
    
}

extension ExploreSecondScreenViewController: LocationCellDelegateProtocol {
    func movingListingID(listingId: String) {
        self.listingID = listingId
        self.performSegue(withIdentifier: K.ExploreCells.Segue.ExploreSecondScreenToExploreLocationDataSegue, sender: self)
    }
}

