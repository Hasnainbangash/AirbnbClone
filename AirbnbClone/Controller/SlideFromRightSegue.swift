//
//  SlideFromRightSegue.swift
//  AirbnbClone
//
//  Created by Elexoft on 28/01/2025.
//

import UIKit

class SlideFromRightSegue: UIStoryboardSegue {
    override func perform() {
        let src = self.source
        let dst = self.destination
        dst.modalPresentationStyle = .fullScreen
        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
        /*For the FromRight transition remove minus (-) before -src to turn the direction 180 degrees as in the following example:
         dst.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
         ***********************************************/
        UIView.animate(withDuration: 0.25,
                       delay: 0.0,
                       options: .curveEaseInOut,
                       animations: {
            dst.view.transform = CGAffineTransform(translationX: 0, y: 0)
        },
                       completion: { finished in
            src.present(dst, animated: false, completion: nil)
        }
        )
    }
}
