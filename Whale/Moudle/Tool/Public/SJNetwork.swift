//
//  SJNetwork.swift
//  Whale
//
//  Created by swordjoy on 2018/1/2.
//  Copyright © 2018年 LIU LV YANG. All rights reserved.
//

import Foundation
import SystemConfiguration.CaptiveNetwork

func printCurrentWifiInfo() {
    if let interface = CNCopySupportedInterfaces() {
        for i in 0..<CFArrayGetCount(interface) {
            let interfaceName: UnsafeRawPointer = CFArrayGetValueAtIndex(interface, i)
            let rec = unsafeBitCast(interfaceName, to: AnyObject.self)
            if let unsafeInterfaceData = CNCopyCurrentNetworkInfo("\(rec)" as CFString), let interfaceData = unsafeInterfaceData as? [String : AnyObject] {
                // connected wifi
                print("BSSID: \(String(describing: interfaceData["BSSID"])), SSID: \(String(describing: interfaceData["SSID"])), SSIDDATA: \(String(describing: interfaceData["SSIDDATA"]))")
            } else {
                print("not connected wifi")
            }
        }
    }
}
