//
//  SwiftyAnimation.swift
//  UITabBarController Transition Animation
//
//  Created by NP2 on 5/22/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

public protocol SwiftyAnimation {
    static func animationWith(object:SwiftyAnimateTransition) -> Void
}

public struct SwiftyAnimator: SwiftyAnimation {
    
    private init() {}
    
    public static func animationWith(object: SwiftyAnimateTransition) {
        
        guard let origin = object.transitionContext.view(forKey: .from) else { return }
        guard let destination = object.transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        origin.alpha = 1
        origin.transform = .identity
        
        destination.alpha = 0.0
        destination.transform = object.destinationTransform
        
        object.transitionContext.containerView.addSubview(origin)
        object.transitionContext.containerView.addSubview(destination)
        
        
        UIView.animate(withDuration: object.duration, delay: 0, options: .curveEaseOut, animations: {
            
            origin.transform = object.originTransform
            
            destination.alpha = 1.0
            destination.transform = .identity
            
        }) { (success) in
            origin.transform = .identity
            origin.alpha = 1
            object.transitionContext.completeTransition(success)
        }
    }
}
