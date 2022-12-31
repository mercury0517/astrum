//
//  ItemCellVIew.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/31.
//

import SwiftUI

struct ItemCellView: View {
    private let itemSize = (UIScreen.main.bounds.width - 80) / 4
    
    var body: some View {
        NavigationLink {
            ItemDetailView()
        } label: {
            Image("sampleItem")
                .resizable()
                .scaledToFit()
                .frame(width: itemSize, height: itemSize)
                .background(Color.white)
                .cornerRadius(8)
        }
    }
}

struct ItemCellVIew_Previews: PreviewProvider {
    static var previews: some View {
        ItemCellView()
    }
}
