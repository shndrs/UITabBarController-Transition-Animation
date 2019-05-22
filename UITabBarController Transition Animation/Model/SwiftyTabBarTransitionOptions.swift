//
//  SHNDTabBarTransitionModel.swift
//  UITabBarController Transition Animation
//
//  Created by NP2 on 5/22/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import Foundation

public enum SHNDTabBarAnimation {
//    case scaleX
//    case scaleY
//    case scaleXY
    case rightToLeft
    case leftToRight
//    case upToDown
//    case downToUp
//    case fade
}

@requires_stored_property_inits
public class SwiftyTabBarTransitionOptions {
    
    public private(set) var duration:TimeInterval = 0.25
    public private(set) var animationOption:SHNDTabBarAnimation = .leftToRight
    
    public required init() {}
    
    init(duration:TimeInterval, animationOption:SHNDTabBarAnimation) {
        self.duration = duration
        self.animationOption = animationOption
    }
}


