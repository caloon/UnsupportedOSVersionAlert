//
//  ViewController.swift
//  UnsupportedOSVersionAlert
//
//  Created by Josef Moser on 30/06/2016.
//  Copyright © 2016 Josef Moser. All rights reserved.
//

import UIKit

class ViewController: UIViewController, OSVersionCheckerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        OSVersionChecker.setSupportedOSVersions(earliest: "8.1", latest: "9.3.2")
        OSVersionChecker.checkOSVersion
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didCheckOSVersion(supported: Bool) {
        if !supported {
            OSVersionAlert.show()
        }
    }
}

