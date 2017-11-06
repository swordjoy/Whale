//
//  SJPermission.swift
//  Whale
//
//  Created by swordjoy on 2017/11/6.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation
import Photos

public struct SJPermission {
    
    // 先在plist文件里面添加相册授权
    // 此时处于notDetermined状态,请求相册出现体统弹窗,选择好,同意后为authorized状态,否为denied状态
    // 此时处于authorized状态,请求相册不出现系统弹窗,但闭包里面会再次执行
    public static func requestCameraPermission(completion: @escaping BoolClosure) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
            case .authorized: completion(true)
            case .denied, .restricted: completion(false)
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization { (status) in
                    let temp = (status == .authorized)
                    completion(temp)
                }
            }
    }
    
    
}
