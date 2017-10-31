//
//  CALayer+SJAdd.swift
//  Whale
//
//  Created by swordjoy on 2017/10/31.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import UIKit

extension SwordJoy where Base: CALayer {
    var left : CGFloat {
        get { return base.frame.origin.x }
        set { base.frame.origin.x = newValue }
    }
    
    var top : CGFloat {
        get { return base.frame.origin.y }
        set { base.frame.origin.y = newValue }
    }
    
    var right : CGFloat {
        get { return base.frame.origin.x + base.frame.size.width }
        set { base.frame.origin.x = newValue - base.frame.size.width }
    }
    
    var bottom : CGFloat {
        get { return base.frame.origin.y + base.frame.size.height }
        set { base.frame.origin.y = newValue - base.frame.size.height }
    }
    
    var height : CGFloat {
        get { return base.frame.size.height }
        set { base.frame.size.height = newValue }
    }
    
    var width : CGFloat {
        get { return base.frame.size.width }
        set { base.frame.size.width = newValue }
    }
    
    var center: CGPoint {
        get { return CGPoint(x: base.frame.origin.x + base.frame.size.width * 0.5, y: base.frame.origin.y + base.frame.size.height * 0.5) }
        set {
            base.frame.origin.x = newValue.x - base.frame.size.width * 0.5;
            base.frame.origin.y = newValue.y - base.frame.size.height * 0.5
        }
    }
    
    var centerX : CGFloat {
        get { return self.center.x }
        set { self.center = CGPoint(x: newValue, y: self.center.y) }
    }
    
    var centerY : CGFloat {
        get { return self.center.y }
        set { self.center = CGPoint(x: self.center.x, y: newValue) }
    }
    
    var size: CGSize {
        get { return base.frame.size }
        set { base.frame.size = newValue }
    }
}
