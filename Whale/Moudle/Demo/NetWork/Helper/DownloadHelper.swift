//
//  DownloadHelper.swift
//  Whale
//
//  Created by swordjoy on 2017/11/23.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation

class DownloadHelper {
    
    var downloadSession: URLSession!
    var activeDownloads: [URL: Download] = [:]
    var cacheURL: URL!
    
    func startDownload(_ song: Song) {
        let download = Download(song: song)
        guard let downloadURL = download.song.previewURL, activeDownloads[downloadURL] == nil else { return }
        cacheURL = downloadURL
        download.task = downloadSession.downloadTask(with: downloadURL)
        download.task!.resume()
        download.isDownloading = true
        activeDownloads[downloadURL] = download
    }
    
    func cancelDownload(_ song: Song) {
        guard let downloadURL = song.previewURL else { return }
        
        if let download = activeDownloads[downloadURL] {
            download.task?.cancel()
            activeDownloads[downloadURL] = nil
        }
    }
    
    func pauseDownload(_ song: Song) {
        guard let downloadURL = song.previewURL else { return }
        guard let download = activeDownloads[downloadURL] else { return }
        if download.isDownloading {
            download.task?.cancel(byProducingResumeData: { data in
                print("缓存-\(data!.count)")
                download.resumeData = data
            })
            download.isDownloading = false
        }
    }
    
    func resumeDownload(_ song: Song) {
        guard let downloadURL = song.previewURL else { return }
        guard let download = activeDownloads[downloadURL] else { return }
        if let resumeData = download.resumeData {
            download.task = downloadSession.downloadTask(withResumeData: resumeData)
        } else {
            download.task = downloadSession.downloadTask(with: downloadURL)
        }
        download.task!.resume()
        download.isDownloading = true
    }
}
