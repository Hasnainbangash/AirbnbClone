//
//  MapLocationMainViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 21/01/2025.
//

import UIKit

class MapLocationMainViewController: UIViewController {

    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var availableDates: UILabel!
    @IBOutlet weak var placeHostedName: UILabel!
    @IBOutlet weak var placePrice: UILabel!
    @IBOutlet weak var dayNightLabel: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var detailViewStack: UIStackView!
    @IBOutlet weak var collectionViewStackView: UIStackView!
    
    var images: [String] = ["hotelroomimage3", "hotelroomimage5", "hotelroomimage1", "hotelroomimage4", "hotelroomimage2", "hotelroomimage6", "hotelroomimage7", "hotelroomimage8", "hotelroomimage9", "hotelroomimage10", "hotelroomimage11"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        
        // Setup page control
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        pageControl.hidesForSinglePage = true
        
        collectionView.register(UINib(nibName: K.MapScreensCell.NibNames.mapLocationCellNibName, bundle: nil), forCellWithReuseIdentifier: K.MapScreensCell.Identifiers.mapLocationCellIdentifier)
        
        
        setupCornerRadius()
        
    }
    
    func setupCornerRadius() {
        // Round top corners of collectionViewStackView
        let radius: CGFloat = 20  // Set the radius you want for the top corners
        let path = UIBezierPath(
            roundedRect: collectionViewStackView.bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        collectionViewStackView.layer.mask = maskLayer
        mainStackView.layer.cornerRadius = mainStackView.frame.height / 17
        detailsView.layer.cornerRadius = detailsView.frame.height / 2
        detailViewStack.layer.cornerRadius = detailViewStack.frame.height / 2
    }
    
    func configureCell(placeName: String, placeHosterName: String, availableDates: [String], priceOfPlace: String, dayTime: String, rating: String) {
        
        DispatchQueue.main.async {
            self.placeName?.text = placeName
            self.placeHostedName?.text = "Hosted by \(placeHosterName)"
            self.availableDates?.text = "\(availableDates[0]) - \(availableDates[1])"
            self.placePrice?.text = priceOfPlace
            self.dayNightLabel?.text = dayTime
            self.rating?.text = rating
        }
        
    }

}

extension MapLocationMainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = round(scrollView.contentOffset.x / scrollView.bounds.width)
        pageControl.currentPage = Int(page)
    }
}

extension MapLocationMainViewController {
    func setupPageControl() {
        pageControl.addTarget(self, action: #selector(pageControlValueChanged(_:)), for: .valueChanged)
    }
    
    @objc private func pageControlValueChanged(_ sender: UIPageControl) {
        let page = CGFloat(sender.currentPage)
        let offset = page * collectionView.bounds.width
        collectionView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
    }
}

extension MapLocationMainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let suffleImages = Array(images.shuffled().prefix(5))
        return suffleImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let image = images[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.MapScreensCell.Identifiers.mapLocationCellIdentifier, for: indexPath) as? MapLocationCell
        
        cell?.configureData(imageName: image)
        
        return cell ?? UICollectionViewCell()
        
    }
    
    
}

extension MapLocationMainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemPerRow: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 1 : 1
        let padding: CGFloat = 10
        let totalPadding = padding * (itemPerRow - 1)
        let availableWidth = collectionView.frame.width - totalPadding
        let itemWidth = availableWidth / itemPerRow

        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
