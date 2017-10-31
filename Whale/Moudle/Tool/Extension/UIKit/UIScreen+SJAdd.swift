//
//  UIScreen+SJAdd.swift
//  SJSwiftKit
//
//  Created by swordjoy on 2017/3/7.
//  Copyright © 2017年 swordjoy. All rights reserved.
//

import Foundation
import UIKit

public extension UIScreen {
  /// 屏幕宽
    public static var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
  /// 屏幕高
    public static var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
  
}
