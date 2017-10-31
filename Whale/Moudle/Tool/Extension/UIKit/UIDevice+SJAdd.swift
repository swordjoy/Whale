//
//  UIDevice+SJAdd.swift
//  SJSwiftKit
//
//  Created by swordjoy on 2017/3/7.
//  Copyright © 2017年 swordjoy. All rights reserved.
//

import UIKit



public extension UIDevice {
// MARK: - 电量观察
    
  /// 是否观察低电量
    private static var lowPowerModeObserver = false
  
    @available(iOS 9.0, *)
  /// 设备是否低电量
    public static var isLowPowerModeEnabled: Bool {
        return ProcessInfo.processInfo.isLowPowerModeEnabled
    }
  
    @objc @available(iOS 9.0, *)
  /// 设备低电量状态改变时候执行闭包代码
  ///
  /// - Parameter block: 切换时执行代码
    public static func lowPowerModeChanged(_ block: @escaping (_ isLowPowerModeEnabled: Bool) -> Void) {
        if !lowPowerModeObserver {
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(lowPowerModeChanged(_:)),
                                                   name: .NSProcessInfoPowerStateDidChange,
                                                   object: nil)
                lowPowerModeObserver = true
            }

        block(UIDevice.isLowPowerModeEnabled)
    }
  
}

// MARK: - 设备型号系统信息

public extension UIDevice {
  
  /// 是否是iPhone
    public static var isPhone: Bool {
        let start = self.detailedModel.startIndex
        let end = self.detailedModel.index(start, offsetBy: 5, limitedBy: self.detailedModel.endIndex)
        guard let tempEnd = end else { return false }
        let temp = self.detailedModel[start...tempEnd]
        return temp == "iPhone"
    }
  
  /// 是否是iPod
    public static var isPod: Bool {
        let start = self.detailedModel.startIndex
        let end = self.detailedModel.index(start, offsetBy: 3, limitedBy: self.detailedModel.endIndex)
        guard let tempEnd = end else { return false }
        let temp = self.detailedModel[start...tempEnd]
        return temp == "iPod"
    }
  
  /// 是否是模拟器
    public static var isSimulator: Bool { return self.detailedModel == "Simulator" }
  
  /// 是否越狱
    public static var isJailbroken: Bool {
        return UIApplication.shared.canOpenURL(URL(string: "cydia://")!) ||
        FileManager.default.fileExists(atPath: "/bin/bash")
    }
  
  /// 获取设备UUID
    public static var generateUniqueIdentifier: String {
        return UUID().uuidString
    }
  
  /// 获取设备系统版本
    public static var osVersion: String {
        return UIDevice.current.systemVersion
    }

  /// 获取设备运行平台
    public static var hardwareModel: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
  
