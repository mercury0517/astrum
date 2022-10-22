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
        .opacity(0.15)
        .blur(radius: 2)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
        .stroke(.white, lineWidth: 0.5)
        )
        .frame(width: UIScreen.main.bounds.width - 32, height: 300)
        .padding()
    }
}

struct GlassBackGround_Previews: PreviewProvider {
    static var previews: some View {
        GlassBackGround()
    }
}
