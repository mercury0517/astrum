//
//  AstrumProView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/02/04.
//

import SwiftUI

struct AstrumProView: View {
    private let itemSize = (UIScreen.main.bounds.width - 80) / 4

    init() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        
        navigationBarAppearance.backgroundColor = UIColor(40, 40, 43) // matteBlack
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }

    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()

                VStack(alignment: .leading, spacing: 24) {
                    AstrumProIconView()

                    Text("Astrum ProはAstrumの有料機能です。より便利にAstrumを利用できる様になります。")
                        .foregroundColor(.white)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)

                    AstrumProIconBenefitView()

                    Spacer()
                }
                .navigationTitle("Astrum Pro")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct AstrumProIconView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.orange, .red, .purple, .blue]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 100, height: 100)

            Image(systemName: "display")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 40)
        }
        .frame(width: UIScreen.main.bounds.width)
        .padding(.top, 24)
    }
}

struct AstrumProIconBenefitView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("特典その1")
                .modifier(SectionTitle())

            Text("アイコンを切り替えられる様になります。")
                .foregroundColor(.white)
                .padding(.leading, 16)
                .padding(.trailing, 16)

            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.orange, .red, .purple, .blue]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .frame(width: UIScreen.main.bounds.width, height: 89)
                
                VStack(alignment: .center, spacing: 0) {
                    HStack {
                        // デフォルト以外のアイコンを表示したい
                        AppIconView(iconName: "AppIconWhite")
                        AppIconView(iconName: "AppIconMonotone")
                        AppIconView(iconName: "AppIconDeepSea")
                        AppIconView(iconName: "AppIconMorningGlow")
                        AppIconView(iconName: "AppIconSun")
                    }
                    .padding(.top, 16)
                    .padding(.bottom, 16)
                }
                .frame(width: UIScreen.main.bounds.width)
            }
        }
    }
}

struct AppIconView: View {
    private let iconName: String

    init(iconName: String) {
        self.iconName = iconName
    }

    var body: some View {
        Image(uiImage: UIImage(named: iconName) ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 57, height: 57)
            .cornerRadius(9)
    }
}
