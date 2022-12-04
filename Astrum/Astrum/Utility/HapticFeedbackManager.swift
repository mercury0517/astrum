//
//  HapticFeedbackManager.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/04.
//

import Foundation
import UIKit

enum ImpactFeedbackStyle: Int {
    case light
    case medium
    case heavy
    case soft
    case rigid

    var value: UIImpactFeedbackGenerator.FeedbackStyle {
        return .init(rawValue: rawValue)!
    }
}

enum NotificationFeedbackType: Int {
    case success
    case failure
    case error

    var value: UINotificationFeedbackGenerator.FeedbackType {
        return .init(rawValue: rawValue)!
    }
}

enum Haptic {
    case impact(_ style: ImpactFeedbackStyle, intensity: CGFloat? = nil)
    case notification(_ type: NotificationFeedbackType)
}

final class HapticFeedbackManager {
    static let shared = HapticFeedbackManager()
    private init() {}
    private var impactFeedbackGenerator: UIImpactFeedbackGenerator?
    private var notificationFeedbackGenerator: UINotificationFeedbackGenerator?

    func play(_ haptic: Haptic) {
        switch haptic {
        case .impact(let style, let intensity):
            impactFeedbackGenerator = UIImpactFeedbackGenerator(style: style.value)
            impactFeedbackGenerator?.prepare()
            
            if let intensity = intensity {
                impactFeedbackGenerator?.impactOccurred(intensity: intensity)
            } else {
                impactFeedbackGenerator?.impactOccurred()
            }
            impactFeedbackGenerator = nil
            
        case .notification(let type):
            notificationFeedbackGenerator = UINotificationFeedbackGenerator()
            notificationFeedbackGenerator?.prepare()
            notificationFeedbackGenerator?.notificationOccurred(type.value)
            notificationFeedbackGenerator = nil
        }
    }
}
