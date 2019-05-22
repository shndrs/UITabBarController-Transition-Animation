//
//  LeftToRight.swift
//  UITabBarController Transition Animation
//
//  Created by NP2 on 5/22/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final public class LeftToRight: NSObject {
    
    private var transition:SwiftyTabBarTransitionOptions!
    
    public init(transition:SwiftyTabBarTransitionOptions) {
        self.transition = transition
    }
}

// MARK: UIViewControllerAnimatedTransitioning Impelementation

extension LeftToRight: UIViewControllerAnimatedTransitioning {
    
    struct SwiftyAnimateTransition {
        
        public let transitionContext: UIViewControllerContextTransitioning
        public let originTransform: CGAffineTransform
        public let destinationTransform: CGAffineTransform
        
        init(transitionContext: UIViewControllerContextTransitioning, originTransform:CGAffineTransform, destinationTransform:CGAffineTransform) {
            self.transitionContext = transitionContext
            self.originTransform = originTransform
            self.destinationTransform = destinationTransform
        }
    }
    
    
    func animationWith(transitionContext: UIViewControllerContextTransitioning, originTransform:CGAffineTransform, destinationTransform:CGAffineTransform) {
        
        guard let origin = transitionContext.view(forKey: .from) else { return }
        guard let destination = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        origin.alpha = 1
        origin.transform = .identity
        
        destination.alpha = 0.0
        destination.transform = destinationTransform
        
        transitionContext.containerView.addSubview(origin)
        transitionContext.containerView.addSubview(destination)
        
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseOut, animations: {
            
            origin.transform = originTransform
            
            destination.alpha = 1.0
            destination.transform = .identity
            
        }) { (success) in
            origin.transform = .identity
            origin.alpha = 1
            transitionContext.completeTransition(success)
        }
    }
    
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let origin = transitionContext.view(forKey: .from) else { return }
        guard let destination = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        origin.alpha = 1
        origin.transform = .identity
        
        destination.alpha = 0.0
        destination.transform = CGAffineTransform(translationX: -destination.frame.size.width, y: 0)
        
        transitionContext.containerView.addSubview(origin)
        transitionContext.containerView.addSubview(destination)
        
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseOut, animations: {
            
            origin.transform = CGAffineTransform(translationX: +origin.frame.size.width, y: 0)
            
            destination.alpha = 1.0
            destination.transform = .identity
            
        }) { (success) in
            origin.transform = .identity
            origin.alpha = 1
            transitionContext.completeTransition(success)
        }
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.transition.duration
    }
}
