//
//  UITextField+SJAdd.swift
//  Whale
//
//  Created by swordjoy on 2017/12/11.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import UIKit

public extension SwordJoy where Base: UITextField {
    
    public var text: String {
        return base.text ?? ""
    }
    
    public func setPlaceholder(_ font: UIFont,_ textColor: UIColor) {
        base.setValue(textColor, forKeyPath: "_placeholderLabel.textColor")
        base.setValue(font, forKeyPath: "_placeholderLabel.font")
    }
    
}

// placeholder 居中
extension String {
    func attributedString(aligment: NSTextAlignment) -> NSAttributedString {
        return NSAttributedString(text: self, aligment: aligment)
    }
}

extension NSAttributedString {
    convenience init(text: String, aligment: NSTextAlignment) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = aligment
        self.init(string: text, attributes: [NSAttributedStringKey.paragraphStyle: paragraphStyle])
    }
}
