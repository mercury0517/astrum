//
//  DisplayStandView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/03.
//

import SwiftUI

struct DisplayStandView: View {
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.gray, .grayLight]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 80, height: 30)
            
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.grayLight, .gray]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: 160, height: 5)
        }
    }
}

struct DisplayStandView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayStandView()
    }
}
