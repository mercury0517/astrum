//
//  ItemLabel.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/09.
//

import SwiftUI

struct ItemLabel: View {
    var body: some View {
        Label(
            title: {
                Text("Apple Studio Display")
                    .font(Font.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(
                        width: UIScreen.main.bounds.width - 100,
                        height: 100
                    )
            },
            icon: {
                Image("sampleItem")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .background(Color.white)
            }
        )
        .background(Color.matteBlack)
        .frame(width: UIScreen.main.bounds.width, height: 100)
        .border(.gray, width: 1)
    }
}

struct ItemLabel_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.matteBlack, .black, .matteBlack]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            ItemLabel()
        }
    }
}
