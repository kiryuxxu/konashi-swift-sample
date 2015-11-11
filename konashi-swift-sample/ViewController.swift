//
//  ViewController.swift
//  konashi-swift-sample
//
//  Created by Wataru Kiryu on 11/11/15.
//  Copyright © 2015 kiryuxxu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let pin = KonashiDigitalIOPin.DigitalIO1

    override func viewDidLoad() {
        super.viewDidLoad()
        Konashi.shared().readyHandler = {
            Konashi.pinMode(self.pin, mode: KonashiPinMode.Output)
        }
        Konashi.find()
    }
    
    @IBAction func onChangeSwitch(sender: UISwitch) {
        if (!Konashi.isReady()) {
            return
        }
        Konashi.digitalWrite(self.pin, value: sender.on ? KonashiLevel.High : KonashiLevel.Low)
    }
}