  /// 获取设备型号
    public static var detailedModel: String {
        let platform: String = self.hardwareModel

        switch platform {
            // iPhone
            case "iPhone1,1":       return "iPhone 2G"
            case "iPhone1,2":       return "iPhone 3G"
            case "iPhone2,1":       return "iPhone 3GS"
            case "iPhone3,1":       return "iPhone 4 (GSM)"
            case "iPhone3,2":       return "iPhone 4 (Rev. A)"
            case "iPhone3,3":       return "iPhone 4 (CDMA)"
            case "iPhone4,1":       return "iPhone 4S"
            case "iPhone5,1":       return "iPhone 5 (GSM)"
            case "iPhone5,2":       return "iPhone 5 (CDMA)"
            case "iPhone5,3":       return "iPhone 5c (GSM)"
            case "iPhone5,4":       return "iPhone 5c (Global)"
            case "iPhone6,1":       return "iPhone 5s (GSM)"
            case "iPhone6,2":       return "iPhone 5s (Global)"
            case "iPhone7,1":       return "iPhone 6 Plus"
            case "iPhone7,2":       return "iPhone 6"
            case "iPhone8,1":       return "iPhone 6s"
            case "iPhone8,2":       return "iPhone 6s Plus"
            case "iPhone8,4":       return "iPhone SE"
            case "iPhone9,1":       return "iPhone 7"
            case "iPhone9,2":       return "iPhone 7 Plus"
            case "iPhone9,3":       return "iPhone 7"
            case "iPhone9,4":       return "iPhone 7 Plus"
            case "iPhone10,1":  return "iPhone 8"
            case "iPhone10,4":  return "iPhone 8"
            case "iPhone10,2":  return "iPhone 8 Plus"
            case "iPhone10,5":  return "iPhone 8 Plus"
            case "iPhone10,3":  return "iPhone X"
            case "iPhone10,6":  return "iPhone X"
            // iPod
            case "iPod1,1":         return "iPod touch 1G"
            case "iPod2,1":         return "iPod touch 2G"
            case "iPod3,1":         return "iPod touch 3G"
            case "iPod4,1":         return "iPod touch 4G"
            case "iPod5,1":         return "iPod touch 5G"
            case "iPod7,1":         return "iPod touch 6G"
            // iPad
            case "iPad1,1":         return "iPad 1"
            case "iPad2,1":         return "iPad 2 (WiFi)"
            case "iPad2,2":         return "iPad 2 (GSM)"
            case "iPad2,3":         return "iPad 2 (CDMA)"
            case "iPad2,4":         return "iPad 2 (32nm)"
            case "iPad3,1":         return "iPad 3 (WiFi)"
            case "iPad3,2":         return "iPad 3 (CDMA)"
            case "iPad3,3":         return "iPad 3 (GSM)"
            case "iPad3,4":         return "iPad 4 (WiFi)"
            case "iPad3,5":         return "iPad 4 (GSM)"
            case "iPad3,6":         return "iPad 4 (CDMA)"
            case "iPad4,1":         return "iPad Air (WiFi)"
            case "iPad4,2":         return "iPad Air (Cellular)"
            case "iPad4,3":         return "iPad Air (China)"
            case "iPad5,3":         return "iPad Air 2 (WiFi)"
            case "iPad5,4":         return "iPad Air 2 (Cellular)"
            // iPad mini
            case "iPad2,5":         return "iPad mini (WiFi)"
            case "iPad2,6":         return "iPad mini (GSM)"
            case "iPad2,7":         return "iPad mini (CDMA)"
            case "iPad4,4":         return "iPad mini 2 (WiFi)"
            case "iPad4,5":         return "iPad mini 2 (Cellular)"
            case "iPad4,6":         return "iPad mini 2 (China)"
            case "iPad4,7":         return "iPad mini 3 (WiFi)"
            case "iPad4,8":         return "iPad mini 3 (Cellular)"
            case "iPad4,9":         return "iPad mini 3 (China)"
            // iPad Pro 9.7
            case "iPad6,3":         return "iPad Pro 9.7 (WiFi)"
            case "iPad6,4":         return "iPad Pro 9.7 (Cellular)"
            // iPad Pro 12.9
            case "iPad6,7":         return "iPad Pro 12.9 (WiFi)"
            case "iPad6,8":         return "iPad Pro 12.9 (Cellular)"
            // Apple TV
            case "AppleTV2,1":      return "Apple TV 2G"
            case "AppleTV3,1":      return "Apple TV 3G"
            case "AppleTV3,2":      return "Apple TV 3G"
            case "AppleTV5,3":      return "Apple TV 4G"
            // Apple Watch
            case "Watch1,1":        return "Apple Watch 38mm"
            case "Watch1,2":        return "Apple Watch 42mm"
            case "Watch2,3":        return "Apple Watch Series 2 38mm"
            case "Watch2,4":        return "Apple Watch Series 2 42mm"
            case "Watch2,6":        return "Apple Watch Series 1 38mm"
            case "Watch2,7":        return "Apple Watch Series 1 42mm"
            // Simulator
            case "i386", "x86_64":  return "Simulator"
            default:
              return "Unknown"
        }
    }
}

