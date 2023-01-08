//
//  ItemCellVIew.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/31.
//

import SwiftUI

struct ItemCellView: View {
    private let item: DeskItem
    private let itemImage: UIImage?
    private let itemSize = (UIScreen.main.bounds.width - 80) / 4

    @Binding private var items: [DeskItem] // アイテムに変更を加えた場合に、ホーム画面のアイテム一覧も更新したい

    init(item: DeskItem, items: Binding<[DeskItem]>) {
        self.item = item
        self.itemImage = ImageManager.shared.getImage(name: self.item.id)

        self._items = items
    }

    var body: some View {
        NavigationLink {
            ItemDetailView(
                item: item, itemImage: itemImage, items: $items
            )
        } label: {
            if let cellImage = itemImage {
                Image(uiImage: cellImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: itemSize, height: itemSize)
                    .background(Color.white)
                    .cornerRadius(8)
            } else {
                Rectangle()
                    .frame(width: itemSize, height: itemSize)
                    .background(Color.orange)
                    .cornerRadius(8)
            }
        }
    }
}

struct ItemCellVIew_Previews: PreviewProvider {
    @State private static var sampleItemList = [DeskItemFixture.sampleItem()]
    
    static var previews: some View {
        ItemCellView(item: DeskItemFixture.sampleItem(), items: $sampleItemList)
    }
}
