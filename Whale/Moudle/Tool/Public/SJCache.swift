//
//  SJCache.swift
//  Whale
//
//  Created by swordjoy on 2017/12/12.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation

struct SJCache {

    /// mainBundle
    public static var mainBundle = Bundle.main
    
    public static var homeDirectory = NSHomeDirectory()
    // 会同步iTunes
    public static var documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
    // Library/Cache 不会同步iTunes
    public static var caches = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
    // Library/Preferences, 用户偏好设置,会同步iTunes
    public static var preferences = NSSearchPathForDirectoriesInDomains(.preferencePanesDirectory, .userDomainMask, true).first
    
    public static var library = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first
    // 临时文件,会自动清理
    public static var tmp = NSTemporaryDirectory()
    
}
