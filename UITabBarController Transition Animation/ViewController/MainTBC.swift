//
//  MainTBC.swift
//  UITabBarController Transition Animation
//
//  Created by NP2 on 5/22/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

class MainTBC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }
}

// MARK: - UITabBarControllerDelegate

extension MainTBC: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let transition = SwiftyTabBarTransitionOptions(duration: 0.3, animationOption: .fade)
        return SwiftyTabBarTransition.set(transition: transition)
    }
}
