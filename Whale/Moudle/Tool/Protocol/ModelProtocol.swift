//
//  ModelProtocol.swift
//  Employee
//
//  Created by swordjoy on 2017/3/14.
//  Copyright © 2017年 remotevillage. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol ModelProtocol {
  
  init(json: JSON)
  
  static func array(from jsonArray: [JSON]) -> [Self]
}
