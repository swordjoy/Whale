//
//  ViewController.swift
//  Whale
//
//  Created by swordjoy on 2017/10/27.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import UIKit
import SnapKit

enum GameError: Error {
    case monster(String)
    case starvation
    case impasse
}

class Hero {
    var damage: Int
    var hunger: Int
    
    init(damage: Int, hunger: Int) {
        self.damage = damage
        self.hunger = hunger
    }
    
    func passMaze(_ direction: Int) throws  {
        self.hunger -= 1
        if self.hunger <= 0 {
            throw GameError.starvation
        }
        
        if damage < 10 {
            throw GameError.monster("史莱姆")
        }
        
        if direction % 2 == 0 {
            throw GameError.impasse
        }
        
        print("success")
        
        
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(view.safeAreaLayoutGuide.snp.top)
        
//        guard let urlComponents = URLComponents.init(string: "http://mobile.hktsc.cc/services/list?appPage=serviceList&brandId=1") else {
//            return
//        }
//
//        if let scheme = urlComponents.scheme {
//            print("scheme: \(scheme)")
//        }
//
//        if let user = urlComponents.user {
//            print("user: \(user)")
//        }
//
//        if let password = urlComponents.password {
//            print("password: \(password)")
//        }
//
//        if let host = urlComponents.host {
//            print("host: \(host)")
//        }
//
//        if let port = urlComponents.port {
//            print("port: \(port)")
//        }
//
//        print("path: \(urlComponents.path)")
//
//        if let query = urlComponents.query {
//            print("query: \(query)")
//        }
//
//        if let queryItems = urlComponents.queryItems {
//            print("queryItems: \(queryItems)")
//
//            for (index, queryItem) in queryItems.enumerated() {
//                print("第\(index)个queryItem name:\(queryItem.name)")
//                if let value = queryItem.value {
//                    print("第\(index)个queryItem value:\(value)")
//                }
//            }
//        }
    }
}

