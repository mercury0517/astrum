//
//  DisplayFrameView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/03.
//

import SwiftUI

struct DisplayFrameView: View {
    let itemWidth = UIScreen.main.bounds.width - 32
    
    var body: some View {
        AngularGradient(
            gradient: Gradient(colors: [.gray, .grayLight, .gray]),
            center: .center,
            angle: .degrees(45)
        )
        .frame(width: itemWidth, height: 250)
        .foregroundColor(.black)
        .cornerRadius(8)
    }
}

struct DisplayFrameView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayFrameView()
    }
}
