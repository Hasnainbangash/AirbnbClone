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
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.transitioningDelegate = self
        
        enterYourAddressTextField.delegate = self
        
        setupLocationManager()
        setupCornerRadius()
        setupBorderWidth()
        setupButtonUnderline()
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

extension WhereYourPlaceLocatedViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Perform the search when the user presses "Enter"
        if let query = textField.text, !query.isEmpty {
            performSearch(query: query)
        }
        
        // Dismiss the keyboard
        textField.resignFirstResponder()
        
        return true
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
        self.currentLocation = userLocation.coordinate
        
        let region = MKCoordinateRegion(
            center: userLocation.coordinate,
            latitudinalMeters: 5000,
            longitudinalMeters: 5000
        )
        
        mapView.setRegion(region, animated: true)
        
        mapView.removeAnnotations(mapView.annotations)
        
        let pin = MKPointAnnotation()
        pin.coordinate = userLocation.coordinate
        pin.title = "Current Location"
        mapView.addAnnotation(pin)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("-----------------------------------------")
        print(error)
        print("-----------------------------------------")
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
    
}
