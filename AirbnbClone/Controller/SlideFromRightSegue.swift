//
//  SlideFromRightSegue.swift
//  AirbnbClone
//
//  Created by Elexoft on 28/01/2025.
//

import UIKit

class SlideFromRightSegue: UIStoryboardSegue {

    override func perform() {
        // Access the source and destination view controllers
        let sourceVC = self.source
        let destinationVC = self.destination

        // Set the destination view controller's modal presentation style to full screen
        destinationVC.modalPresentationStyle = .fullScreen

        // Add the destination view to the source view's container
        sourceVC.view.addSubview(destinationVC.view)

        // Set initial position off-screen to the right
        destinationVC.view.frame = CGRect(x: sourceVC.view.frame.width, y: 0,
                                          width: sourceVC.view.frame.width,
                                          height: sourceVC.view.frame.height)

        // Animate the destination view sliding in from the right
        UIView.animate(withDuration: 0.5, animations: {
            destinationVC.view.frame = sourceVC.view.frame // Slide to the center
        }) { _ in
            // Once the animation finishes, present the destination view controller
            sourceVC.present(destinationVC, animated: false, completion: nil)
        }
    }
}

