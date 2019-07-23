//
//  OurPresentationController.swift
//  UITransitions
//
//  Created by Nathan Hsu on 2019-07-23.
//  Copyright © 2019 Nathan Hsu. All rights reserved.
//

import UIKit

class OurPresentationController: UIPresentationController {

    var backgroundDimmingView: UIView!
    
    // Allows you to specify the final frame of the presentation. In this case we set it to half the screen located at the bottom half.
    override var frameOfPresentedViewInContainerView: CGRect {
        
        let containerFrame = containerView!.frame
        let frame = CGRect(x: 0, y: containerFrame.height/2, width: containerFrame.width, height: containerFrame.height/2)
        return frame
        
    }
    
    // Here we can show supplimentary views that are not part of either the presenting or presented VC's view hierarchy. A common use is showing a background blurred view that is above the presenting VC's view, but below the presented VC's view. It technically does not belong in either view hierarchy. The presentation controller will maintain it in the transient containerView for the duration of the presentation until the presented VC gets dismissed.
    override func presentationTransitionWillBegin() {
        
        guard let container = containerView else { print("no container"); return }
        
        // Setup beginning state of views
        backgroundDimmingView = UIView()
        backgroundDimmingView.frame = container.frame
        backgroundDimmingView.backgroundColor =  #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)
        backgroundDimmingView.alpha = 0
        container.insertSubview(backgroundDimmingView, at: 0)
        
        // Use this to animate supplimentary views that are not part of the presented VC's view hierarchy during a transition.
        let transitionCoordinator = self.presentingViewController.transitionCoordinator
        transitionCoordinator?.animate(alongsideTransition: { (context) in
            self.backgroundDimmingView.alpha = 0.3
        }, completion: nil)
        
    }

}
