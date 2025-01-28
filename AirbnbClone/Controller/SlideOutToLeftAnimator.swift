//
//  SlideOutToLeftAnimator.swift
//  AirbnbClone
//
//  Created by Elexoft on 28/01/2025.
//

import UIKit

class SlideOutToLeftAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    // Duration of the transition
    private let duration: TimeInterval
    
    // Whether the transition is for presenting or dismissing
    private let isPresenting: Bool

    // Initialization
    init(isPresenting: Bool = true, duration: TimeInterval = 0.3) {
        self.isPresenting = isPresenting
        self.duration = duration
        super.init()
    }

    // Duration of the transition
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    // Perform the animation for presenting or dismissing
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: .from),
              let toView = transitionContext.view(forKey: .to) else {
            transitionContext.completeTransition(false)
            return
        }
        
        let containerView = transitionContext.containerView

        if isPresenting {
            containerView.addSubview(toView)
            toView.frame = fromView.frame.offsetBy(dx: -containerView.frame.width, dy: 0)
        } else {
            containerView.insertSubview(toView, belowSubview: fromView)
            toView.frame = fromView.frame
        }

        // Animation logic
        UIView.animate(withDuration: duration, animations: {
            if self.isPresenting {
                toView.frame = fromView.frame
            } else {
                fromView.frame = fromView.frame.offsetBy(dx: -containerView.frame.width, dy: 0)
            }
        }) { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}













//import UIKit
//
//class SlideOutToLeftAnimator: NSObject, UIViewControllerAnimatedTransitioning {
//    
//    // MARK: - Properties
//    
//    private let isPresenting: Bool
//    private let duration: TimeInterval
//    
//    // MARK: - Initialization
//    
//    init(isPresenting: Bool = true, duration: TimeInterval = 0.3) {
//        self.isPresenting = isPresenting
//        self.duration = duration
//        super.init()
//    }
//    
//    // MARK: - UIViewControllerAnimatedTransitioning
//    
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return duration
//    }
//    
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        guard let fromView = transitionContext.view(forKey: .from),
//              let toView = transitionContext.view(forKey: .to) else {
//            transitionContext.completeTransition(false)
//            return
//        }
//        
//        let containerView = transitionContext.containerView
//        let finalFrame = transitionContext.finalFrame(for: transitionContext.viewController(forKey: .to)!)
//        
//        // Configure initial states
//        if isPresenting {
//            containerView.addSubview(toView)
//            toView.frame = finalFrame.offsetBy(dx: -containerView.frame.width, dy: 0)
//        } else {
//            containerView.insertSubview(toView, belowSubview: fromView)
//            toView.frame = finalFrame
//        }
//        
//        // Add spring animation for more natural feel
//        let animator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.8) {
//            if self.isPresenting {
//                toView.frame = finalFrame
//            } else {
//                fromView.frame = finalFrame.offsetBy(dx: -containerView.frame.width, dy: 0)
//            }
//        }
//        
//        // Add completion handler
//        animator.addCompletion { _ in
//            let success = !transitionContext.transitionWasCancelled
//            if !success {
//                toView.removeFromSuperview()
//            }
//            transitionContext.completeTransition(success)
//        }
//        
//        // Start animation
//        animator.startAnimation()
//    }
//}
//
//// MARK: - Usage Example
//
//extension SlideOutToLeftAnimator {
//    static func configureNavigationController(_ navigationController: UINavigationController) {
//        navigationController.delegate = NavigationControllerTransitionDelegate.shared
//    }
//}
//
//// Singleton delegate to handle navigation controller transitions
//final class NavigationControllerTransitionDelegate: NSObject, UINavigationControllerDelegate {
//    static let shared = NavigationControllerTransitionDelegate()
//    
//    private override init() {}
//    
//    func navigationController(
//        _ navigationController: UINavigationController,
//        animationControllerFor operation: UINavigationController.Operation,
//        from fromVC: UIViewController,
//        to toVC: UIViewController
//    ) -> UIViewControllerAnimatedTransitioning? {
//        switch operation {
//        case .push:
//            return SlideOutToLeftAnimator(isPresenting: true)
//        case .pop:
//            return SlideOutToLeftAnimator(isPresenting: false)
//        default:
//            return nil
//        }
//    }
//}

