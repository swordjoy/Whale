//
//  SJPermission.swift
//  Whale
//
//  Created by swordjoy on 2017/11/6.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation
import AVFoundation
import Photos

public struct SJPermission {
    
    // 请求相册权限
    public static func requestPhotosPermission(completion: @escaping BoolClosure) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
            case .authorized: completion(true)
            case .denied, .restricted: completion(false)
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization { (status) in
                    let temp = (status == .authorized)
                    runOnMainThread {
                        completion(temp)
                    }
                }
            }
    }
    
    // 请求相机权限
    public static func requestCameraPermission(completion: @escaping BoolClosure) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized: completion(true)
        case .denied, .restricted: completion(false)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (status) in
                runOnMainThread {
                    completion(status)
                }
            })
        }
    }
    
    // 去设置界面
    public static func toSetting() {
        guard let temp = URL(string: UIApplicationOpenSettingsURLString) else { return }
        if #available(iOS 10, *) {
            UIApplication.shared.open(temp, options: [:], completionHandler: nil)
        }
        else{
            UIApplication.shared.openURL(temp)
        }
    }
    
}
