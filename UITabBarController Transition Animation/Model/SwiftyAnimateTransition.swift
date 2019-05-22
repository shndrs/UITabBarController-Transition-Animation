//
//  SwiftyAnimateTransition.swift
//  UITabBarController Transition Animation
//
//  Created by NP2 on 5/22/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

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
