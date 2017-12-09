//
//  FileHelper.swift
//  Whale
//
//  Created by swordjoy on 2017/11/23.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation

let fileManager = FileManager.default

let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
func localFilePath(for url: URL) -> URL {
    return documentsPath.appendingPathComponent(url.lastPathComponent)
}
