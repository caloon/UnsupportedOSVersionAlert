# UnsupportedOSVersionAlert

[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)]()


This source code alerts your users if they use your app with an unsupported version of iOS (e.g. iOS 10.0 beta). The alert looks like this:

![alt text](https://github.com/caloon/UnsupportedOSVersionAlert/blob/master/UnsupportedOSVersionAlert/ios-screenshot.png "Screenshot")

The AlertController shows only *once* for each system version (e.g. only once for iOS 10.0 beta). If you would like to change this behavior, you can do this in the checkOSVersion method by removing the NSUserDefaults *if* queries.

## Requirements

- iOS 7.0+ (please test with iOS 7 if you still have Xcode 6 installed)
- Swift 2.0

## Installation

#### CocoaPods
coming soon...

#### Manually
1. Download and drop ```UnsupportedOSVersionAlert.swift``` in your project.  
2. [Work in Progress] Drop the language files into your project.
3. Done!

## Usage example
- Make your AppDelegate a delegate of OSVersionCheckerDelegate
``` 
class AppDelegate: UIApplicationDelegate, OSVersionCheckerDelegate 
```
- Implement the delegate method in your AppDelegate
``` 
func didCheckOSVersion(supported: Bool) {
    if !supported {
        self.window?.makeKeyAndVisible()
        OSVersionAlert.show() // default title and message
//        OSVersionAlert.show(title: "Custom Title", message: "Custom Message") // custom message
    }
}
```
- In your application didFinishLaunchingWithOptions, use the OSVersionChecker API to set the delegate, the earliest supported version and the latest supported version
``` 
OSVersionChecker.checkOSVersion(self, earliest: "8.1", latest: "9.1.3")
```

## Contribution
- If you'd like to contribute please submit a pull request via GitHub. 
- Speaking a language that is currently not supported by UnsupportedOSVersionAlert? Provide us your Localizations.

Like UnsupportedOSVersionAlert? Get us a beer ;-) 

[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=NVFEEVXQSSM9S)

## Meta

Josef Moser – [@josef_moser](https://twitter.com/josef_moser)

Distributed under the MIT license: Copyright (c) 2016 Josef Moser

[https://github.com/caloon](https://github.com/caloon/)

Feel free to use this source in any of your projects. If you'd like to acknowledge the author, feel free to link to www.caloon.co or this GitHub page.

