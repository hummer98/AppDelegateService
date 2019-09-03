//
//  FirebaseService.swift
//  CloudService
//
//  Created by hummer98 on 2019/09/03.
//

import UIKit
import FirebaseCore

open class FirebaseService: NSObject, UIApplicationDelegate {}

extension FirebaseService {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
