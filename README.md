# UnsupportedOSVersionAlert

[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)]()


This source code alerts your users if they use your app with an unsupported version of iOS (e.g. iOS 10.0 beta). The alert looks like this:

![Screenshot](https://github.com/caloon/UnsupportedOSVersionAlert/blob/master/Demo%20Project/ios-screenshot.png "Screenshot")

The AlertController shows only *once* for each system version (e.g. only once for iOS 10.0 beta). If you would like to change this behavior, you can do this in the checkOSVersion method by removing the NSUserDefaults *if* queries.

## Requirements

- iOS 7.0+ (please test with iOS 7 if you still have Xcode 6 installed)
- Swift 3.0 (last stable Swift 2 version: 74e577b)

## Installation

#### CocoaPods
coming soon...

#### Manually
1. Download and drop ```UnsupportedOSVersionAlert.swift``` in your project.  
2. Drop the language files into your project.
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

## Author

UnsupportedOSVersionAlert was created by Josef Moser. I am an independent software developer and co-founder of [Cora Health](https://www.cora.health/) and [Cryptoradar](https://cryptoradar.co).

Find me on: [Github](https://github.com/caloon/) or [Twitter](https://twitter.com/josef_moser)

## Contribution

We welcome contribution to this project by opening issues or pull request.

## License

UnsupportedOSVersionAlert is available under the MIT license. See the LICENSE file for more info.
If you'd like to acknowledge the author of UnsupportedOSVersionAlert, please set a link to this GitHub page.
