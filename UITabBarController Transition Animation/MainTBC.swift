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
        return SHNDTabBarTransitioning()
    }
}

final class SHNDTabBarTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    fileprivate enum SHNDTabBarAnimation {
        case scaleX
        case scaleY
        case scaleXY
        case rightToLeft
        case leftToRight
        case upToDown
        case downToUp
        case fade
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let origin = transitionContext.view(forKey: .from) else { return }
        guard let destination = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        origin.alpha = 1
        origin.transform = .identity
        
        destination.alpha = 0.0
        destination.transform = CGAffineTransform(rotationAngle: .pi / 4)
        
        transitionContext.containerView.addSubview(origin)
        transitionContext.containerView.addSubview(destination)
        
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseOut, animations: {
            
            origin.alpha = 0
            origin.transform = CGAffineTransform(translationX: +100, y: 0)
                //CGAffineTransform(scaleX: 1.5, y: 1.5)
            
            destination.alpha = 1.0
            destination.transform = .identity
            
        }) { (success) in
            origin.transform = .identity
            origin.alpha = 1
            transitionContext.completeTransition(success)
        }
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
}
