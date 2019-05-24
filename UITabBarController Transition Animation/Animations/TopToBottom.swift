//
//  TopToBottom.swift
//  UITabBarController Transition Animation
//
//  Created by Sahand Raeisi on 5/24/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class TopToBottom: NSObject {
    
    private var transition:SwiftyTabBarTransitionOptions!
    
    public init(transition:SwiftyTabBarTransitionOptions) {
        self.transition = transition
    }
}

// MARK: UIViewControllerAnimatedTransitioning Impelementation

extension TopToBottom: UIViewControllerAnimatedTransitioning {
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let object = SwiftyAnimateTransition { (options) in
            options.destinationTransform = CGAffineTransform(translationX: 0, y: -UIScreen.main.bounds.height)
            options.originTransform = CGAffineTransform(translationX: 0, y: +UIScreen.main.bounds.height)
            options.duration = transitionDuration(using: transitionContext)
            options.transitionContext = transitionContext
        }
        SwiftyAnimator.transition(with: object)
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.transition.duration
    }
}

