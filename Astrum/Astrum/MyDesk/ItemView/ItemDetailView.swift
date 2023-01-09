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
    private let itemImage: UIImage?
    @Binding private var items: [DeskItem]
    private let isWishList: Bool

    @State private var showingAlert = false
    @State private var isPresentEditView = false
    @Environment(\.dismiss) var dismiss

    init(item: State<DeskItem>, itemImage: UIImage?, items: Binding<[DeskItem]>, isWishList: Bool) {
        self._item = item
        self.itemImage = itemImage
        self._items = items
        self.isWishList = isWishList
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
                                .frame(width: UIScreen.main.bounds.width, height: 250)
                                .clipped()
                        } else {
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width, height: 250)
                                .background(.gray)
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
                            Link(url.absoluteString, destination: url)
                                .foregroundColor(.blue)
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
                        ItemRegistrationView(items: $items, item: $item, isWishList: isWishList)
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
}

struct ItemDetailView_Previews: PreviewProvider {
    @State private static var sampleItem = DeskItemFixture.sampleItem()
    @State private static var sampleItemList = [DeskItemFixture.sampleItem()]

    static var previews: some View {
        ItemDetailView(
            item: _sampleItem,
            itemImage: UIImage(named: "sampleItem"),
            items: $sampleItemList,
            isWishList: false
        )
    }
}
