//
//  ItemLabel.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/09.
//

import SwiftUI

struct SelectItemLabel: View {
    var body: some View {
        HStack(spacing: 0) {
            Text("Apple Studio Display")
                .font(Font.system(size: 16))
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.leading, 16)

            Spacer()

            ZStack {
                Rectangle()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)

                Image("sampleItem")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: 60)
            }
        }
    }
}

struct SelectItemLabel_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            
            SelectItemLabel()
        }
    }
}
