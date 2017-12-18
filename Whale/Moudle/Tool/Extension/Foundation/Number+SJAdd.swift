//
//  Number+SJAdd.swift
//  Whale
//
//  Created by swordjoy on 2017/10/31.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation
import UIKit

/// 获取安全的随机数(32位)
///
/// - Parameter range: 随机数范围
/// - Returns: 得到的随机数
public func random(in range: Range<Int>) -> Int {
    let count = UInt32(range.upperBound - range.lowerBound)
    return Int(arc4random_uniform(count)) + range.lowerBound
}

extension NSNumber {
    var cgFloat: CGFloat { return CGFloat(truncating: self) }
}

extension Int64 {
    var cgFloat: CGFloat { return CGFloat(self) }
}

extension Int {
    
    var radian: Double {
        return Double.pi * self.double / 180
    }
    
    var double: Double { return Double(self) }
    
    var cgFloat: CGFloat { return CGFloat(self) }
    
    var adaptor: CGFloat {
        let sacle = UIScreen.width / 375
        let temp = self.cgFloat * sacle
        return temp.intRound.cgFloat
    }
    
    var ASCII_CHAR: String {
        return Character(UnicodeScalar(self)!).description
    }
}

extension Double {
    
    var degrees: Double {
        return self * 180 / Double.pi
    }
    
    var intValue: Int { return Int(self) }
    
    var intRound: Int { return lround(self) }
    
    var cgFloat: CGFloat { return CGFloat(self) }
    
    var string02: String { return String(format: "%.2f", self)}
}

extension CGFloat {
    var int: Int { return Int(self) }
    
    var double: Double { return Double(self) }
    
    /// 四舍五入成int
    var intRound: Int { return lroundf(Float(self)) }
    
    /// 向下取整
    var ceilValue: CGFloat {
        return ceil(double).cgFloat
    }
    
    /// 适配
    var adaptor: CGFloat {
        let sacle = UIScreen.width / 375
        let temp = self * sacle
        return temp.intRound.cgFloat
    }
}
