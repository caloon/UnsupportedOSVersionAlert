//
//  ViewController.swift
//  UnsupportedOSVersionAlert
//
//  Created by caloon on 06/07/2018.
//  Copyright (c) 2018 caloon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // set supported versions
        OSVersionSupport.setSupportedVersions(first: "8.0", last: "11.1")
        
        // check if device version is supported by the app
        if !OSVersionSupport.isSupported() {
            // if not, show alert
            OSVersionAlert.showOnce()
            // showOnce() only presents the alert once, show() presents the alert every time viedDidAppear is called
        }
    }

}

