//
//  ContentView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/10/22.
//

import SwiftUI

struct ContentView: View {
    init() {
        let appearance = UITabBarAppearance()
        appearance.selectionIndicatorTintColor = .blue
        appearance.backgroundColor = UIColor(40, 40, 43) // matteBlack
        
        UITabBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
            MyDeskView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIImage {
    static func gradientImageWithBounds(bounds: CGRect, colors: [CGColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension UIColor {
    convenience init(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Int = 255) {
        let rgba = [red, green, blue, alpha].map { i -> CGFloat in
            switch i {
            case let i where i < 0:
                return 0
            case let i where i > 255:
                return 1
            default:
                return CGFloat(i) / 255
            }
        }
        self.init(red: rgba[0], green: rgba[1], blue: rgba[2], alpha: rgba[3])
    }
}
