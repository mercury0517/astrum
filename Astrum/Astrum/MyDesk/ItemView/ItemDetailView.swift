//
//  ItemDetailView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/04.
//

import SwiftUI

struct ItemDetailView: View {
    private let item: DeskItem
    private let itemImage: UIImage?
    
    init(item: DeskItem, itemImage: UIImage?) {
        self.item = item
        self.itemImage = itemImage
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            ScrollView() {
                VStack(spacing: 16) {
                    // 画像の有無で表示を切り替え
                    if let itemImage {
                        Image(uiImage: itemImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: 250)
                    } else {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width, height: 250)
                            .background(.gray)
                    }

                    HStack {
                        Text(item.title)
                            .font(.title)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    
                    if let memo = item.memo {
                        HStack {
                            Text(memo)
                                .foregroundColor(.white)
                                .padding(.leading, 16)
                                .padding(.trailing, 16)
                            Spacer()
                        }
                    }
                    
                    if
                        let urlString = item.url?.trimmingCharacters(in: .whitespaces),
                        let url = URL(string: urlString)
                    {
                        HStack {
                            Link(url.absoluteString, destination: url)
                                .foregroundColor(.blue)
                                .padding(.leading, 16)
                                .padding(.trailing, 16)
                            
                            Spacer()
                        }
                    }

                    Spacer()
                }
            }
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: DeskItemFixture.sampleItem(), itemImage: UIImage(named: "sampleItem"))
    }
}
