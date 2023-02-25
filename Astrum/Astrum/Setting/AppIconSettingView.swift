//
//  AppIconSettingView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/02/19.
//

import SwiftUI

struct AppIconSettingView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(AppIconType.allCases, id: \.self) { iconType in
                    Button(action: {
                        UIApplication.shared.setAlternateIconName(iconType.iconName) { _ in }
                    }) {
                        HStack {
                            Image(uiImage: UIImage(named: iconType.iconName ?? "AppIcon") ?? UIImage())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 57, height: 57)
                                .cornerRadius(9)
                                .padding(.trailing, 8)

                            Text(iconType.displayName)
                        }
                    }
                    .modifier(ListButtonStyle())
                }
            }
            .scrollContentBackground(.hidden)
            .background(.black)
            .navigationTitle("アプリのアイコン変更")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

enum AppIconType: CaseIterable {
    case dark
    case light
    case monotone
    case marine
    case burning
    case sun

    var displayName: String {
        switch self {
        case .dark:
            return "Dark"
        case .light:
            return "Light"
        case .monotone:
            return "Monotone"
        case .marine:
            return "Marine"
        case .burning:
            return "Burning"
        case .sun:
            return "Sun"
        }
    }
    
    var iconName: String? {
        switch self {
        case .dark:
            return nil
        case .light:
            return "AppIconWhite"
        case .monotone:
            return "AppIconMonotone"
        case .marine:
            return "AppIconDeepSea"
        case .burning:
            return "AppIconMorningGlow"
        case .sun:
            return "AppIconSun"
        }
    }
}

struct AppIconSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AppIconSettingView()
    }
}
