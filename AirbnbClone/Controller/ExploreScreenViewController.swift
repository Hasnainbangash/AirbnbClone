//
//  ExploreScreenViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 08/01/2025.
//

import UIKit
import FloatingPanel

class ExploreScreenViewController: UIViewController {

    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var settingButtonLabel: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupCornerRadius()
        setupBorderWidth()
        setupBorderShadow()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /* // Bottom sheet made through the code
        // Get reference to storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate from storyboard (make sure to set the Storyboard ID first)
        if let vc = storyboard.instantiateViewController(withIdentifier: K.ExploreCells.Segue.ExploreScreenToBottomSheetSegue) as? ExploreSecondScreenViewController {
            
            // Initialize Navigation Controller with the second screen
            let navVC = UINavigationController(rootViewController: vc)
            
            // Make sure the navigation bar is hidden when presenting the bottom sheet
            navVC.setNavigationBarHidden(true, animated: false)
            
            // Configure the bottom sheet presentation controller
            if let sheet = navVC.sheetPresentationController {
                
                navVC.isModalInPresentation = true
                
                // Configure the detents (sizes) of the bottom sheet
                sheet.detents = [
                    .custom(resolver: { context in
                        0.02 * context.maximumDetentValue // Small detent height, you can tweak this value
                    }),
                    .large() // This allows the large detent as an option
                ]
                
                // Allow the grabber to be visible
                sheet.prefersGrabberVisible = true
                
                // Add rounded corners to the bottom sheet
                sheet.preferredCornerRadius = 40
                
                // Additional configuration for behavior
                sheet.prefersEdgeAttachedInCompactHeight = true
                sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                
                // Ensure background does not dim when scrolling (if needed)
                sheet.largestUndimmedDetentIdentifier = .large
            }
            
            // Present the navigation controller with the bottom sheet
            present(navVC, animated: true)
        }
        */
        
        // Initialize the FloatingPanelController object.
        fpc = FloatingPanelController()
        fpc?.delegate = self
        
        // Create the content view controller from storyboard (SecondViewController).
        let contentVC = storyboard?.instantiateViewController(withIdentifier: K.ExploreCells.Segue.ExploreScreenToBottomSheetSegue) as? ExploreSecondScreenViewController
        
        // Set the content view controller for the floating panel.
        fpc?.set(contentViewController: contentVC)
        
        // Optionally, track a scroll view if your content is scrollable.
        // fpc?.track(scrollView: contentVC.tableView)
        
        // Add the floating panel to the parent view.
        fpc?.addPanel(toParent: self)
        
        // Customize the floating panel if needed.
        fpc?.surfaceView.backgroundColor = .white
        // Round the corners of the floating panel
        fpc?.surfaceView.backgroundColor = .white
        fpc?.surfaceView.layer.cornerRadius = 50 // Set the corner radius to your desired value
        fpc?.surfaceView.layer.masksToBounds = true // Ensure the rounded corners are visible
        
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ExploreScreenToBottomSheet" {
//            if let destinationVC = segue.destination as? ExploreSecondScreenViewController {
//                
//                destinationVC.isModalInPresentation = true
//                
//                // Configure the sheet presentation controller
//                if let sheet = destinationVC.sheetPresentationController {
//                    sheet.preferredCornerRadius = 40
//                    sheet.detents = [
//                        .custom(resolver: { context in
//                            0.1 * context.maximumDetentValue
//                        }),
//                        .large()
//                    ]
//                }
//            }
//        }
//    }
}

extension ExploreScreenViewController: FloatingPanelControllerDelegate {

    // Implement delegate method to handle panel's state changes
    func floatingPanelDidChangeState(_ fpc: FloatingPanelController) {
        // Animate corner radius change based on the panel state
        UIView.animate(withDuration: 0.3) {
            switch fpc.state {
            case .full:
                fpc.surfaceView.layer.cornerRadius = 0
                self.setTabBarVisibility(visible: true)
            case .half:
                fpc.surfaceView.layer.cornerRadius = 20  // Adjust for half position if needed
                self.setTabBarVisibility(visible: true)
            case .hidden:
                fpc.surfaceView.layer.cornerRadius = 50
                self.setTabBarVisibility(visible: false)
            case .tip:
                fpc.surfaceView.layer.cornerRadius = 30  // Optionally, adjust for tip position
                self.setTabBarVisibility(visible: false)
            default:
                break
            }
        }

    }

    // Optional: For smoother transitions, you can also implement this method
    func floatingPanelWillBeginDragging(_ fpc: FloatingPanelController) {
        // Enable animations during dragging (this helps smooth out changes)
        fpc.surfaceView.layer.masksToBounds = true
    }
    
    // Helper method to hide/show the Tab Bar
    func setTabBarVisibility(visible: Bool) {
        guard let tabBarController = self.tabBarController else { return }
        
        UIView.animate(withDuration: 0.3) {
            tabBarController.tabBar.isHidden = !visible
        }
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
    
}
