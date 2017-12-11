//
//  UITextField+SJAdd.swift
//  Whale
//
//  Created by swordjoy on 2017/12/11.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import UIKit

extension SwordJoy where Base: UITextField {
    
    var text: String {
        return base.text ?? ""
    }
    
}
