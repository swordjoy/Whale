//
//  String+SJRegex.swift
//  Whale
//
//  Created by swordjoy on 2017/12/16.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation

extension SJStringProxy {
    
    /// 验证是否是手机号码(简单验证,只验证1开头,3-9第二位的11位数字)
    var isMatchChinaPhoneNumber: Bool {
        return base=~"1[3-9]\\d{9}"
    }
    
}

// MARK: - 来自 猫神 swift tips
struct RegexHelper {
    let regex: NSRegularExpression
    
    init(_ pattern: String) throws {
        try regex = NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
    func match(_ input: String) -> Bool {
        let matchs = regex.matches(in: input, options: [], range: NSMakeRange(0, input.utf16.count))
        return matchs.count > 0
    }
}

precedencegroup MatchPrecedence {
    associativity: none
    higherThan: DefaultPrecedence
}

infix operator =~: MatchPrecedence

func =~(lns: String, rhs: String) -> Bool {
    do {
        return try RegexHelper(rhs).match(lns)
    } catch _ {
        return false
    }
}
