//
//  RequestHelper.swift
//  Whale
//
//  Created by swordjoy on 2017/11/3.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import Foundation
import SwiftyJSON

class RequestHelper {
    typealias JSONDictionary = [String: Any]
    typealias SearchResult = ([Song], String) -> ()
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func getSearchResult(searchKey: String, completion: @escaping SearchResult) {
        dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: "https://itunes.apple.com/search") {
            urlComponents.query = "media=music&entity=song&term=\(searchKey)"
            guard let url = urlComponents.url else { return }
            
            dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
                defer { self.dataTask = nil }
                guard error == nil, let data = data else {
                    runOnMainThread {
                        completion([], "error")
                    }
                    return
                }
            
                let json = JSON(data: data)
                let temps = Song.array(from: json["results"].arrayValue)
                runOnMainThread {
                    completion(temps, "")
                }
            })
            dataTask?.resume()
        }
    }
}
