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
                    ItemRegistrationView(items: $items)
                }
                .padding(.trailing, 16)
            }

            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(items, id: \.id) { item in
                    ItemCellView(item: item, items: $items)
                }
            }
            .padding(16)
        }
        .padding(.bottom, 16)
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
