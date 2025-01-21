//
//  ExploreScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 08/01/2025.
//

import UIKit
import FloatingPanel
import MapKit
import CoreLocation

// Custom Layout for Floating Panel
class CustomPanelLayout: FloatingPanelLayout {
    weak var viewController: ExploreScreenViewController?
    
    init(viewController: ExploreScreenViewController) {
        self.viewController = viewController
    }
    
    var position: FloatingPanelPosition = .bottom
    var initialState: FloatingPanelState = .tip
    
    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return [
            .full: FloatingPanelLayoutAnchor(absoluteInset: viewController?.heightForBottomSheet() ?? 0, edge: .top, referenceGuide: .safeArea),
            .half: FloatingPanelLayoutAnchor(fractionalInset: 0.5, edge: .bottom, referenceGuide: .safeArea),
            .tip: FloatingPanelLayoutAnchor(fractionalInset: 0.1, edge: .bottom, referenceGuide: .safeArea)
        ]
    }
    
    func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
        return 0.0
    }
}

class ExploreScreenViewController: UIViewController {

    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var settingButtonLabel: UIButton!
    
    @IBOutlet weak var searchCollectionVIewStackView: UIStackView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var fpc: FloatingPanelController?
    
    var exploreCategories: [ExploreCategories] = [
        
        ExploreCategories(categoryName: "Lake", categoryImage: "water.waves"),
        ExploreCategories(categoryName: "Icons", categoryImage: "line.horizontal.star.fill.line.horizontal"),
        ExploreCategories(categoryName: "Arctic", categoryImage: "snowflake"),
        ExploreCategories(categoryName: "Islands", categoryImage: "sun.haze"),
        ExploreCategories(categoryName: "Top cities", categoryImage: "building.2"),
        ExploreCategories(categoryName: "Design", categoryImage: "house.and.flag"),
        ExploreCategories(categoryName: "Rooms", categoryImage: "bed.double"),
        ExploreCategories(categoryName: "Amazing Views", categoryImage: "window.casement"),
        ExploreCategories(categoryName: "Mansions", categoryImage: "building.columns"),
        ExploreCategories(categoryName: "Tropical", categoryImage: "tree"),
        ExploreCategories(categoryName: "Tiny homes", categoryImage: "house"),
        ExploreCategories(categoryName: "OMG!", categoryImage: "manatsign.bank.building"),
        ExploreCategories(categoryName: "Trending", categoryImage: "flame"),
        ExploreCategories(categoryName: "Earth homes", categoryImage: "house"),
        ExploreCategories(categoryName: "Castles", categoryImage: "building.columns"),
        ExploreCategories(categoryName: "Bed & breakfasts", categoryImage: "cup.and.heat.waves"),
        ExploreCategories(categoryName: "Camping", categoryImage: "tent"),
        ExploreCategories(categoryName: "Historical homes", categoryImage: "building.columns"),
        ExploreCategories(categoryName: "Cabins", categoryImage: "house"),
        ExploreCategories(categoryName: "A-frames", categoryImage: "tent.2"),
        ExploreCategories(categoryName: "Countryside", categoryImage: "cloud.sun"),
        ExploreCategories(categoryName: "Luxe", categoryImage: "bell.circle"),
        ExploreCategories(categoryName: "Houseboats", categoryImage: "house"),
        ExploreCategories(categoryName: "Riads", categoryImage: "building.columns"),
        ExploreCategories(categoryName: "Containers", categoryImage: "square.grid.3x1.below.line.grid.1x2"),
        ExploreCategories(categoryName: "Barns", categoryImage: "building.columns"),
        ExploreCategories(categoryName: "Top of ther world", categoryImage: "mountain.2"),
        ExploreCategories(categoryName: "National parks", categoryImage: "tree"),
        ExploreCategories(categoryName: "Caves", categoryImage: "mountain.2.circle"),
        ExploreCategories(categoryName: "Amazing pools", categoryImage: "water.waves"),
        ExploreCategories(categoryName: "New", categoryImage: "key.horizontal"),
        ExploreCategories(categoryName: "Farms", categoryImage: "house.lodge"),
        ExploreCategories(categoryName: "Off-the-grid", categoryImage: "square.grid.3x3"),
        ExploreCategories(categoryName: "Cycladic homes", categoryImage: "house"),
        ExploreCategories(categoryName: "Dammusi", categoryImage: "homekit"),
        ExploreCategories(categoryName: "Surfing", categoryImage: "sailboat"),
        ExploreCategories(categoryName: "Yurts", categoryImage: "tent.2"),
        ExploreCategories(categoryName: "Treehouses", categoryImage: "tree"),
        ExploreCategories(categoryName: "Beachfront", categoryImage: "sun.dust"),
        ExploreCategories(categoryName: "Beach", categoryImage: "beach.umbrella"),
        ExploreCategories(categoryName: "Camper vans", categoryImage: "bus.fill"),
        ExploreCategories(categoryName: "Lakefront", categoryImage: "thermometer.and.liquid.waves.snowflake"),
        ExploreCategories(categoryName: "Golfing", categoryImage: "figure.golf"),
        ExploreCategories(categoryName: "Skiing", categoryImage: "line.diagonal"),
        ExploreCategories(categoryName: "Hanoks", categoryImage: "house"),
        ExploreCategories(categoryName: "Vineyards", categoryImage: "tent"),
        ExploreCategories(categoryName: "Chef's kitchen", categoryImage: "hat.cap"),
        ExploreCategories(categoryName: "Windmills", categoryImage: "millsign.bank.building"),
        ExploreCategories(categoryName: "Shepherd's huts", categoryImage: "house"),
        ExploreCategories(categoryName: "Ryokans", categoryImage: "tent"),
        ExploreCategories(categoryName: "Minsus", categoryImage: "house.lodge"),
        ExploreCategories(categoryName: "Domes", categoryImage: "tent.2"),
        ExploreCategories(categoryName: "Desert", categoryImage: "tree"),
        ExploreCategories(categoryName: "Casas particulares", categoryImage: "window.awning"),
        ExploreCategories(categoryName: "Towers", categoryImage: "airport.extreme.tower"),
        ExploreCategories(categoryName: "Adapted", categoryImage: "house.lodge"),
        ExploreCategories(categoryName: "Ski-in/out", categoryImage: "waveform.and.person.filled"),
        ExploreCategories(categoryName: "Play", categoryImage: "figure.cricket"),
        ExploreCategories(categoryName: "Boats", categoryImage: "sailboat"),
        ExploreCategories(categoryName: "Creative spaces", categoryImage: "paintpalette"),
        ExploreCategories(categoryName: "Grand pianos", categoryImage: "pianokeys"),
        ExploreCategories(categoryName: "Trulli", categoryImage: "house")
        
    ]
    
