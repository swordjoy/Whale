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

// 需要重新想一想
public typealias Task = (_ cancle: Bool) -> Void

public func delay(_ time: TimeInterval, task: @escaping VoidClosure) -> Task? {
    
    func dispatch_later(block: @escaping VoidClosure) {
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    
    var closure: VoidClosure? = task
    var result: Task?
    
    let delayedClosure: Task = { cancle in
        if let internalClosure = closure {
            if cancle == false {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    
    return result
    
}
