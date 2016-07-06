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
        
//        let checker = OSVersionChecker()
//        checker.delegate = self
//        checker.setSupportedOSVersions("8.1", latest: "9.1.2")
//        checker.checkOSVersion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didCheckOSVersion(supported: Bool) {
        
        print("didCheckOSVersion")
        
        if !supported {
        //    self.presentViewController(OSVersionAlert.showInViewController(self), animated: true, completion: nil)
        }
    }
}

