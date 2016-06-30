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
    
    var delegate: OSVersionCheckerDelegate?
    var earliestSupportedOS = "7.0"
    var latestSupportedOS = "10.0"
    
    func setSupportedOSVersions(earliest: String, latest: String) {
        self.earliestSupportedOS = earliest
        self.latestSupportedOS = latest
    }
    
    func checkOSVersion() {
        // tbd
        
        
        self.delegate?.didCheckOSVersion(false)
    }
    
}

class OSVersionAlert: NSObject {
    
    class func showInViewController(viewController: UIViewController) {
        
        if #available(iOS 8.0, *) {
            
            let alertController = UIAlertController(title: NSLocalizedString("Unsupported iOS Version", comment: ""), message: String.localizedStringWithFormat(NSLocalizedString("You are using %@ with an unsupported iOS version. Please note that a flawless functionality can only be granted when using supported iOS versions.", comment: "")), preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Done", style: .Cancel) { (action) in
            }
            alertController.addAction(cancelAction)
            
            viewController.presentViewController(alertController, animated: true, completion: nil)
            
        } else {
            
            // Fallback on earlier versions >> UIAlertView
            let alertView = UIAlertView(title: NSLocalizedString("Unsupported iOS Version", comment: ""), message: String.localizedStringWithFormat(NSLocalizedString("You are using %@ with an unsupported iOS version. Please note that a flawless functionality can only be granted when using supported iOS versions.", comment: "")), delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: "")
            alertView.alertViewStyle = .Default
            alertView.show()
            
        }
        
        
    }
    
}

