//
//  OurTransitionDelegate.swift
//  UITransitions
//
//  Created by Nathan Hsu on 2019-07-23.
//  Copyright © 2019 Nathan Hsu. All rights reserved.
//

import UIKit

class OurTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    // "Presentation" refers final shape of the presented view controller, not the
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return OurPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    // "Animation/Transition" refers to the actual animation that is performed during the transition.
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = OurAnimator()
        return animator
    }
    
}
