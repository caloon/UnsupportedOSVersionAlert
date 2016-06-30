//
//  UnsupportedOSVersionAlert.swift
//  UnsupportedOSVersionAlert
//
//  Created by Josef Moser on 30/06/2016.
//  Copyright © 2016 Josef Moser. All rights reserved.
//

import UIKit

protocol OSVersionCheckerDelegate {
    func didCheckOSVersion(supportedOrAlreadyShown: Bool)
}

class OSVersionChecker: NSObject {
    
    var delegate: OSVersionCheckerDelegate?
    var earliestSupportedOS = "7.0"
    var latestSupportedOS = "9.0"
    
    func setSupportedOSVersions(earliest: String, latest: String) {
        self.earliestSupportedOS = earliest
        self.latestSupportedOS = latest
    }
    
    func checkOSVersion() {
        
        if self.systemVersionLessThan(self.earliestSupportedOS) || self.systemVersionGreaterThan(self.latestSupportedOS) {
            if !NSUserDefaults.standardUserDefaults().boolForKey("UnsupportedOSVersion " + UIDevice.currentDevice().systemVersion) {
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "UnsupportedOSVersion " + UIDevice.currentDevice().systemVersion)
                NSUserDefaults.standardUserDefaults().synchronize()
                self.delegate?.didCheckOSVersion(false)
            } else {
                self.delegate?.didCheckOSVersion(true)
            }
        } else {
            self.delegate?.didCheckOSVersion(true)
        }
        
    }
    
    func systemVersionLessThan(v: String) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(v, options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedAscending
    }
    
    func systemVersionGreaterThan(v: String) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(v, options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedDescending
    }
    
}

class OSVersionAlert: NSObject {
    
    class func showInViewController(viewController: UIViewController) {
        
        if #available(iOS 8.0, *) {
            
            let alertController = UIAlertController(title: NSLocalizedString("Unsupported iOS Version", comment: ""), message: String.localizedStringWithFormat(NSLocalizedString("You are using %@ with an unsupported iOS version. Please note that some functionalities might thus not work as expected.", comment: "")), preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Done", style: .Cancel) { (action) in
            }
            alertController.addAction(cancelAction)
            
            viewController.presentViewController(alertController, animated: true, completion: nil)
            
        } else {
            // Fallback on earlier iOS versions >> UIAlertView
            
            let alertView = UIAlertView(title: NSLocalizedString("Unsupported iOS Version", comment: ""), message: String.localizedStringWithFormat(NSLocalizedString("You are using %@ with an unsupported iOS version. Please note that a flawless functionality can only be granted when using supported iOS versions.", comment: "")), delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: "")
            alertView.alertViewStyle = .Default
            alertView.show()
            
        }
        
        
    }
    
}

