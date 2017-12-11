//
//  UIView+SJAdd.swift
//  SJExtension
//
//  Created by swordjoy on 2017/7/13.
//  Copyright © 2017年 swordjoy. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 布局
extension SwordJoy where Base: UIView {
    var orgin: CGPoint {
        get { return base.frame.origin }
        set { base.frame.origin = orgin }
    }
    
    var left: CGFloat {
        get { return base.frame.origin.x }
        set { base.frame.origin.x = newValue }
    }
    
    var top: CGFloat {
        get { return base.frame.origin.y }
        set { base.frame.origin.y = newValue }
    }
    
    var right: CGFloat {
        get { return base.frame.origin.x + base.frame.size.width }
        set { base.frame.origin.x = newValue - base.frame.size.width }
    }
    
    var bottom: CGFloat {
        get { return base.frame.origin.y + base.frame.size.height }
        set { base.frame.origin.y = newValue - base.frame.size.height }
    }
    
    var height: CGFloat {
        get { return base.frame.size.height }
        set { base.frame.size.height = newValue }
    }
    
    var width: CGFloat {
        get { return base.frame.size.width }
        set { base.frame.size.width = newValue }
    }
    
    // 以当前视图为参考
    var inCenter: CGPoint {
        get {
            let x = base.bounds.size.width / 2.0
            let y = base.bounds.size.height / 2.0
            return CGPoint(x: x, y: y)
        }
    }
    
    var centerX: CGFloat {
        get { return base.center.x }
        set { base.center = CGPoint(x: newValue, y: base.center.y) }
    }
    
    var centerY: CGFloat {
        get { return base.center.y }
        set { base.center = CGPoint(x: base.center.x, y: newValue) }
    }
    
    var size: CGSize {
        get { return base.frame.size }
        set { base.frame.size = newValue }
    }
}

// MARK: - 截图

extension SwordJoy where Base: UIView {
    /// 截图
    ///
    /// - Returns: 截出来的图
    func snapshotImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(base.bounds.size, base.isOpaque, 0)
        base.layer.render(in: UIGraphicsGetCurrentContext()!)
        let snap: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snap!
    }
}
