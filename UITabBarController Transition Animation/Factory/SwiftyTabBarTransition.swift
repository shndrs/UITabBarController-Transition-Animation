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
        case .scaleInXY:
            return ScaleInXY(transition: transition)
        case .scaleOutXY:
            return ScaleOutXY(transition: transition)
        case .topToBottom:
            return TopToBottom(transition: transition)
        case .bottomToTop:
            return BottomToTop(transition: transition)
        case .topLeftToBottomRight:
            return TopLeftToBottomRight(transition: transition)
        }
    }
}
