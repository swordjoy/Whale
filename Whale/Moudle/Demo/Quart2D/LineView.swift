//
//  LineView.swift
//  Whale
//
//  Created by swordjoy on 2017/12/19.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import UIKit
import CoreGraphics

class LineView: UIView {

//    CGPoint(x: 210.0, y: 30.0),
//    CGPoint(x: 210.0, y: 60.0),
//    CGPoint(x: 240.0, y: 60.0)
    // 根据圆心、半径、角度绘制。clockwise 为 true 为顺时针public func addArc(center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool)
    // 当前点于第一个end点的连线，第一个end点与第二个end点的连线构成相交的两个线段，绘制与这两条直线相切并且满足半径条件的圆弧。
    // public func addArc(tangent1End: CGPoint, tangent2End: CGPoint, radius: CGFloat)Curves
    override func draw(_ rect: CGRect) {
        // 获取上下文
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setLineWidth(2)
        context.setStrokeColor(UIColor.white.cgColor)
//        context.move(to: CGPoint(x: 0, y: 50))
//        context.addArc(tangent1End: CGPoint(x: 0, y: 0), tangent2End: CGPoint(x: 50, y: 0), radius: 50)
        // clockwise 为 true 是顺时针, false 是 逆时针
//        context.addArc(center: CGPoint(x: 300, y: 70), radius: 50, startAngle: CGFloat(-Double.pi / 2), endAngle: CGFloat(Double.pi / 3), clockwise: false)
//        context.addCurve(to: <#T##CGPoint#>, control1: <#T##CGPoint#>, control2: <#T##CGPoint#>)
//        context.addEllipse(in: <#T##CGRect#>)
        //显示路径
        
        context.strokePath()
        
    }

    
}


