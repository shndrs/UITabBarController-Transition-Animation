//
//  SwiftyTabBarTransition.swift
//  UITabBarController Transition Animation
//
//  Created by NP2 on 5/22/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

public struct SwiftyTabBarTransition {
    
    ///A Factory method That returns a UIViewControllerAnimatedTransitioning
    
    public static func set(transition:SwiftyTabBarTransitionOptions) -> UIViewControllerAnimatedTransitioning {
        
        switch transition.animationOption {
        
        case .leftToRight:
            return LeftToRight(transition: transition)
        case .rightToLeft:
            return RightToLeft(transition: transition)
        case .fade:
            return Fade(transition: transition)
        case .scaleX:
            return ScaleX(transition: transition)
        case .scaleY:
            return ScaleY(transition: transition)
        case .scaleXY:
            return ScaleXY(transition: transition)
        }
    }
}
