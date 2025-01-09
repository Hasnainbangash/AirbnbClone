//
//  ExploreSecondScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 09/01/2025.
//

import UIKit

class ExploreSecondScreenViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var ExplorelocationsData: [ExploreLocationData] = [
        
        ExploreLocationData(locationName: "Barrio Melos, Brazil", hosterName: "Kellen", availableDates: ["28 Feb", "6 March"], price: "$232", dateNightTime: "night", rating: "4.98"),
        ExploreLocationData(locationName: "Barrio Melos, Brazil", hosterName: "Kellen", availableDates: ["28 Feb", "6 March"], price: "$232", dateNightTime: "night", rating: "4.98"),
        ExploreLocationData(locationName: "Barrio Melos, Brazil", hosterName: "Kellen", availableDates: ["28 Feb", "6 March"], price: "$232", dateNightTime: "night", rating: "4.98"),
        ExploreLocationData(locationName: "Barrio Melos, Brazil", hosterName: "Kellen", availableDates: ["28 Feb", "6 March"], price: "$232", dateNightTime: "night", rating: "4.98")
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: K.ExploreCells.NibNames.locationCellNibName, bundle: nil), forCellReuseIdentifier: K.ExploreCells.Identifiers.locationCellIdentifier)
    }
    

}

extension ExploreSecondScreenViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExplorelocationsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let locationData = ExplorelocationsData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.ExploreCells.Identifiers.locationCellIdentifier, for: indexPath) as? LocationCell
        
        cell?.configureCell(placeName: locationData.locationName, placeHosterName: locationData.hosterName, availableDates: locationData.availableDates, priceOfPlace: locationData.price, dayTime: locationData.dateNightTime, rating: locationData.rating)
        
        return cell ?? UITableViewCell()
        
    }
    
}

extension ExploreSecondScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
}

