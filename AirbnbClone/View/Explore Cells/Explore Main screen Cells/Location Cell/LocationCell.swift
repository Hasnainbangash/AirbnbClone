//
//  LocationCell.swift
//  AirbnbClone
//
//  Created by Elexoft on 09/01/2025.
//

import UIKit

class LocationCell: UITableViewCell {
    
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var availableDates: UILabel!
    @IBOutlet weak var placeHostedName: UILabel!
    @IBOutlet weak var placePrice: UILabel!
    @IBOutlet weak var dayNightLabel: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images: [String] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        
        // Setup page control
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.hidesForSinglePage = true
        
        collectionView.register(UINib(nibName: K.ExploreCells.NibNames.locationPictureViewCellNibName, bundle: nil), forCellWithReuseIdentifier: K.ExploreCells.Identifiers.locationPictureViewCellIdentifier)
        
        setupPageControl()
        setupCornerRadius()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCornerRadius() {
        collectionView.layer.cornerRadius = collectionView.frame.height / 17
    }
    
    func configureCell(images: [String], placeName: String, placeHosterName: String, availableDates: [String], priceOfPlace: String, dayTime: String, rating: String) {
        
        self.images = images
        self.placeName.text = placeName
        self.placeHostedName.text = "Hosted by \(placeHosterName)"
        self.availableDates.text = "\(availableDates[0]) - \(availableDates[1])"
        self.placePrice.text = priceOfPlace
        self.dayNightLabel.text = dayTime
        self.rating.text = rating
        
    }
    
}

extension LocationCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = round(scrollView.contentOffset.x / scrollView.bounds.width)
        pageControl.currentPage = Int(page)
    }
}

extension LocationCell {
    func setupPageControl() {
        pageControl.addTarget(self, action: #selector(pageControlValueChanged(_:)), for: .valueChanged)
    }
    
    @objc private func pageControlValueChanged(_ sender: UIPageControl) {
        let page = CGFloat(sender.currentPage)
        let offset = page * collectionView.bounds.width
        collectionView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
    }
}

extension LocationCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let image = images[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.ExploreCells.Identifiers.locationPictureViewCellIdentifier, for: indexPath) as? LocationPictureViewCell
        
        cell?.configureData(imageName: image)
        
        return cell ?? UICollectionViewCell()
    }
    
}

extension LocationCell: UICollectionViewDelegateFlowLayout {
    
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
