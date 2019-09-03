//
//  PushNotificationService.swift
//  CloudService
//
//  Created by hummer98 on 2019/09/03.
//

import UIKit
import UserNotifications

public class PushNotificationService: NSObject, UIApplicationDelegate {
    private var delegate: UNUserNotificationCenterDelegate?
    private var authOptions: UNAuthorizationOptions
    public typealias NotifyHandler = (UNNotificationTrigger) -> UNNotificationPresentationOptions
    private var notifyHandler: NotifyHandler
    
    public init(delegate: UNUserNotificationCenterDelegate? = nil,
         authOptions: UNAuthorizationOptions = [.alert, .badge, .sound],
         notifyHandler: @escaping NotifyHandler = { _ in return [] }
        ) {
        self.delegate = delegate
        self.authOptions = authOptions
        self.notifyHandler = notifyHandler
    }
}

extension PushNotificationService {
    // TIPS: extensionに記述しないとWarningが出る
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // ユーザからPush Notification通知の許可をもらう
        UNUserNotificationCenter.current().delegate = delegate ?? self
        
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { granted, error in
                if let error = error {
                    debugPrint(error)
                    return
                }
                if granted {
                    // デバイストークンの要求
                    UIApplication.shared.registerForRemoteNotifications()
                }
        })
        
        return true
    }
}

extension PushNotificationService: UNUserNotificationCenterDelegate {
    @objc
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        guard let type = notification.request.trigger else {
            completionHandler([])
            return
        }
        let notificationPresentationOption = notifyHandler(type)
        completionHandler(notificationPresentationOption)
    }
}
