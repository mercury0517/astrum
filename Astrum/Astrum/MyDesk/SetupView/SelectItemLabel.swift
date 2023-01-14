//
//  ItemLabel.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/09.
//

import SwiftUI

struct SelectItemLabel: View {
    let itemName: String
    let itemImage: UIImage?
    
    var body: some View {
        HStack(spacing: 0) {
            Text(itemName)
                .font(Font.system(size: 16))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.leading, 16)

            Spacer()

            if let cellImage = itemImage {
                Image(uiImage: cellImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .background(.white)
                    .clipped()
            } else {
                ZStack {
                    Rectangle()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.blue)

                    Image(systemName: "shippingbox")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 30)
                }
            }
        }
    }
}

struct SelectItemLabel_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()

            SelectItemLabel(itemName: "Apple Studio Display", itemImage: UIImage(named: "sampleItem"))
        }
    }
}
