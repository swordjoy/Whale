//
//  Dispatch+SJAdd.swift
//  Whale
//
//  Created by swordjoy on 2017/10/31.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation
import Dispatch

/// 主线程运行闭包
///
/// - Parameter block: 需要在主线程运行的闭包代码
public func runOnMainThread(_ closure: @escaping () -> Void) {
    DispatchQueue.main.async(execute: {
        closure()
    })
}

/// 后台线程运行闭包
///
/// - Parameter block: 需要在后台线程运行的闭包代码
public func runInBackground(_ closure: @escaping () -> Void) {
    DispatchQueue.global().async {
        closure()
    }
}
