//
//  RightToLeft.swift
//  UITabBarController Transition Animation
//
//  Created by NP2 on 5/22/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final public class RightToLeft: NSObject {
    private var transition:SwiftyTabBarTransitionOptions!
    
    public init(transition:SwiftyTabBarTransitionOptions) {
        self.transition = transition
    }
}

// MARK: UIViewControllerAnimatedTransitioning Impelementation

extension RightToLeft: UIViewControllerAnimatedTransitioning {
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let object = SwiftyAnimateTransition { (options) in
            options.destinationTransform = CGAffineTransform(translationX: +UIScreen.main.bounds.width, y: 0)
            options.originTransform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
            options.duration = transitionDuration(using: transitionContext)
            options.transitionContext = transitionContext
        }
        SwiftyAnimator.transition(with: object)
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.transition.duration
    }
}
