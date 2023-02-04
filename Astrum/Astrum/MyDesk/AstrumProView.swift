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
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Spacer()

                    ZStack {
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

                    Spacer()
                }
                .padding(.top, 16)

                Text("Astrum ProはAstrumの有料機能です。より便利にAstrumを利用できる様になります。近日公開予定。")
                    .foregroundColor(.white)
                    .padding(16)

                Spacer()
            }
            .navigationTitle("Astrum Pro")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AstrumProView_Previews: PreviewProvider {
    static var previews: some View {
        AstrumProView()
    }
}
