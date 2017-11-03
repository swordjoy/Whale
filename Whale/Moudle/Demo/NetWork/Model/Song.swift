//
//  Song.swift
//  Whale
//
//  Created by swordjoy on 2017/11/3.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Song: ModelProtocol {
    
    let songName: String
    let singer: String
    
    init(json: JSON) {
        self.songName = json["trackName"].stringValue
        self.singer = json["artistName"].stringValue
    }
    
    static func array(from jsonArray: [JSON]) -> [Song] {
        return jsonArray.map({ Song(json: $0) })
    }
    
}
