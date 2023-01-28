//
//  AdMobBannerView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/28.
//

import SwiftUI
import UIKit
import GoogleMobileAds

struct AdMobBannerView: UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let banner = GADBannerView(adSize: GADAdSizeBanner)
        banner.adUnitID = "ca-app-pub-3800500699089039/5759665933"
//        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716" // Test用のID

        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        banner.rootViewController = window?.rootViewController
        banner.load(GADRequest())
        return banner
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {
    }
}

struct AdMobBannerView_Previews: PreviewProvider {
    static var previews: some View {
        AdMobBannerView()
    }
}
