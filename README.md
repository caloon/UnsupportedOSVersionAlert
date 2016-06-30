# UnsupportedOSVersionAlert

This source codes alerts your users if they use your app with an unsupported version of iOS (e.g. iOS 10.0 beta). The alert looks like this:
// tbd - screenshot

The AlertController shows only ONCE for each system version (e.g. only once for iOS 10.0 beta). If you would like to remind the user each time he launches the app with an unsupported version, set the onlyShowOnce property in UnsupportedOSVersionAlert.swift to *false*.

## Implementation
- Drag the UnsupportedOSVersionAlert.swift file into your project
- Make your initial VC a delegate of OSVersionCheckerDelegate
``` 
class ViewController: UIViewController, OSVersionCheckerDelegate 
```

- Implement the delegate method in your VC
``` 
func didCheckOSVersion(supported: Bool) {
     if !supported {
        OSVersionAlert.showInViewController(self)
    } 
  }
```

- In your viewDidLoad, create an instance of OSVersionChecker, set your view controller as the delegate, set supported OS versions (lower and upper) and check the OS version
``` 
let checker = OSVersionChecker()
checker.delegate = self
checker.setSupportedOSVersions("8.1", latest: "9.3.2")
checker.checkOSVersion()
```

## Contribution
- If you'd like to contribute please submit a pull request via GitHub. 
- Speaking a language that is currently not supported by UnsupportedOSVersionAlert? Provide us your Localizations.

Like UnsupportedOSVersionAlert? Get us a beer ;-) 

[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=NVFEEVXQSSM9S)

## License
Feel free to use this source in any of your projects. If you'd like to acknowledge the author, feel free to link to www.caloon.co.

