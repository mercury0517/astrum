//
//  WishListView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/01.
//

import SwiftUI
import RealmSwift

struct WishListView: View {
    @State private var items: [DeskItem]
    @State private var isNextPresented = false
    private var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 16, alignment: .center), count: 4)

    @State private var emptyItem: DeskItem = DeskItemFixture.emptyItem()
    @State private var emptyImage: UIImage? = nil

    init() {
        let realm = try! Realm()
        let cachedItemList = realm.objects(DeskItem.self)
        items = Array(cachedItemList.filter("isWishList == true")) // ほしい物リストのアイテムのみを抽出
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Wish List")
                    .modifier(SectionTitle())
                
                Spacer()
                
                Button(action: {
                    isNextPresented.toggle()
                }) {
                    Image(systemName: "plus.circle")
                        .roundButton()
                }
                .sheet(isPresented: $isNextPresented) {
                    ItemRegistrationView(
                        items: $items,
                        item: $emptyItem,
                        itemImage: $emptyImage,
                        isWishList: true
                    )
                }
                .padding(.trailing, 16)
            }
            
            if items.isEmpty {
                HStack {
                    Text("アイテムがまだありません。\n欲しいアイテムを追加してみよう！")
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(16)
            } else {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(Array(items.enumerated()), id: \.element) { index, element in
                        ItemCellView(
                            item: element,
                            items: $items,
                            isWishList: true,
                            itemColor: congigDefaultItemColor(index: index)
                        )
                    }
                }
                .padding(16)
            }
        }
        .padding(.bottom, 66) // AdMob分の余白を開ける
    }
    
    // アイテムがある位置によってデフォルトカラーを4色から選ぶ
    private func congigDefaultItemColor(index: Int) -> Color {
        // 4で割った余りで色を決める
        let itemColorType = index % 4
        
        // indexTypeが3以上になることは想定していないが、grayを返しておく
        if itemColorType > 3 { return .gray }

        let colors: [Color] = [.orange, .red, .purple, .blue]

        return colors[itemColorType]
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView()
    }
}
