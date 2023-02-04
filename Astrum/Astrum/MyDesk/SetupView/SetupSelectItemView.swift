//
//  SetupAddView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/10.
//

import RealmSwift
import SwiftUI

struct SetupSelectItemView: View {
    private let itemColor: Color
    @Binding private var setupItems: [DeskItem]

    private var items: [DeskItem]
    @State private var selectedValues: Set<DeskItem> = []
    
    @Environment(\.dismiss) private var dismiss

    init(itemColor: Color, setupItems: Binding<[DeskItem]>) {
        self.itemColor = itemColor
        self._setupItems = setupItems
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()

        navigationBarAppearance.backgroundColor = UIColor(40, 40, 43) // matteBlack
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance

        let realm = try! Realm()
        let cachedItemList = realm.objects(DeskItem.self)

        items = Array(cachedItemList.filter("isWishList == false")) // 所持しているアイテムのみを表示したい
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                List(selection: $selectedValues) {
                    ForEach(items, id: \.self) { item in
                        SelectItemLabel(itemName: item.title, itemImage: ImageManager.shared.getImage(name: item.id))
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.matteBlack)
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(.black)
                .environment(\.editMode, .constant(.active))
                
                Button(action: {
                    // セットアップごとにキーを設定する
                    let key = "setups_\(itemColor)"
                    let newItemIDList: [String] = selectedValues.map { $0.id } // キャッシュに保存するアイテムID用のリスト
                    let newItemList = Array(selectedValues) // 前の画面を更新する為のアイテムリスト

                    // 選択したnewItemIDListsムのIDを配列に保存する
                    UserDefaults.standard.set(newItemIDList, forKey: key)
                    
                    // 前の画面のセットアップの更新
                    setupItems = newItemList
                    
                    HapticFeedbackManager.shared.play(.impact(.soft))
                    dismiss()
                }) {
                    Text("セットアップの作成")
                        .frame(width: UIScreen.main.bounds.width - 32, height: 44)
                        .foregroundColor(Color.white)
                        .background(selectedValues.count == 0 ? .gray : .blue)
                }
                .cornerRadius(8)
                .disabled(selectedValues.count == 0)

                Spacer()
            }
            .background(Color.matteBlack)
            .navigationTitle("アイテムの選択")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SetupSelectItemView_Previews: PreviewProvider {
    @State private static var sampleItemList = [DeskItemFixture.sampleItem()]

    static var previews: some View {
        SetupSelectItemView(itemColor: .orange, setupItems: $sampleItemList)
    }
}
