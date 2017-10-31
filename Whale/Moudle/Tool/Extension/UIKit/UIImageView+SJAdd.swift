//
//  UIImageView+SJAdd.swift
//  SJSwiftKit
//
//  Created by swordjoy on 2017/3/10.
//  Copyright © 2017年 swordjoy. All rights reserved.
//

import Foundation
import UIKit

// FIXME: - 待研究
extension SwordJoy where Base: UIImageView {
    func blur(style: UIBlurEffectStyle) {
        let blurEffect = UIBlurEffect(style: style)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.bounds = base.bounds
        base.addSubview(visualEffectView)
    }
}
