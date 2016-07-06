# UnsupportedOSVersionAlert

This source codes alerts your users if they use your app with an unsupported version of iOS (e.g. iOS 10.0 beta). The alert looks like this:
![alt text](https://github.com/caloon/UnsupportedOSVersionAlert/blob/master/UnsupportedOSVersionAlert/screenshot.png "Screenshot")


Works with iOS 8.0 upwards (> 95% of iOS devices covered). 

The AlertController shows only ONCE for each system version (e.g. only once for iOS 10.0 beta). If you would like to change this behavior, you can do this in the checkOSVersion method by removing the NSUserDefaults *if* queries.

## Implementation
- Drag the UnsupportedOSVersionAlert.swift file into your project
- Make your AppDelegate a delegate of OSVersionCheckerDelegate
``` 
class AppDelegate: UIApplicationDelegate, OSVersionCheckerDelegate 
```

- Implement the delegate method in your AppDelegate
``` 
func didCheckOSVersion(supported: Bool) {
    if !supported {
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController?.presentViewController(OSVersionAlert.show(), animated: true, completion: nil)
    }
}
```

- In your application didFinishLaunchingWithOptions, use the OSVersionChecker API to set the delegate, the earliest supported version and the latest supported version
``` 
OSVersionChecker.checkOSVersion(self, earliest: "8.1", latest: "9.1.3")
```
- [Work in Progress] Drag the language files into your project.

## Contribution
- If you'd like to contribute please submit a pull request via GitHub. 
- Speaking a language that is currently not supported by UnsupportedOSVersionAlert? Provide us your Localizations.

Like UnsupportedOSVersionAlert? Get us a beer ;-) 

[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=NVFEEVXQSSM9S)

## License
Feel free to use this source in any of your projects. If you'd like to acknowledge the author, feel free to link to www.caloon.co.