    var mapLocationsData: [MapLocationData] = [
        
        MapLocationData(locationName: "Barrio Melos, Brazil", hosterName: "Kellen", availableDates: ["28 Feb", "6 March"], price: "$232", dateNightTime: "night", rating: "4.98"),
        MapLocationData(locationName: "Barrio Melos, Brazil", hosterName: "Kellen", availableDates: ["28 Feb", "6 March"], price: "$232", dateNightTime: "night", rating: "4.98"),
        MapLocationData(locationName: "Barrio Melos, Brazil", hosterName: "Kellen", availableDates: ["28 Feb", "6 March"], price: "$232", dateNightTime: "night", rating: "4.98"),
        MapLocationData(locationName: "Barrio Melos, Brazil", hosterName: "Kellen", availableDates: ["28 Feb", "6 March"], price: "$232", dateNightTime: "night", rating: "4.98")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        mapView.delegate = self
        
        setupCornerRadius()
        setupBorderWidth()
        setupBorderShadow()
        
        setupFloatingPanel()
        
        addCustomPin(latitute: 40.712742, longitude: -74.006001)
        addCustomPin(latitute: 40.731245, longitude: -73.997115)
        addCustomPin(latitute: 40.732706, longitude: -74.035835)
        addCustomPin(latitute: 40.707320, longitude: -74.037380)

    }
    
