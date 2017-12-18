//
//  UINavigationBar+SJAdd.swift
//  Whale
//
//  Created by swordjoy on 2017/12/18.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import UIKit

extension SwordJoy where Base: UINavigationBar {
    
    /// 设置title的颜色和字体
    ///
    /// - Parameters:
    ///   - font: 字体
    ///   - color: 颜色
    public func set(_ font: UIFont, _ color: UIColor) {
        base.titleTextAttributes = [NSAttributedStringKey.foregroundColor : color,
                                    NSAttributedStringKey.font : font]
    }
    
}
