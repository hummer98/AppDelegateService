//
//  AppDelegate.swift
//  AppDelegateService
//
//  Created by hummer98 on 09/03/2019.
//  Copyright (c) 2019 hummer98. All rights reserved.
//

import UIKit
import AppDelegateService
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy private var services: [UIApplicationDelegate] = [
        AWSCognitoService(identityPoolId: "YOUR Cognito IdentityPoolId"),
        PushNotificationService(authOptions: [.alert, .badge, .sound], notifyHandler: self.pushNotify)
    ]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        services.forEach {
            let _ = $0.application?(application, didFinishLaunchingWithOptions: launchOptions)
        }
        
        return true
    }
    
    func pushNotify(trigger: UNNotificationTrigger) -> UNNotificationPresentationOptions {
        switch trigger {
        case is UNPushNotificationTrigger:
            print("UNPushNotificationTrigger")
        case is UNTimeIntervalNotificationTrigger:
            print("UNTimeIntervalNotificationTrigger")
        case is UNLocationNotificationTrigger:
            print("UNLocationNotificationTrigger")
        case is UNCalendarNotificationTrigger:
            print("UNLocationNotificationTrigger")
        default:
            print("Unknown Notification")
        }
        return [.badge, .alert, .sound]
    }
}