    deinit {
        fpc?.removePanelFromParent(animated: true)
    }
    
    func setupFloatingPanel() {
        // Initialize the FloatingPanelController object.
        fpc = FloatingPanelController()
        fpc?.delegate = self
        
        let layout = CustomPanelLayout(viewController: self)
        fpc?.layout = layout
        
        // Create the content view controller from storyboard
        let contentVC = storyboard?.instantiateViewController(withIdentifier: K.ExploreCells.Segue.ExploreScreenToBottomSheetSegue) as? ExploreSecondScreenViewController
        
        // Set the content view controller for the floating panel
        fpc?.set(contentViewController: contentVC)
        
        // Add the floating panel to the parent view
        fpc?.addPanel(toParent: self)
        
        fpc?.move(to: .full, animated: true)
        
        // Customize the floating panel
        fpc?.surfaceView.backgroundColor = .white
        fpc?.surfaceView.layer.cornerRadius = 0
        fpc?.surfaceView.layer.masksToBounds = true
    }
    
    func setupCornerRadius() {
        settingButtonLabel.layer.cornerRadius = settingButtonLabel.frame.height / 2
        searchBarView.layer.cornerRadius = searchBarView.frame.height / 2
    }
    
    func setupBorderWidth() {
        settingButtonLabel.layer.borderWidth = 0.7
        searchBarView.layer.borderWidth = 0.4
        searchBarView.layer.borderColor = UIColor.white.cgColor
    }
    
    func setupBorderShadow() {
        // Shadow settings
        searchBarView.layer.shadowColor = UIColor.black.cgColor  // Shadow color
        searchBarView.layer.shadowOpacity = 0.1 // Shadow opacity (0.0 to 1.0)
        searchBarView.layer.shadowOffset = CGSize(width: 0, height: 3) // Shadow offset (you can change this)
        searchBarView.layer.shadowRadius = 2 // Shadow blur radius (the higher the more blur)
        
        // Make the shadow more "realistic" by enabling shadow path
        searchBarView.layer.masksToBounds = false // Important for shadow to appear outside bounds
        // Create a rounded rectangle path that matches the view's corner radius
        let shadowPath = UIBezierPath(roundedRect: searchBarView.bounds,
                                      cornerRadius: searchBarView.layer.cornerRadius)
        searchBarView.layer.shadowPath = shadowPath.cgPath
    }
    
    func addCustomPin(latitute: CLLocationDegrees, longitude: CLLocationDegrees) {
        
        // let coordinate = CLLocationCoordinate2D(latitude: 40.728, longitude: -74)
        let coordinate = CLLocationCoordinate2D(latitude: latitute, longitude: longitude)
        
        mapView.setRegion(MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(
                latitudeDelta: 0.1,
                longitudeDelta: 0.1)
        ), animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        // pin.title = "Location Title"
        pin.title = "$30"
        pin.subtitle = "Location subtitle"
        mapView.addAnnotation(pin)
        
    }
    
}

extension ExploreScreenViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            // create the view
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
//        annotationView?.image = UIImage(named: "google")
        
        // Create a label to display the place's name
        let label = UILabel()
        label.text = annotation.title ?? "$50"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 0.4
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
//        // Remove any previous subviews
//        annotationView?.subviews.forEach { $0.removeFromSuperview() }
        
        // Add the label to the annotation view
        annotationView?.addSubview(label)
        
        // Set the label's constraints
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: annotationView!.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: annotationView!.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 50),
            label.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // Add an image to the annotation's callout
        let imageView = UIImageView(image: UIImage(named: "hotelroomimage3"))
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        
        // Add the image view to the callout accessory
        annotationView?.rightCalloutAccessoryView = imageView
        
        return annotationView

    }
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        
        guard !(annotation is MKUserLocation) else { return }
        
        if let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "MapLocationMainViewController") as? MapLocationMainViewController {
            
            if let sheet = detailVC.sheetPresentationController {
                sheet.detents = [.custom(resolver: { context in
                    0.55 * context.maximumDetentValue
                }), .large()]
                
                sheet.preferredCornerRadius = 20
            }
            
            // You have mapLocationsData array with sample data, so you can use that
            // For this example, I'll use the first item, but you might want to match it with the selected annotation
            let locationData = mapLocationsData[0]
            
            // Pass data to the detail view controller
            detailVC.configureCell(
                placeName: locationData.locationName,
                placeHosterName: locationData.hosterName,
                availableDates: locationData.availableDates,
                priceOfPlace: locationData.price,
                dayTime: locationData.dateNightTime,
                rating: locationData.rating
            )
            
            // Present the detail view controller
            // self.navigationController?.pushViewController(detailVC, animated: true)
            self.present(detailVC, animated: true)
        }
        
    }
    
}

