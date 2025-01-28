//
//  SlideOutToLeftAnimator.swift
//  AirbnbClone
//
//  Created by Elexoft on 28/01/2025.
//

import UIKit

class SlideOutToLeftAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25 // Duration of the slide transition
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        let containerView = transitionContext.containerView
        
        // Add the fromView to the container view
        containerView.addSubview(fromView)
        
        // Set the initial position to the left of the screen (off-screen)
        fromView.frame = CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height)
        
        // Animate the view sliding out to the left
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView.frame = CGRect(x: -containerView.frame.width, y: 0, width: containerView.frame.width, height: containerView.frame.height)
        }) { _ in
            // Complete the transition when the animation finishes
            transitionContext.completeTransition(true)
        }
    }
}

