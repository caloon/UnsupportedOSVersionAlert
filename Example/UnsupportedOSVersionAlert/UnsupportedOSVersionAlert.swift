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

class OSVersionSupport {
    
    class func setSupportedVersions(first: String, last: String) {
        UserDefaults.standard.set(first, forKey: "OSVersionSupportFirst")
        UserDefaults.standard.set(last, forKey: "OSVersionSupportLast")
    }
    
    class func isSupported() -> Bool {
        return OSVersionSupport.systemVersionLessThan(v: UserDefaults.standard.object(forKey: "OSVersionSupportFirst") as! String) || OSVersionSupport.systemVersionLessThan(v: UserDefaults.standard.object(forKey: "OSVersionSupportLast") as! String)
    }
    
    private class func systemVersionLessThan(v: String) -> Bool {
        return UIDevice.current.systemVersion.compare(v, options: NSString.CompareOptions.numeric) == ComparisonResult.orderedAscending
    }
    
    private class func systemVersionGreaterThan(v: String) -> Bool {
        return UIDevice.current.systemVersion.compare(v, options: NSString.CompareOptions.numeric) == ComparisonResult.orderedDescending
    }
    
}

class OSVersionAlert {
    
    class func showOnce(title: String = NSLocalizedString("Unsupported iOS Version", comment: ""), message: String = String.localizedStringWithFormat(NSLocalizedString("You are using %@ with an unsupported iOS version. Please note that a flawless functionality can only be granted when using supported iOS versions.", comment: ""), Bundle.main.infoDictionary!["CFBundleName"] as! String)) {
        
        let key = "OSVersionAlert-" + UIDevice.current.systemVersion
        
        if !UserDefaults.standard.bool(forKey: key) {
            UserDefaults.standard.set(true, forKey: key)
            OSVersionAlert.show(title: title, message: message)
        }
    }
    
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


