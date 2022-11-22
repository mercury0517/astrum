//
//  AstrumApp.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/10/22.
//

import SwiftUI

@main
struct AstrumApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack{
                LinearGradient(
                    gradient: Gradient(colors: [.middleGreen, .darkGreen]), startPoint: .leading, endPoint: .trailing
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    GlassCardView()
                        .padding(.top, 10)
                    Spacer()
                }
            }
        }
    }
}
