//
//  OurAnimator.swift
//  UITransitions
//
//  Created by Nathan Hsu on 2019-07-23.
//  Copyright © 2019 Nathan Hsu. All rights reserved.
//

import UIKit

class OurAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration: TimeInterval = 1
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to) else { print("no toVC found!"); return }
        let container = transitionContext.containerView
        let startFrame = CGRect(x: container.frame.width, y: container.frame.height, width: container.frame.width, height: container.frame.height/2)
        
        // Set begin states before animation.
        toVC.view.frame = startFrame
        container.addSubview(toVC.view)
        
        let animator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.6) {
               toVC.view.frame = CGRect(x: 0, y: container.frame.height/2, width: container.frame.width, height: container.frame.height/2)
        }
        
        // You must call `completeTransition` or the presented VC will not be functional.
        animator.addCompletion { (position) in
            if position == .end {
                transitionContext.completeTransition(true)
            }
        }
        animator.startAnimation()
        
    }
    
    
}
