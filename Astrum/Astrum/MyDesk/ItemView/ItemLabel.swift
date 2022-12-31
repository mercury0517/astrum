//
//  ItemLabel.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/09.
//

import SwiftUI

struct ItemLabel: View {
    private let itemSize = (UIScreen.main.bounds.width - 80) / 4
    
    var body: some View {
        HStack(spacing: 0) {
            Image("sampleItem")
                .resizable()
                .scaledToFit()
                .frame(width: itemSize, height: itemSize)
                .background(Color.white)
                .cornerRadius(10)
                
            HStack(spacing: 0) {
                Text("Apple Studio Display")
                    .font(Font.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.leading, 16)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.gray)
            }
            .frame(
                width: UIScreen.main.bounds.width - itemSize - 32,
                height: 100
            )
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: 100)
        .border(width: 0.25, edges: [.bottom], color: Color.gray)
    }
}

struct ItemLabel_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            
            ItemLabel()
        }
    }
}
