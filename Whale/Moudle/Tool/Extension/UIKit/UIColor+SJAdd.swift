//
//  UIColor+SJAdd.swift
//  SJExtension
//
//  Created by swordjoy on 2017/7/13.
//  Copyright © 2017年 swordjoy. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    /// 16进制获取颜色, 这个方法必须要输入正确,不然可能崩溃
    ///
    /// 例子:
    /// view.backgroundColor = UIColor.hex("#FFB6C1")
    ///
    /// - Parameters:
    ///   - string: 16进制字符串
    ///   - alpha: alpha通道, 默认为1.0
    /// - Returns: 颜色
    public static func hex(_ string: String, alpha: CGFloat = 1.0) -> UIColor {
        var cString = string.uppercased()
        if cString.count != 7 { fatalError("input hex string is not right") }
        
        let flagOffset = cString.index(cString.startIndex, offsetBy: 1)
        let flagString = cString[cString.startIndex..<flagOffset]
        if flagString != "#" { fatalError("input hex string is not right") }

        cString =  String(cString[flagOffset...])

        let rOffset = cString.startIndex
        let gOffset = cString.index(rOffset, offsetBy: 2)
        let bOffset = cString.index(gOffset, offsetBy: 2)

        let rString = cString[rOffset...cString.index(rOffset, offsetBy: 1)]
        let gString = cString[gOffset...cString.index(gOffset, offsetBy: 1)]
        let bString = cString[bOffset...cString.index(bOffset, offsetBy: 1)]

        var r: CUnsignedInt = 0, g: CUnsignedInt = 0, b: CUnsignedInt = 0;
        Scanner(string: String(rString)).scanHexInt32(&r)
        Scanner(string: String(gString)).scanHexInt32(&g)
        Scanner(string: String(bString)).scanHexInt32(&b)

        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
}
