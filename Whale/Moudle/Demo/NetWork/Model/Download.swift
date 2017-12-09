//
//  Download.swift
//  Whale
//
//  Created by swordjoy on 2017/11/23.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation

class Download {
    
    var song: Song
    
    var task: URLSessionDownloadTask?
    var isDownloading = false
    var resumeData: Data?
    var progress: Float = 0
    
    init(song: Song) {
        self.song = song
    }
}
