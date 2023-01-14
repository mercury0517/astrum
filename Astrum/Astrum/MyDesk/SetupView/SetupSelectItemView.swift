//
//  SetupAddView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/10.
//

import RealmSwift
import SwiftUI

struct SetupSelectItemView: View {
    private var items: [DeskItem]
    @State private var selectedValue: Set<DeskItem> = []

    @Environment(\.dismiss) private var dismiss

    init() {
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
                List(selection: $selectedValue) {
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
                    dismiss()
                }) {
                    Text("セットアップの作成")
                        .frame(width: UIScreen.main.bounds.width - 32, height: 44)
                        .foregroundColor(Color.white)
                        .background(selectedValue.count == 0 ? .gray : .blue)
                }
                .cornerRadius(8)
                .disabled(selectedValue.count == 0)
                
                Spacer()
            }
            .navigationTitle("アイテムの選択")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SetupSelectItemView_Previews: PreviewProvider {
    static var previews: some View {
        SetupSelectItemView()
    }
}
