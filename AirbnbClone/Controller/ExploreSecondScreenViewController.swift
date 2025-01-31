//
//  ExploreSecondScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 09/01/2025.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ExploreSecondScreenViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var ExplorelocationsData: [ExploreLocationData] = [
        
        
    ]
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: K.ExploreCells.NibNames.locationCellNibName, bundle: nil), forCellReuseIdentifier: K.ExploreCells.Identifiers.locationCellIdentifier)
        
        fetchDataFromFirestore()
    }
    
    func fetchDataFromFirestore() {
        
        if let userID = Auth.auth().currentUser?.uid {
            
            guard let listingID = UserDefaults.standard.string(forKey: "Listing ID") else {
                return
            }
            
            db.collection(K.HostYourPlaceCell.FStore.postsField)
                .addSnapshotListener { querySnapshot, error in
                    
                    if let e = error {
                        print("There was an issue retrieving data from Firestore: \(e)")
                        return
                    }
                    
                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            
                            if let price = data[K.HostYourPlaceCell.FStore.NowSetYourPrice.placePriceField] as? String, let locationName = data[K.HostYourPlaceCell.FStore.WhereYourPlaceLocated.placeNameField] as? String, let hostname = data[K.HostYourPlaceCell.FStore.hostNameField] as? String {
                                
                                print(price)
                                
                                let newData = ExploreLocationData(images: ["hotelroomimage1", "hotelroomimage2", "hotelroomimage3", "hotelroomimage4"], locationName: locationName, hosterName: hostname, availableDates: ["28 Feb", "6 March"], price: price, dateNightTime: "night", rating: "4.98")
                                self.ExplorelocationsData.append(newData)
                                
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

extension ExploreSecondScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExplorelocationsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let locationData = ExplorelocationsData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.ExploreCells.Identifiers.locationCellIdentifier, for: indexPath) as? LocationCell
        
        cell?.configureCell(images: locationData.images, placeName: locationData.locationName, placeHosterName: locationData.hosterName, availableDates: locationData.availableDates, priceOfPlace: locationData.price, dayTime: locationData.dateNightTime, rating: locationData.rating)
        
        return cell ?? UITableViewCell()
        
    }
    
}

extension ExploreSecondScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let locationData = ExplorelocationsData[indexPath.row]
        
        self.performSegue(withIdentifier: K.ExploreCells.Segue.ExploreSecondScreenToExploreLocationDataSegue, sender: self)
        
        
    }
    
}

