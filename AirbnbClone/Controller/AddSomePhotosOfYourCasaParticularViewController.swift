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
        
        AddSomePhoto(image: "hotelroomimage4")
        
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
    
    @IBAction func addPhotosButtonPressed(_ sender: UIButton) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    @IBAction func takeNewPhotosButtonPressed(_ sender: UIButton) {
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
        
        cell?.configureData(uploadedPhoto: addPhoto)
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Show alert to confirm deletion
        let alert = UIAlertController(title: "Remove Photo",
                                    message: "Do you want to remove this photo?",
                                    preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Remove", style: .destructive) { [weak self] _ in
            self?.addSomePhotos.remove(at: indexPath.row)
            self?.collectionView.deleteItems(at: [indexPath])
        })
        
        present(alert, animated: true)
    }
    
}

extension AddSomePhotosOfYourCasaParticularViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            addSomePhotos.append(AddSomePhoto(uiImage: editedImage))
            collectionView.reloadData()
            print("Edited image added!")
        } else if let originalImage = info[.originalImage] as? UIImage {
            addSomePhotos.append(AddSomePhoto(uiImage: originalImage))
            collectionView.reloadData()
            print("Original image added!")
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
