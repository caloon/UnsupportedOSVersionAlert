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
        if OSVersionChecker.systemVersionLessThan(v: earliest) || OSVersionChecker.systemVersionGreaterThan(v: latest) {
            if !UserDefaults.standard.bool(forKey: "kUnsupportedOSVersion-" + UIDevice.current.systemVersion) {
                UserDefaults.standard.set(true, forKey: "kUnsupportedOSVersion-" + UIDevice.current.systemVersion)
                UserDefaults.standard.synchronize()
                delegate.didCheckOSVersion(supported: false)
            } else {
                delegate.didCheckOSVersion(supported: true)
            }
        } else {
            delegate.didCheckOSVersion(supported: true)
        }
    }
    
    class func systemVersionLessThan(v: String) -> Bool {
        return UIDevice.current.systemVersion.compare(v, options: NSString.CompareOptions.numeric) == ComparisonResult.orderedAscending
    }
    
    class func systemVersionGreaterThan(v: String) -> Bool {
        return UIDevice.current.systemVersion.compare(v, options: NSString.CompareOptions.numeric) == ComparisonResult.orderedDescending
    }
    
}

class OSVersionAlert: NSObject {
    
    class func show(title: String = NSLocalizedString("Unsupported iOS Version", comment: ""), message: String = String.localizedStringWithFormat(NSLocalizedString("You are using %@ with an unsupported iOS version. Please note that a flawless functionality can only be granted when using supported iOS versions.", comment: ""), Bundle.main.infoDictionary!["CFBundleName"] as! String)) {
        
        // if iOS 8 or later, show UIAlertController; else fallback to UIAlertView
        if #available(iOS 8.0, *) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
            }
            alertController.addAction(cancelAction)
            UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
        } else {
            let alertView = UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: "")
            alertView.alertViewStyle = .default
            alertView.show()
            
        }
    }
}


