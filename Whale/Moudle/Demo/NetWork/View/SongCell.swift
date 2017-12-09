//
//  SongCell.swift
//  Whale
//
//  Created by swordjoy on 2017/11/3.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import UIKit

protocol SongCellDelegate {
    func pauseTapped(_ cell: SongCell)
    func resumeTapped(_ cell: SongCell)
    func cancelTapped(_ cell: SongCell)
    func downloadTapped(_ cell: SongCell)
}


class SongCell: UITableViewCell {
    
    var delegate: SongCellDelegate?
    
    var songInfo: Song! {
        didSet {
            songNameLabel.text = songInfo.songName
            singerLabel.text = songInfo.singer
        }
    }
    
    var download: Download? {
        didSet {
            var isShowDownload = false
            
            if let temp = download {
                isShowDownload = true
                let title = temp.isDownloading ? "暂停" : "恢复"
                progressLabel.text = temp.isDownloading ? "连接中..." : "暂停"
                pauseButton.setTitle(title, for: .normal)
                downloadButton.isHidden = temp.isDownloading
                progressView.progress = temp.progress
            }
            
            // 下载按钮有的时候全隐藏
            pauseButton.isHidden = !isShowDownload
            cancelButton.isHidden = !isShowDownload
            progressView.isHidden = !isShowDownload
            progressLabel.isHidden = !isShowDownload
            
            downloadButton.isHidden = songInfo.downloaded || isShowDownload
        }
    }
    
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }

    @IBAction func downloadAction(_ sender: UIButton) {
        delegate?.downloadTapped(self)
    }
    
    @IBAction func pauseAction(_ sender: UIButton) {
        guard let temp = download else { return }
        if temp.isDownloading {
            delegate?.pauseTapped(self)
        }
        else {
            delegate?.resumeTapped(self)
        }
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        progressView.progress = 0
        delegate?.cancelTapped(self)
    }
    
    func updateDisplay(progress: Float, totalSize : String) {
        progressView.progress = progress
        progressLabel.text = String(format: "%.1f%% of %@", progress * 100, totalSize)
    }
    
}

// MARK: - config
extension SongCell {
    
    private func config() {
        songNameLabel.font = UIFont.systemFont(ofSize: 16)
        singerLabel.font = UIFont.systemFont(ofSize: 12)
        singerLabel.textColor = UIColor.lightGray
        progressView.progress = 0
    }
    
}
