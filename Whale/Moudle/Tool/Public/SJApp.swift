//
//  SJAPP.swift
//  SJSwiftKit
//
//  Created by swordjoy on 2017/2/16.
//  Copyright © 2017年 swordjoy. All rights reserved.
//

import UIKit

/// 空闭包
public typealias VoidClosure = () -> ()
public typealias BoolClosure = (Bool) -> ()

public struct SJApp {
    
    /// appdelegate
    public static let appDelegate = UIApplication.shared.delegate
    
// MARK: - APP信息
    private static let SJAppHasBeenOpened = "SJAppHasBeenOpened"
    /// 获取APP name
    public static var name: String = SJApp.stringFromInfoDictionary(forKey: "CFBundleDisplayName")
    /// 获取APP 版本号
    public static var version: String = SJApp.stringFromInfoDictionary(forKey: "CFBundleShortVersionString")
    /// 获取APP Build号
    public static var build: String = SJApp.stringFromInfoDictionary(forKey: "CFBundleVersion")
    /// 获取APP 项目名
    public static var executable: String = SJApp.stringFromInfoDictionary(forKey: "CFBundleExecutable")
    /// 获取APP Bundle ID
    public static var bundle: String = SJApp.stringFromInfoDictionary(forKey: "CFBundleIdentifier")
  
    /// 获取info字典的app信息
    ///
    /// - Parameter key: 信息key
    /// - Returns: 信息
    private static func stringFromInfoDictionary(forKey key: String) -> String {
        guard let infoDictionary = Bundle.main.infoDictionary, let value = infoDictionary[key] as? String else {
            return ""
        }
        return value
    }
  
// MARK: - Function
  
  /// debug执行
  ///
  /// - Parameter block: debug环境下执行的闭包代码
  public static func debug(_ block: () -> Void) {
      #if DEBUG
          block()
      #endif
  }
  
  /// 发布版本执行
  ///
  /// - Parameter block: 发布环境下执行的闭包代码
  public static func release(_ block: () -> Void) {
      #if !DEBUG
          block()
      #endif
  }
  
  /// 判断某个版本APP是否第一次运行
  ///
  /// - Parameter version: APP版本 默认为设置版本
  /// - Returns: 布尔值
    public static func isFirstStart(version: String = SJApp.version) -> Bool {
        let key: String
        if version == "" { key = SJAppHasBeenOpened }
        else { key = SJAppHasBeenOpened + "\(version)" }

        let defaults = UserDefaults.standard
        let hasBeenOpened: Bool = defaults.bool(forKey: key)

        return !hasBeenOpened
    }
  
    /// 如果该版本第一次进入,执行闭包代码
    ///
    /// - Parameter closure: 该版本第一次进入时,执行的闭包代码
    public static func onFirstStart(_ closure: () -> Void ) {
        let key = SJAppHasBeenOpened + "\(version)"

        let defaults = UserDefaults.standard
        let hasBeenOpened: Bool = defaults.bool(forKey: key)
        if hasBeenOpened != true {
            defaults.set(true, forKey: key)
            closure()
        }
    }
}

// MARK: - 路径
extension SJApp {
    
  public static var homeDirectory = NSHomeDirectory()
  // 会同步iTunes
  public static var documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
  // Library/Cache 不会同步iTunes
  public static var caches = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
  // Library/Preferences, 用户偏好设置,会同步iTunes
  public static var preferences = NSSearchPathForDirectoriesInDomains(.preferencePanesDirectory, .userDomainMask, true).first!
    
  public static var library = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first!
  // 临时文件,会自动清理
  public static var tmp = NSTemporaryDirectory()
}

// MARK: - log
extension SJApp {
  
  /// 自定义DEBUG打印
  ///
  /// - Parameters:
  ///   - message: 打印的字符串
  ///   - filename: 打印所在文件
  ///   - function: 打印所在方法
  ///   - line: 打印所在行数
  public static func log(_ item: Any, filename: String = #file, function: StaticString = #function, line: Int = #line) {
    #if DEBUG
      let filenameWithoutExtension = NSURL(string: String(describing: NSString(utf8String: filename)!))!.deletingPathExtension!.lastPathComponent
      let log = "file: \(filenameWithoutExtension)\nline: \(line)\nfunc: \(function)\nlog : \(item)"
      print(log)
      print("\n= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =\n")
    #endif
  }
}
