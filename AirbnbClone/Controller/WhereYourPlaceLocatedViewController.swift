//
//  WhereYourPlaceLocatedViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 23/01/2025.
//

import UIKit
import MapKit

class WhereYourPlaceLocatedViewController: UIViewController {

    @IBOutlet weak var saveAndExitButtonLabel: UIButton!
    @IBOutlet weak var questionsButtonLabel: UIButton!
    @IBOutlet weak var backButtonLabel: UIButton!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    @IBOutlet weak var enterYourAddressView: UIView!
    @IBOutlet weak var enterYourAddressTextField: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!
    
    private let searchResultsTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isHidden = true
        table.layer.cornerRadius = 10
        table.layer.masksToBounds = true
        return table
    }()
    
    private let searchCompleter = MKLocalSearchCompleter()
    private var searchResults: [MKLocalSearchCompletion] = []
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.transitioningDelegate = self
        
        enterYourAddressTextField.delegate = self
        
        searchCompleter.delegate = self
        
        setupSearchResultsTableView()
        setupLocationManager()
        setupCornerRadius()
        setupBorderWidth()
        setupButtonUnderline()
    }
    
    private func setupSearchResultsTableView() {
        view.addSubview(searchResultsTableView)
        
        // Setup table view constraints
        NSLayoutConstraint.activate([
            searchResultsTableView.topAnchor.constraint(equalTo: enterYourAddressView.bottomAnchor, constant: 8),
            searchResultsTableView.leadingAnchor.constraint(equalTo: enterYourAddressView.leadingAnchor),
            searchResultsTableView.trailingAnchor.constraint(equalTo: enterYourAddressView.trailingAnchor),
            searchResultsTableView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        searchResultsTableView.delegate = self
        searchResultsTableView.dataSource = self
        searchResultsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "LocationCell")
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func setupCornerRadius() {
        saveAndExitButtonLabel.layer.cornerRadius = saveAndExitButtonLabel.frame.height / 2
        questionsButtonLabel.layer.cornerRadius = questionsButtonLabel.frame.height / 2
        nextButtonLabel.layer.cornerRadius = nextButtonLabel.frame.height / 5
        
        enterYourAddressView.layer.cornerRadius = enterYourAddressView.frame.height / 2
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
    
    @IBAction func currentLocationButtonPressed(_ sender: UIButton) {
        print("Location button pressed")
        locationManager.requestLocation()
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension WhereYourPlaceLocatedViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideOutToLeftAnimator() // Use our custom animator for sliding out to the left
    }
    
}

// MARK: - UITextFieldDelegate
extension WhereYourPlaceLocatedViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
        searchCompleter.queryFragment = newText
        
        searchResultsTableView.isHidden = newText.isEmpty
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        searchResultsTableView.isHidden = true
        
        if let query = textField.text, !query.isEmpty {
            performSearch(query: query)
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            searchResultsTableView.isHidden = false
        }
    }
    
}

extension WhereYourPlaceLocatedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)
        let searchResult = searchResults[indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = searchResult.title
        config.secondaryText = searchResult.subtitle
        cell.contentConfiguration = config
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let completion = searchResults[indexPath.row]
        let searchRequest = MKLocalSearch.Request(completion: completion)
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { [weak self] response, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Selection error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response,
                  let firstItem = response.mapItems.first else { return }
            
            self.enterYourAddressTextField.text = completion.title
            self.searchResultsTableView.isHidden = true
            self.updateMap(with: firstItem)
        }
    }
}

extension WhereYourPlaceLocatedViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        case .denied, .restricted:
            print("Location permission denied.")
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.last else { return }
        
        locationManager.stopUpdatingLocation()
        currentLocation = userLocation.coordinate
        
        let pin = MKPointAnnotation()
        pin.coordinate = userLocation.coordinate
        pin.title = "Current Location"
        
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(pin)
        
        let region = MKCoordinateRegion(
            center: userLocation.coordinate,
            latitudinalMeters: 5000,
            longitudinalMeters: 5000
        )
        
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager error: \(error.localizedDescription)")
    }
    
}

extension WhereYourPlaceLocatedViewController: MKLocalSearchCompleterDelegate {
    
    func performSearch(query: String) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = query
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { response, error in
            
            if let e = error {
                print(e.localizedDescription)
                return
            }
            
            guard let response = response else { return }
            
            self.mapView.removeAnnotations(self.mapView.annotations)
            
            if let location = response.mapItems.last {
                
                let pin = MKPointAnnotation()
                pin.title = location.name
                pin.coordinate = location.placemark.coordinate
                self.mapView.addAnnotation(pin)
                
                let region = MKCoordinateRegion(
                    center: location.placemark.coordinate,
                    latitudinalMeters: 5000,
                    longitudinalMeters: 5000
                )
                
                self.mapView.setRegion(region, animated: true)
                
            }
        }
    }
       
    private func updateMap(with mapItem: MKMapItem) {
        let pin = MKPointAnnotation()
        pin.title = mapItem.name
        pin.coordinate = mapItem.placemark.coordinate
        
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(pin)
        
        let region = MKCoordinateRegion(
            center: mapItem.placemark.coordinate,
            latitudinalMeters: 5000,
            longitudinalMeters: 5000
        )
        
        mapView.setRegion(region, animated: true)
    }
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        searchResultsTableView.reloadData()
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print("Search completer error: \(error.localizedDescription)")
    }
    
}
