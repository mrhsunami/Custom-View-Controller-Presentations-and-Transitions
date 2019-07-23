//
//  CustomSegue.swift
//  UITransitions
//
//  Created by Nathan Hsu on 2019-07-23.
//  Copyright © 2019 Nathan Hsu. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    
/// This isn't needed for our example to work, just here to show what a UIStoryboardSegue receives when it.
//    override init(identifier: String?, source: UIViewController, destination: UIViewController) {
//        super.init(identifier: identifier, source: source, destination: destination)
//    }
    
    override func perform() {
        
        // Always create the transition delegate first before assigning it.
        // destination.transitioningDelegate = OurTransitionDelegate() // This will not work.
        let transitionDelegate = OurTransitionDelegate()
        destination.transitioningDelegate = transitionDelegate
        
        // Assign the modalPresentationStyle to .custom after assigning the transitionDelegate object or it will not work.
        destination.modalPresentationStyle = .custom
        source.present(destination, animated: true, completion: nil)
        
    }
}
