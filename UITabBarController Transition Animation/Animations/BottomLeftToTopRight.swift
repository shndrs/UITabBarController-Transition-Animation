//
//  BottomLeftToTopRight.swift
//  UITabBarController Transition Animation
//
//  Created by NP2 on 5/25/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final public class BottomLeftToTopRight: NSObject {
    private var transition:SwiftyTabBarTransitionOptions!
    
    public init(transition:SwiftyTabBarTransitionOptions) {
        self.transition = transition
    }
}

// MARK: UIViewControllerAnimatedTransitioning Impelementation

extension BottomLeftToTopRight: UIViewControllerAnimatedTransitioning {
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let object = SwiftyAnimateDestinationTransition { (options) in
            options.destinationTransform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: UIScreen.main.bounds.height)
            options.duration = transitionDuration(using: transitionContext)
            options.transitionContext = transitionContext
        }
        SwiftyAnimator.transitionDestination(with: object)
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transition.duration
    }
}
