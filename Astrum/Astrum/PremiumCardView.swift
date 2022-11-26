//
//  PremiumCardView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/11/26.
//

import SwiftUI

struct PremiumCardView: View {
    let itemWidth = UIScreen.main.bounds.width - 32
    
    var body: some View {
        AngularGradient(
            gradient: Gradient(colors: [.yellowDark, .yellowLight, .yellowDark]),
            center: .center,
            angle: .degrees(45)
        )
        .border(width: 0.5, edges: [.top, .leading], color: .white)
        .border(width: 0.5, edges: [.trailing, .bottom], color: .black)
        .frame(width: itemWidth, height: 250)
        .foregroundColor(.black)
    }
}

struct PremiumCardView_Previews: PreviewProvider {
    static var previews: some View {
        PremiumCardView()
    }
}