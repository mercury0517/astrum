//
//  GlassBackGround.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/10/22.
//

import SwiftUI

struct GlassBackGround: View {
    let itemSize = UIScreen.main.bounds.width - 64
    
    var body: some View {
        Rectangle()
            .foregroundColor(.white)
            .opacity(0.25)
            .blur(radius: 20)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.lightShadowColor, lineWidth: 0.25)
            )
            .frame(width: itemSize, height: itemSize)
            .padding()
    }
}

struct GlassBackGround_Previews: PreviewProvider {
    static var previews: some View {
        GlassBackGround()
    }
}
