# AppDelegateService

[![CI Status](https://img.shields.io/travis/hummer98/AppDelegateService.svg?style=flat)](https://travis-ci.org/hummer98/AppDelegateService)
[![Version](https://img.shields.io/cocoapods/v/AppDelegateService.svg?style=flat)](https://cocoapods.org/pods/AppDelegateService)
[![License](https://img.shields.io/cocoapods/l/AppDelegateService.svg?style=flat)](https://cocoapods.org/pods/AppDelegateService)
[![Platform](https://img.shields.io/cocoapods/p/AppDelegateService.svg?style=flat)](https://cocoapods.org/pods/AppDelegateService)

## Environment

* iOS 10+
* Xcode 10+
* Swift 5.0+

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

```Swift

import UIKit 
import AppDelegateService

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private var services: [UIApplicationDelegate] = [AWSCognitoService(), ]

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        services.forEach {
            let _ = $0.application? (application, didFinishLaunchingWithOptions: launchOptions)
        }

        return true
    }
}
```

## Installation

AppDelegateService is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AppDelegateService'
```

## Author

hummer98, rr.yamamoto@gmail.com

## License

AppDelegateService is available under the MIT license. See the LICENSE file for more info.
