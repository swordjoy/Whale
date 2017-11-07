//
//  ViewController.swift
//  Whale
//
//  Created by swordjoy on 2017/10/27.
//  Copyright © 2017年 LIU LV YANG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SJScanHelper.shared.startScan(with: view)

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

