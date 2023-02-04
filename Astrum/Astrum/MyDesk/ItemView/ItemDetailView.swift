//
//  ItemDetailView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/04.
//

import SwiftUI
import RealmSwift

struct ItemDetailView: View {
    @State private var item: DeskItem
    @State private var itemImage: UIImage?
    @Binding private var items: [DeskItem]
    private let isWishList: Bool
    private let defaultImageColor: Color

    @State private var isPresentEditView = false
    @State private var showingMoveToItemsAlert = false
    @State private var showingAlert = false
    @Environment(\.dismiss) var dismiss

    init(
        item: State<DeskItem>,
        itemImage: State<UIImage?>,
        items: Binding<[DeskItem]>,
        isWishList: Bool,
        defaultImageColor: Color
    ) {
        self._item = item
        self._itemImage = itemImage
        self._items = items
        self.isWishList = isWishList
        self.defaultImageColor = defaultImageColor
    }

    var body: some View {
        if !item.isInvalidated {
            ZStack {
                BackgroundView()
                
                ScrollView() {
                    VStack(alignment: .leading, spacing: 8) {
                        // 画像の有無で表示を切り替え
                        if let itemImage {
                            Image(uiImage: itemImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: 300)
                                .clipped()
                        } else {
                            ZStack {
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width, height: 300)
                                    .foregroundColor(defaultImageColor)
                                
                                Image(systemName: "shippingbox")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .frame(width: 30)
                            }
                        }

                        Text(item.title)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.leading, 16)
                            .padding(.trailing, 16)
                            .padding(.top, 8)
                        
                        if let memo = item.memo {
                            Text(memo)
                                .foregroundColor(.white)
                                .padding(.leading, 16)
                                .padding(.trailing, 16)
                        }
                        
                        if
                            let urlString = item.url?.trimmingCharacters(in: .whitespaces),
                            let url = URL(string: urlString)
                        {   
                            Link(destination: url, label: {
                                Text(url.absoluteString)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.blue)
                            })
                            .padding(.leading, 16)
                            .padding(.trailing, 16)
                        }

                        Spacer()
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Menu {
                                Button(
                                    "アイテムを編集",
                                    role: .none,
                                    action: { isPresentEditView = true }
                                )

                                if isWishList {
                                    Button(
                                        "アイテムを入手済みにする",
                                        role: .none,
                                        action: {
                                            showingMoveToItemsAlert = true
                                        }
                                    )
                                }

                                Button(
                                    "アイテムを削除",
                                    role: .destructive,
                                    action: { showingAlert = true }
                                )
                            } label: {
                                Image(systemName: "ellipsis.circle")
                                    .roundButton()
                            }
                        }
                    }
                    .sheet(isPresented: $isPresentEditView) {
                        ItemRegistrationView(
                            items: $items,
                            item: $item,
                            itemImage: $itemImage,
                            isWishList: isWishList
                        )
                    }
                    .alert("このアイテムをItemsに移動しますか？", isPresented: $showingMoveToItemsAlert) {
                        Button("キャンセル", role: .cancel, action: {})

                        Button("移動", role: .none) {
                            changeItemCategory()
                            HapticFeedbackManager.shared.play(.impact(.soft))

                            // ホーム画面に戻る
                            dismiss()
                        }
                    }
                    .alert("このアイテムを削除しますか？", isPresented: $showingAlert) {
                        Button("キャンセル", role: .cancel, action: {})

                        Button("削除", role: .destructive) {
                            deleteItem()
                            
                            HapticFeedbackManager.shared.play(.impact(.soft))

                            // ホーム画面に戻る
                            dismiss()
                        }
                    }
                }
            }
        }
    }
    
    private func deleteItem() {
        // ファイルに保存されている画像を削除する
        ImageManager.shared.deleteImage(name: item.id)

        // Realmに保存されているオブジェクトを削除
        let realm = try! Realm()

        try! realm.write {
          realm.delete(item)
        }

        // itemsも更新してホーム画面のアイテムが更新される様にする
        let cachedItemList = realm.objects(DeskItem.self) // 削除後の最新のアイテムリスト
        items = Array(cachedItemList.filter("isWishList == \(isWishList)"))
    }
    
    private func changeItemCategory() {
        let realm = try! Realm()
        
        if let targetItem = realm.objects(DeskItem.self).filter("id == '\(item.id)'").first {
            try! realm.write {
                targetItem.isWishList = false
            }
        }

        // Wish Listを更新してホーム画面のアイテムが更新される様にする
        let cachedItemList = realm.objects(DeskItem.self)
        items = Array(cachedItemList.filter("isWishList == true"))

        // 通知を送信して、Itemsの更新をかける
        NotificationCenter.default.post(name: NSNotification.updateItem, object: self, userInfo: nil)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    @State private static var sampleItem = DeskItemFixture.sampleItem()
    @State private static var sampleImage = UIImage(named: "sampleItem")
    @State private static var sampleItemList = [DeskItemFixture.sampleItem()]

    static var previews: some View {
        ItemDetailView(
            item: _sampleItem,
            itemImage: _sampleImage,
            items: $sampleItemList,
            isWishList: false,
            defaultImageColor: .blue
        )
    }
}
