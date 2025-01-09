//
//  LocationCell.swift
//  AirbnbClone
//
//  Created by Elexoft on 09/01/2025.
//

import UIKit

class LocationCell: UITableViewCell {
    
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myPageControl: UIPageControl!
    
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var availableDates: UILabel!
    @IBOutlet weak var placeHostedName: UILabel!
    @IBOutlet weak var placePrice: UILabel!
    @IBOutlet weak var dayNightLabel: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    var images: [String] = ["hotelroomimage1", "hotelroomimage2", "hotelroomimage3", "hotelroomimage4"]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Number of pages in the page control is equal to images array
        myPageControl.numberOfPages = images.count
        
        for index in 0..<images.count {
            frame.origin.x = myScrollView.frame.size.width * CGFloat(index)
            frame.size = myScrollView.frame.size
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage (named: images[index])
            imgView.contentMode = .scaleAspectFill
//            imgView.clipsToBounds = true
            self.myScrollView.addSubview(imgView)
            myScrollView.contentSize = CGSize(width: (myScrollView.frame.size.width *
            CGFloat(images.count)), height: myScrollView.frame.size.height)
        }
        
        myScrollView.delegate = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(placeName: String, placeHosterName: String, availableDates: [String], priceOfPlace: String, dayTime: String, rating: String) {
        
        self.placeName.text = placeName
        self.placeHostedName.text = "Hosted by \(placeHosterName)"
        self.availableDates.text = "\(availableDates[0]) - \(availableDates[1])"
        self.placePrice.text = priceOfPlace
        self.dayNightLabel.text = dayTime
        self.rating.text = rating
        
    }
    
}

extension LocationCell: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = myScrollView.contentOffset.x/myScrollView.frame.size.width
        myPageControl.currentPage = Int(pageNumber)
    }
    
}
