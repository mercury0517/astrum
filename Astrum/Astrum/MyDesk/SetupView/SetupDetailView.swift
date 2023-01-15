//
//  SetupDetailView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/09.
//

import SwiftUI
import RealmSwift

struct SetupDetailView: View {
    let itemColor: Color
    @State private var items: [DeskItem]
    @State private var isAddSetupViewPresented = false
    @State private var showingAlert = false

    init(itemColor: Color) {
        self.itemColor = itemColor

        if let itemIDList = UserDefaults.standard.array(forKey: "setups_\(self.itemColor)") as? [String] {
            let realm = try! Realm()
            let cachedItemList = Array(realm.objects(DeskItem.self))
            var setUpItemList: [DeskItem] = []

            for id in itemIDList {
                for item in cachedItemList {
                    if id == item.id {
                        setUpItemList.append(item)
                    }
                }
            }
            self.items = setUpItemList
        } else {
            self.items = []
        }
    }

    var body: some View {
        ZStack {
            BackgroundView()

            ScrollView {
                // アイテムがない時はこちらを表示する
                if items.isEmpty {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("アイテムを組み合わせて、お気に入りのセットアップを作成しよう！")
                            .foregroundColor(.white)
                        
                        Button(action: { isAddSetupViewPresented = true }) {
                            Text("セットアップを作成")
                                .frame(width: UIScreen.main.bounds.width - 32, height: 44)
                                .foregroundColor(Color.white)
                                .background(.blue)
                        }
                        .cornerRadius(8)
                        .sheet(isPresented: $isAddSetupViewPresented) {
                            SetupSelectItemView(itemColor: itemColor, setupItems: $items)
                        }
                        
                        Spacer()
                    }
                } else {
                    VStack {
                        ForEach(items, id: \.self) { item in
                            SelectItemLabel(itemName: item.title, itemImage: ImageManager.shared.getImage(name: item.id))
                        }
                    }
                }
            }
            .padding(16)
            .toolbar {
                if !items.isEmpty {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            Button(
                                "セットアップを削除",
                                role: .destructive,
                                action: { showingAlert = true }
                            )
                        } label: {
                            Image(systemName: "ellipsis.circle")
                                .roundButton()
                        }
                    }
                }
            }
            .alert("このセットアップを削除しますか？", isPresented: $showingAlert) {
                Button("キャンセル", role: .cancel, action: {})

                Button("削除", role: .destructive) {
                    // キャッシュと現在表示している画面の更新
                    UserDefaults.standard.removeObject(forKey: "setups_\(self.itemColor)")
                    items = []
                    
                    HapticFeedbackManager.shared.play(.impact(.soft))
                }
            }
        }
    }
}

struct SetupDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SetupDetailView(itemColor: .orange)
    }
}
