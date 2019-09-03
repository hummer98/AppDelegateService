//
//  AWSCognitoService.swift
//  AppDelegateService
//
//  Created by hummer98 on 2019/09/03.
//

import UIKit
import AWSCognito

open class AWSCognitoService: NSObject, UIApplicationDelegate {
    private var identityPoolId: String
    public init(identityPoolId: String) {
        self.identityPoolId = identityPoolId
    }
}

extension AWSCognitoService {
    // TIPS: extensionに記述しないとWarningが出る
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // Amazon Cognito 認証情報プロバイダーを初期化します
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType: .APNortheast1,
                                                                identityPoolId: identityPoolId)
        let configuration = AWSServiceConfiguration(region: .APNortheast1, credentialsProvider: credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        return true
    }
}
