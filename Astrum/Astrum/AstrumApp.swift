//
//  AstrumApp.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/10/22.
//

import AppTrackingTransparency
import GoogleMobileAds
import SwiftUI

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                GADMobileAds.sharedInstance().start(completionHandler: nil)
            })
        } else {
            // Fallback on earlier versions
            GADMobileAds.sharedInstance().start(completionHandler: nil)
        }
        return true
    }
}

@main
struct AstrumApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            LaunchScreen()
        }
    }
}
