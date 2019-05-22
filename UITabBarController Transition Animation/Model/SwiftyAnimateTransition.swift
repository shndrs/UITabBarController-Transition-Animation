//
//  SwiftyAnimateTransition.swift
//  UITabBarController Transition Animation
//
//  Created by NP2 on 5/22/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

public class SwiftyAnimateTransition {
    
    public var transitionContext: UIViewControllerContextTransitioning!
    public var originTransform: CGAffineTransform!
    public var destinationTransform: CGAffineTransform!
    public var duration: TimeInterval!
    
    public typealias Closure = (SwiftyAnimateTransition) -> Void
    
    init(closure:Closure) {
        closure(self)
    }
}
