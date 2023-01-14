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
            Image("sampleItem")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .background(Color.white)
                
            Text("Apple Studio Display")
                .font(Font.system(size: 16))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.leading, 16)
            
            Spacer()
        }
        .background(Color.matteBlack)
        .border(width: 0.25, edges: [.bottom], color: Color.gray)
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
