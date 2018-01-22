//
//  Sort.swift
//  Whale
//
//  Created by swordjoy on 2018/1/4.
//  Copyright © 2018年 LIU LV YANG. All rights reserved.
//

import Foundation

// 冒泡排序
func bubbleSort(_ numberArray: [Int]) -> [Int] {
    var tempArray = numberArray
    let count = tempArray.count
    if count < 2 { return tempArray }
    
    for j in 0..<tempArray.count {
        let n = count - 1 - j
        for i in 0..<n {
            if tempArray[i] > tempArray[i+1] {
                let temp = tempArray[i]
                tempArray[i] = tempArray[i+1]
                tempArray[i+1] = temp
            }
        }
    }
    
    return tempArray
}

// 快速排序,递归实现
func quickSort(_ numberArray: inout [Int], start: Int, end: Int) {
    let count = numberArray.count
    if count < 2 || start >= end { return }
    
    // 基准值
    let min = numberArray[end]
    var left = start
    var right = end - 1
    
    while (left < right) {
        // 1
        while (numberArray[left] < min && left < right) {
            left = left + 1
        }
        
        // 
        while (numberArray[right] >= min && left < right) {
            right = right - 1
        }
        numberArray.swapAt(left, right)
    }
    
    if numberArray[left] >= numberArray[end] {
        numberArray.swapAt(left, end)
    }
    else {
        left = left + 1
    }
    
    quickSort(&numberArray, start: start, end: left - 1)
    quickSort(&numberArray, start: left + 1, end: end)
}

// 插入排序
func insertSort(_ numberArray: inout [Int]) {
    let count = numberArray.count
    if count < 2 { return }
    
    for i in 0..<(count - 1) {
        var j = i + 1
        while (j > 0) {
            if numberArray[j - 1] <= numberArray[j] { break }
            numberArray.swapAt(j, j - 1)
            j = j - 1
        }
    }
}




