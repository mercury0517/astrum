//
//  SetupCellView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/01.
//

import SwiftUI

struct SetupCellView: View {
    private let itemSize = (UIScreen.main.bounds.width - 80) / 4
    private let itemColor: Color
    
    init(itemColor: Color) {
        self.itemColor = itemColor
    }
    
    var body: some View {
        NavigationLink {
            // 遷移先を設定する
        } label: {
            ZStack {
                Circle()
                    .fill(itemColor)
                    .frame(width: itemSize, height: itemSize)
                
                Image(systemName: "display")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: 30)
            }
        }
    }
}

struct SetupCellView_Previews: PreviewProvider {
    static var previews: some View {
        SetupCellView(itemColor: .orange)
    }
}
