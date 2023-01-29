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
        return true
    }
}

@main
struct AstrumApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            LaunchScreen()
                .onAppear {
                    requestAppTrackingTransparencyAuthorization()
                }
        }
    }

    private func requestAppTrackingTransparencyAuthorization() {
        if #available(iOS 14.5, *) {
            guard ATTrackingManager.trackingAuthorizationStatus == .notDetermined else { return }
            
            print("1111111")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                    print("2222")
                    if status == .authorized {
                        print("3333")
                        GADMobileAds.sharedInstance().start(completionHandler: nil)
                    }
                })
            }
        }
    }
}
