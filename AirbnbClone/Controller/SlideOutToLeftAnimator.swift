//
//  SlideOutToLeftAnimator.swift
//  AirbnbClone
//
//  Created by Elexoft on 28/01/2025.
//

import UIKit

class SlideOutToLeftAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // Duration of the transition
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.0
    }
    
    // Animation logic for the transition
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        let containerView = transitionContext.containerView
        
        // Add the fromView to the container view (so we can animate it)
        containerView.addSubview(fromView)
        
        // Set the initial position off-screen to the left
        fromView.frame = CGRect(x: -containerView.frame.width, y: 0, width: containerView.frame.width, height: containerView.frame.height)
        
        // Animate the view sliding in from left to right (from off-screen to on-screen)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView.frame = CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height)
        }) { _ in
            // Complete the transition when the animation finishes
            transitionContext.completeTransition(true)
        }
    }
}

