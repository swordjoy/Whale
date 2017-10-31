//
//  Number+SJAdd.swift
//  Whale
//
//  Created by swordjoy on 2017/10/31.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation
import UIKit

extension NSNumber {
    var cgFloat: CGFloat { return CGFloat(truncating: self) }
}

extension Int64 {
    var cgFloat: CGFloat { return CGFloat(self) }
}

extension Int {
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
