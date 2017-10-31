//
//  UIImage+SJAdd.swift
//  Whale
//
//  Created by swordjoy on 2017/10/31.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    var uploadData: Data {
        let data = UIImageJPEGRepresentation(uploadImage, 0.5)!
        return data
    }
    
    /*
     据说仿照微信
     宽高均 <= 1280，图片尺寸大小保持不变
     宽或高 > 1280 && 宽高比 <= 2，取较大值等于1280，较小值等比例压缩
     宽或高 > 1280 && 宽高比 > 2 && 宽或高 < 1280，图片尺寸大小保持不变
     宽高均 > 1280 && 宽高比 > 2，取较小值等于1280，较大值等比例压缩
     */
    var uploadSize: CGSize {
        var width = self.size.width
        var height = self.size.height
        
        let boundary: CGFloat = 1280
        
        // 宽高均 <= 1280，图片尺寸大小保持不变
        guard width > boundary || height > boundary else {
            return CGSize(width: width, height: height)
        }
        
        let s = max(width, height) / min(width, height)
        // 宽高比 <= 2
        if s <= 2 {
            // 取较大值等于1280，较小值等比例压缩
            let x = max(width, height) / boundary
            if width > height {
                width = boundary
                height = height / x
            } else {
                height = boundary
                width = width / x
            }
        }
            // 宽高比 > 2
        else {
            // 取较小值等于1280，较大值等比例压缩
            if min(width, height) >= boundary {
                // 取较小值等于1280，较大值等比例压缩
                let x = min(width, height) / boundary
                if width < height {
                    width = boundary
                    height = height / x
                } else {
                    height = boundary
                    width = width / x
                }
            }
        }
        return CGSize(width: width, height: height)
    }
    
    // 这里变相调整了图片的方向
    var uploadImage: UIImage {
        UIGraphicsBeginImageContextWithOptions(uploadSize, false, self.scale)
        let rect = CGRect(x: 0, y: 0, width: uploadSize.width, height: uploadSize.height)
        self.draw(in: rect)
        let upImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return upImage!
    }
}
