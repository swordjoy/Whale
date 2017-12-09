//
//  Song.swift
//  Whale
//
//  Created by swordjoy on 2017/11/3.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation
import SwiftyJSON

class Song {
    
    let songName: String
    let singer: String
    
    let previewURL: URL?
    let index: Int
    var downloaded = false
    
    init(json: JSON, index: Int) {
        self.songName = json["trackName"].stringValue
        self.singer = json["artistName"].stringValue
        self.previewURL = URL(string: json["previewUrl"].stringValue)
        self.index = index
    }
    
    static func array(from jsonArray: [JSON]) -> [Song] {
        var temps: [Song] = []
        for (index, json) in jsonArray.enumerated() {
            let song = Song(json: json, index: index)
            temps.append(song)
        }
        return temps
    }
    
}
