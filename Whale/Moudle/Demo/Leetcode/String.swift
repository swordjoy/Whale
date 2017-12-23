//
//  String.swift
//  Whale
//
//  Created by swordjoy on 2017/12/19.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation


extension String {
    
    // first
    func getLongestPalindromicSubstring1() -> String {
        var currentChar: [Character] = []
        var resultChar: Character!
        var end = 0
        for (index, char) in self.enumerated() {
            resultChar = char
            if currentChar.contains(char) {
                end = index
                break
            }
            currentChar.append(char)
        }
        let startIndex = self.index(of: resultChar)!
        let offSet =  end - startIndex.encodedOffset
        let endIndex = self.index(startIndex, offsetBy: offSet)
        return String(self[startIndex...endIndex])
    }
    
}
