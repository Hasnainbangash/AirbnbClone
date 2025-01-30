//
//  AddSomePhotosOfYourCasaParticularViewController.swift
//  AirbnbClone
//
//  Created by Elexoft on 24/01/2025.
//

import UIKit

class AddSomePhotosOfYourCasaParticularViewController: UIViewController {

    @IBOutlet weak var saveAndExitButtonLabel: UIButton!
    @IBOutlet weak var questionsButtonLabel: UIButton!
    @IBOutlet weak var backButtonLabel: UIButton!
    @IBOutlet weak var nextButtonLabel: UIButton!
    
    @IBOutlet weak var addPhotosView: UIView!
    @IBOutlet weak var takeNewPhotosView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var addSomePhotos: [AddSomePhoto] = [
        
        AddSomePhoto(image: "hotelroomimage4"),
        AddSomePhoto(image: "hotelroomimage2"),
        AddSomePhoto(image: "hotelroomimage5"),
        AddSomePhoto(image: "hotelroomimage1"),
        AddSomePhoto(image: "hotelroomimage3")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.transitioningDelegate = self
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: K.HostYourPlaceCell.NibNames.uploadedPhotosCollectionCellNibName, bundle: nil), forCellWithReuseIdentifier: K.HostYourPlaceCell.Identifiers.uploadedPhotosCollectionCellIdentifier)
        
        setupCornerRadius()
        setupBorderWidth()
        setupButtonUnderline()
    }
    
    func setupCornerRadius() {
        saveAndExitButtonLabel.layer.cornerRadius = saveAndExitButtonLabel.frame.height / 2
        questionsButtonLabel.layer.cornerRadius = questionsButtonLabel.frame.height / 2
        nextButtonLabel.layer.cornerRadius = nextButtonLabel.frame.height / 5
        
        addPhotosView.layer.cornerRadius = addPhotosView.frame.height / 5
        takeNewPhotosView.layer.cornerRadius = takeNewPhotosView.frame.height / 5
    }
    
    func setupBorderWidth() {
        saveAndExitButtonLabel.layer.borderWidth = 0.3
        questionsButtonLabel.layer.borderWidth = 0.3
        
        addPhotosView.layer.borderWidth = 0.3
        takeNewPhotosView.layer.borderWidth = 0.3
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
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension AddSomePhotosOfYourCasaParticularViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideOutToLeftAnimator() // Use our custom animator for sliding out to the left
    }
    
}

extension AddSomePhotosOfYourCasaParticularViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return addSomePhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let addPhoto = addSomePhotos[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.HostYourPlaceCell.Identifiers.uploadedPhotosCollectionCellIdentifier, for: indexPath) as? UploadedPhotosCollectionCell
        
        cell?.configureData(uploadedImage: addPhoto.image)
        
        return cell ?? UICollectionViewCell()
        
    }
    
}

extension AddSomePhotosOfYourCasaParticularViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemPerRow: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 6 : 3
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
