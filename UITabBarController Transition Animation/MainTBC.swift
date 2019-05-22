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
        return TabBarAnimatedTransitioning()
    }
}

final class TabBarAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    fileprivate enum SHNDTabBarAnimation {
        case scaleX
        case scaleY
        case scaleXY
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let destination = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        destination.alpha = 0.0
        destination.transform = CGAffineTransform(translationX: 0, y: -destination.frame.size.height)
        destination.transform = CGAffineTransform(scaleX: 1.4, y: 1)
        
        transitionContext.containerView.addSubview(destination)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseOut, animations: {
            destination.alpha = 1.0
            destination.transform = .identity
        }) { (success) in
            transitionContext.completeTransition(success)
        }
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
}
