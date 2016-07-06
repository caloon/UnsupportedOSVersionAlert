//
//  UnsupportedOSVersionAlert.swift
//  UnsupportedOSVersionAlert
//
//  Created by Josef Moser on 30/06/2016.
//  Copyright © 2016 Josef Moser. All rights reserved.
//

import UIKit

protocol OSVersionCheckerDelegate {
    func didCheckOSVersion(supported: Bool)
}

class OSVersionChecker: NSObject {
    
    class func checkOSVersion(delegate: OSVersionCheckerDelegate, earliest: String, latest: String) {
        if OSVersionChecker.systemVersionLessThan(earliest) || OSVersionChecker.systemVersionGreaterThan(latest) {
            if !NSUserDefaults.standardUserDefaults().boolForKey("kUnsupportedOSVersion-" + UIDevice.currentDevice().systemVersion) {
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "kUnsupportedOSVersion-" + UIDevice.currentDevice().systemVersion)
                NSUserDefaults.standardUserDefaults().synchronize()
                    delegate.didCheckOSVersion(false)
            } else {
                delegate.didCheckOSVersion(true)
            }
        } else {
            delegate.didCheckOSVersion(true)
        }
    }
    
    class func systemVersionLessThan(v: String) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(v, options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedAscending
    }
    
    class func systemVersionGreaterThan(v: String) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(v, options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedDescending
    }
    
}

class OSVersionAlert: NSObject {
    
    class func show() -> UIAlertController {
        
            let alertController = UIAlertController(title: NSLocalizedString("Unsupported iOS Version", comment: ""), message: String.localizedStringWithFormat(NSLocalizedString("You are using %@ with an unsupported iOS version. Please note that some functionalities might thus not work as expected.", comment: ""), NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String), preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Done", style: .Cancel) { (action) in
            }
            alertController.addAction(cancelAction)
            
            return alertController

    }
}


