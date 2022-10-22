//
//  GlassBackGround.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/10/22.
//

import SwiftUI

struct GlassBackGround: View {
    var body: some View {
        ZStack{
            RadialGradient(colors: [.clear, .white],
            center: .center,
            startRadius: 1,
            endRadius: 100)
            .opacity(0.6)
            Rectangle().foregroundColor(.white)
        }
        .opacity(0.1)
        .blur(radius: 1)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.lightShadowColor, lineWidth: 0.5)
        )
        .shadow(color: Color.darkShadowColor, radius: 16, x: 9, y: 9)
        .shadow(color: Color.lightShadowColor, radius: 16, x: -9, y: -9)
        .frame(width: UIScreen.main.bounds.width - 32, height: 300)
        .padding()
    }
}

struct GlassBackGround_Previews: PreviewProvider {
    static var previews: some View {
        GlassBackGround()
    }
}