extension ExploreScreenViewController: FloatingPanelControllerDelegate {
    
    // Implement delegate method to handle panel's state changes
    func floatingPanelDidChangeState(_ fpc: FloatingPanelController) {
        // Animate corner radius change based on the panel state
        UIView.animate(withDuration: 0.3) {
            switch fpc.state {
            case .full:
                fpc.surfaceView.layer.cornerRadius = 0
                fpc.surfaceView.grabberHandle.isHidden = true
                self.animateTabBar(show: true)
            case .half:
                fpc.surfaceView.layer.cornerRadius = 20
                fpc.surfaceView.grabberHandle.isHidden = false
                self.animateTabBar(show: true)
            case .hidden:
                fpc.surfaceView.layer.cornerRadius = 50
                fpc.surfaceView.grabberHandle.isHidden = false
                self.animateTabBar(show: false)
            case .tip:
                fpc.surfaceView.layer.cornerRadius = 30
                fpc.surfaceView.grabberHandle.isHidden = false
                self.animateTabBar(show: false)
            default:
                break
            }
        }
    }
    
    func heightForBottomSheet() -> CGFloat {
        
        let searchCollectionViewStackViewHeight = searchCollectionVIewStackView.frame.height

        let heightForBottomSheet = searchCollectionViewStackViewHeight
        
        return heightForBottomSheet
    }

    func floatingPanelWillBeginDragging(_ fpc: FloatingPanelController) {
        fpc.surfaceView.layer.masksToBounds = true
    }
    
    private func animateTabBar(show: Bool) {
        guard let tabBar = self.tabBarController?.tabBar else { return }
        
        // Calculate the screen height and the tab bar height
        let tabBarHeight = tabBar.frame.height
        let screenHeight = UIScreen.main.bounds.height
        
        // Set the tab bar position directly, depending on whether we want to show or hide it
        let targetY = show ? screenHeight - tabBarHeight : screenHeight
        
        // Animate the tab bar to the desired position
        UIView.animate(withDuration: 0.3, animations: {
            tabBar.frame.origin.y = targetY
        })
    }

}

extension ExploreScreenViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exploreCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let exploreCategory = exploreCategories[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.ExploreCells.Identifiers.categoryCellIdentifier, for: indexPath) as? CategoryCell
        cell?.configureCell(categoryImageName: exploreCategory.categoryImage, categoryName: exploreCategory.categoryName)
        cell?.selectedViewColor(indexNum: indexPath.row)
        return cell ?? UICollectionViewCell()
    }
    
}

extension ExploreScreenViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemPerRow: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 6 : 4
        let padding: CGFloat = 10
        let totalPadding = padding * (itemPerRow - 1)
        let availableWidth = collectionView.frame.width - totalPadding
        let itemWidth = availableWidth / itemPerRow

        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Deselect all other cells first
        for visibleIndexPath in collectionView.indexPathsForVisibleItems {
            if visibleIndexPath != indexPath {
                if let cell = collectionView.cellForItem(at: visibleIndexPath) as? CategoryCell {
                    cell.categorySelectView.backgroundColor = UIColor.white
                }
            }
        }
        
        // Select the newly tapped cell
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
            cell.categorySelectView.backgroundColor = UIColor.black
        }
        
        print("Selected category at index: \(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
            cell.categorySelectView.backgroundColor = UIColor.white
            print("I got deselected")
        } else {
            print("I won't get deselected")
        }
    }
    
}
