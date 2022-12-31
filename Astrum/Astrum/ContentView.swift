//
//  ContentView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/10/22.
//

import SwiftUI

struct ContentView: View {
    init() {
        let image = UIImage.gradientImageWithBounds(
            bounds: CGRect(
                x: 0, y: 0, width: UIScreen.main.scale, height: 5
            ),
            colors: [
                UIColor(227, 215, 163).withAlphaComponent(0.1).cgColor,
                UIColor(227, 215, 163).cgColor
            ]
        )
        
        let appearance = UITabBarAppearance()
        appearance.shadowImage = image
        appearance.selectionIndicatorTintColor = .white
        appearance.backgroundColor = .black
        
        UITabBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        TabView {
            MyDeskView()
                .tabItem {
                    VStack {
                        Image(systemName: "lamp.desk")
                        Text("マイデスク")
                    }
                }.tag(1)
            
            FavoritesView()
                .tabItem {
                    VStack {
                        Image(systemName: "star")
                        Text("お気に入り")
                    }
                }.tag(2)
        }
        .accentColor(.white)
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
