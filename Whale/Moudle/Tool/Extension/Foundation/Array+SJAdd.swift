//
//  Array+SJAdd.swift
//  Whale
//
//  Created by swordjoy on 2017/10/31.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation

extension Array {
    /// 移除某个元素
    ///
    /// - Parameter object: 需要移除的元素
    public mutating func removeObject(_ object: Element) {
        var array: [String] = []
        for i in self {
            array.append("\(i)")
        }
        let index = array.index(of: "\(object)")
        if let index = index {
            self.remove(at: index)
        }
    }
    
    /// 循环获取数组元素
    ///
    /// - Parameter index: 任意值 例如-1 就是数组最后一个元素
    /// - Returns: 获取的数组元素
    public func circleObject(at index: Int) -> Element {
        return self[self.superCircle(at: index, size: self.count)]
    }
    
    private func superCircle(at index: Int, size maxSize: Int) -> Int {
        var _index = index
        if _index < 0 {
            _index = _index % maxSize
            _index += maxSize
        }
        if _index >= maxSize {
            _index = _index % maxSize
        }
        return _index
    }
}
