//
//  SearchVC.swift
//  Whale
//
//  Created by swordjoy on 2017/11/3.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class SearchVC: UITableViewController {

    lazy var searchController: UISearchController = lazySearchController()
    
    lazy var tapRecognizer: UITapGestureRecognizer = {
        var recognizer = UITapGestureRecognizer(target:self, action: #selector(dismissKeyboard))
        return recognizer
    }()
    
    lazy var downloadsSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }()
    
    var searchResults: [Song] = []
    let requestHelper = RequestHelper()
    let downloadHelper = DownloadHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        downloadHelper.downloadSession = downloadsSession
    }
    
}

// MARK: - config
extension SearchVC {
    
    private func lazySearchController() -> UISearchController {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }
    
    private func config() {
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.title = "歌单"
        navigationItem.searchController = searchController
        tableView.tableFooterView = UIView()
    }
    
    func reload(_ row: Int) {
        tableView.reloadRows(at: [IndexPath(row: row, section: 0)], with: .none)
    }
    
    func playDownload(_ song: Song) {
        guard let temp = song.previewURL else { return }
        
        let playerViewController = AVPlayerViewController()
        playerViewController.entersFullScreenWhenPlaybackBegins = true
        playerViewController.exitsFullScreenWhenPlaybackEnds = true
        self.showDetailViewController(playerViewController, sender: nil)
        let url = localFilePath(for: temp)
        let player = AVPlayer(url: url)
        playerViewController.player = player
        player.play()
    }
}

extension SearchVC: SongCellDelegate {
    func pauseTapped(_ cell: SongCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            let song = searchResults[indexPath.row]
            downloadHelper.pauseDownload(song)
            reload(indexPath.row)
        }
    }
    
    func resumeTapped(_ cell: SongCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            let song = searchResults[indexPath.row]
            downloadHelper.resumeDownload(song)
            reload(indexPath.row)
        }
    }
    
    func cancelTapped(_ cell: SongCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            let song = searchResults[indexPath.row]
            downloadHelper.cancelDownload(song)
            reload(indexPath.row)
        }
    }
    
    func downloadTapped(_ cell: SongCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            let song = searchResults[indexPath.row]
            downloadHelper.startDownload(song)
            reload(indexPath.row)
        }
        downloadHelper.startDownload(cell.songInfo)
    }
    
}

// MARK: - tableView delegate
extension SearchVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SongCell = tableView.dequeueReusableCell(for: indexPath)
        let song = searchResults[indexPath.row]
        cell.songInfo = song
        if let temp = song.previewURL {
            cell.download = downloadHelper.activeDownloads[temp]
        }
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = searchResults[indexPath.row]
        if song.downloaded {
            playDownload(song)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
// MARK: - URLSessionDownloadDelegate
extension SearchVC: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let downloadURL = downloadTask.originalRequest?.url else { return }
        let download = downloadHelper.activeDownloads[downloadURL]
        downloadHelper.activeDownloads[downloadURL] = nil
        
        let destinationURL = localFilePath(for: downloadURL)
        print(downloadURL)
        
        let fileManager = FileManager.default
        try? fileManager.removeItem(at: destinationURL)
        do {
            try fileManager.copyItem(at: location, to: destinationURL)
            download?.song.downloaded = true
        } catch let error {
            print("Could not copy file to disk: \(error.localizedDescription)")
        }
        
        if let index = download?.song.index {
            DispatchQueue.main.async {
                self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
            }
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64, totalBytesWritten: Int64,
                    totalBytesExpectedToWrite: Int64) {
        guard let url = downloadTask.currentRequest?.url, let download = downloadHelper.activeDownloads[url] else { return }
        download.progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        print("\(totalBytesWritten)/\(totalBytesExpectedToWrite)")
        let totalSize = ByteCountFormatter.string(fromByteCount: totalBytesExpectedToWrite, countStyle: .file)
        DispatchQueue.main.async {
            if let trackCell = self.tableView.cellForRow(at: IndexPath(row: download.song.index,
                                                                       section: 0)) as? SongCell {
                trackCell.updateDisplay(progress: download.progress, totalSize: totalSize)
            }
        }
    }

}



