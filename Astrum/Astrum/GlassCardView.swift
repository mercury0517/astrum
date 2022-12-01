//
//  GlassCardView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/10/22.
//

import SwiftUI

struct GlassCardView: View {
    let itemSize = UIScreen.main.bounds.width - 32
    
    var body: some View {
        Rectangle()
            .foregroundColor(.white)
            .opacity(0.2)
            .blur(radius: 10)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.lightShadowColor, lineWidth: 0.5)
            )
            .frame(width: itemSize, height: 300)
    }
}

struct GlassBackGround_Previews: PreviewProvider {
    static var previews: some View {
        GlassCardView()
    }
}
