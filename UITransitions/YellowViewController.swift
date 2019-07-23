//
//  YellowViewController.swift
//  UITransitions
//
//  Created by Nathan Hsu on 2019-07-23.
//  Copyright © 2019 Nathan Hsu. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTap))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func onTap() {
        dismiss(animated: true, completion: nil)
    }
    
}
