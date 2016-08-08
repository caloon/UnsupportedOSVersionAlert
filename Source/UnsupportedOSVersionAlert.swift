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
    
    class func show(title title: String = NSLocalizedString("Unsupported iOS Version", comment: ""), message: String = String.localizedStringWithFormat(NSLocalizedString("%@ is not compatible with the version of your operating system (iOS %@). This might lead to unexpected errors.", comment: ""), NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String, UIDevice.currentDevice().systemVersion)) {
        
        // if iOS 8 or later, show UIAlertController; else fallback to UIAlertView
        if #available(iOS 8.0, *) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            }
            alertController.addAction(cancelAction)
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
        } else {
            let alertView = UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: "")
            alertView.alertViewStyle = .Default
            alertView.show()
            
        }
    }
}


