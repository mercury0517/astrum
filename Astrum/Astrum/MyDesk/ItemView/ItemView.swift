//
//  ItemView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/04.
//

import SwiftUI
import RealmSwift

struct ItemView: View {
    @State private var items: [DeskItem]
    @State private var isNextPresented = false
    private var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 16, alignment: .center), count: 4)
    
    @State private var emptyItem: DeskItem = DeskItemFixture.emptyItem()

    init() {
        let realm = try! Realm()
        let cachedItemList = realm.objects(DeskItem.self)
        items = Array(cachedItemList.filter("isWishList == false")) // 所持しているアイテムのみを抽出
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Items")
                    .modifier(SectionTitle())
                
                Spacer()
                
                Button(action: {
                    isNextPresented.toggle()
                }) {
                    Image(systemName: "plus.circle")
                        .roundButton()
                }
                .sheet(isPresented: $isNextPresented) {
                    // アイテムを新規追加する為、ベースとなるアイテムは指定しない
                    ItemRegistrationView(items: $items, item: $emptyItem, isWishList: false)
                }
                .padding(.trailing, 16)
            }

            if items.isEmpty {
                HStack {
                    Text("アイテムがまだありません。\n持っているアイテムを追加してみよう！")
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(16)
            } else {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(items.indices, id: \.self) { index in
                        ItemCellView(item: items[index], items: $items, isWishList: false, itemColor: congigDefaultItemColor(index: index))
                    }
                }
                .padding(16)
            }
        }
        .padding(.bottom, 16)
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

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            
            ItemView()
        }
    }
}
