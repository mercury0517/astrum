//
//  SetupAddView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/10.
//

import RealmSwift
import SwiftUI

struct SetupSelectItemView: View {
    @State private var items: [DeskItem]
    @State private var selectedValue: Set<DeskItem> = []
    
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
            List(selection: $selectedValue) {
                ForEach(items, id: \.self) { item in
                    SelectItemLabel()
                        .listRowInsets(EdgeInsets())
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(.black)
            .environment(\.editMode, .constant(.active))
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
