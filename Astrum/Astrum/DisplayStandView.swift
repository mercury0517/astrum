//
//  DisplayStandView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/03.
//

import SwiftUI

struct DisplayStandView: View {
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.gray, .grayLight]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(width: 120, height: 50)
    }
}

struct DisplayStandView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayStandView()
    }
}
