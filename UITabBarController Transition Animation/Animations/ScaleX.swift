//
//  ScaleX.swift
//  UITabBarController Transition Animation
//
//  Created by NP2 on 5/22/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final public class ScaleX: NSObject {
    private var transition:SwiftyTabBarTransitionOptions!
    
    public init(transition:SwiftyTabBarTransitionOptions) {
        self.transition = transition
    }
}

// MARK: UIViewControllerAnimatedTransitioning Impelementation

extension ScaleX: UIViewControllerAnimatedTransitioning {
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let object = SwiftyAnimateDestinationTransition { (options) in
            options.destinationTransform = CGAffineTransform(scaleX: 1.4, y: 1.0)
            options.duration = transitionDuration(using: transitionContext)
            options.transitionContext = transitionContext
        }
        SwiftyAnimator.transitionDestination(with: object)
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transition.duration
    }
}

