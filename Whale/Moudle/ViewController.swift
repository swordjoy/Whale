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
    @IBAction func callAction(_ sender: UIButton) {
        UIApplication.shared.isIdleTimerDisabled = true
    }

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.value = 50
        slider.minimumTrackTintColor = UIColor.red
        slider.maximumTrackTintColor = UIColor.blue
        let trans = CGAffineTransform(rotationAngle: .pi * 0.5)
        slider.transform = trans
        view.addSubview(slider)
        slider.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(5)
        }

    }
}

