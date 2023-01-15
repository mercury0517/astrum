//
//  SetUpItemLabel.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/15.
//

import SwiftUI

struct SetUpItemLabel: View {
    let itemName: String
    let itemImage: UIImage?

    private let itemSize = (UIScreen.main.bounds.width - 80) / 4
    
    var body: some View {
        HStack(spacing: 0) {
            if let cellImage = itemImage {
                Image(uiImage: cellImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: itemSize, height: itemSize)
                    .background(.white)
                    .clipped()
                    .cornerRadius(8)
            } else {
                ZStack {
                    Rectangle()
                        .frame(width: itemSize, height: itemSize)
                        .foregroundColor(.blue)
                        .cornerRadius(8)
                    
                    Image(systemName: "shippingbox")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 30)
                }
            }

            Text(itemName)
                .font(Font.system(size: 16))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.leading, 16)

            Spacer()
        }
    }
}

struct SetUpItemLabel_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()

            SetUpItemLabel(itemName: "Apple Studio Display", itemImage: UIImage(named: "sampleItem"))
        }
    }
}
