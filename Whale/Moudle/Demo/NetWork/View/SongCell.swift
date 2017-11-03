//
//  SongCell.swift
//  Whale
//
//  Created by swordjoy on 2017/11/3.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {
    
    var songInfo: Song! {
        didSet {
            songNameLabel.text = songInfo.songName
            singerLabel.text = songInfo.singer
        }
    }
    
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }

}

// MARK: - config
extension SongCell {
    
    private func config() {
        songNameLabel.font = UIFont.systemFont(ofSize: 16)
        singerLabel.font = UIFont.systemFont(ofSize: 12)
        singerLabel.textColor = UIColor.lightGray
    }
    
}
