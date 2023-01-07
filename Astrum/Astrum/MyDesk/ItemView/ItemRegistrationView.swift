//
//  ItemRegistrationView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/10.
//

import PhotosUI
import RealmSwift
import SwiftUI

struct ItemRegistrationView: View {
    @Binding private var items: [DeskItem]
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State private var itemName = ""
    @State private var itemMemo = ""
    @State private var itemURL = ""
    @Environment(\.dismiss) private var dismiss
    
    enum FocusField: String {
        case name, memo, url
    }
    @FocusState private var focusField: FocusField?

    init(items: Binding<[DeskItem]>) {
        self._items = items

        UITextView.appearance().textContainerInset = UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                ScrollView {
                    VStack(spacing: 8) {
                        PhotosPicker(
                            selection: $selectedItem,
                            matching: .images,
                            photoLibrary: .shared()
                        ) {
                            if
                                let selectedImageData,
                                let uiImage = UIImage(data: selectedImageData)
                            {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.matteBlack)
                                        .frame(width: UIScreen.main.bounds.width, height: 250)
                                    
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width, height: 250)
                                        .clipped()
                                }
                            } else {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.matteBlack)
                                        .frame(width: UIScreen.main.bounds.width, height: 250)
                                    
                                    Image(systemName: "photo")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.gray)
                                        .frame(width: 30)
                                    
                                }
                            }
                        }
                        .onChange(of: selectedItem) { newItem in
                            Task {
                                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                    selectedImageData = data
                                }
                            }
                        }
                        
                        HStack {
                            Text("タイトル*")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                        .padding(.top, 16)
                        
                        TextField("", text: $itemName)
                            .modifier(SimpleTextField())
                            .focused($focusField, equals: .name)
                        
                        HStack {
                            Text("メモ")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                        
                        TextEditor(text: $itemMemo)
                            .scrollContentBackground(.hidden) // TextViewのデフォルト背景色を消したい(iOS16以降)
                            .background(Color.matteBlack)
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 200)
                            .padding(.bottom, 16)
                            .focused($focusField, equals: .memo)
                        
                        HStack {
                            Text("URL")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                        
                        TextField("", text: $itemURL)
                            .modifier(SimpleTextField())
                            .focused($focusField, equals: .url)

                        Button(action: {
                            addNewItemToRealm()
                            dismiss()
                        }) {
                          Text("アイテムを追加")
                            .frame(width: UIScreen.main.bounds.width - 32, height: 44)
                            .foregroundColor(Color.white)
                            .background(itemName.isEmpty ? .gray : .blue)
                        }
                        .padding(.bottom, 144)
                        .disabled(itemName.isEmpty)
                    }
                }
                .toolbar() {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("完了") {
                            focusField = nil // キーボードからフォーカスを外す
                        }
                    }
                }
            } 
        }
    }
    
    private func addNewItemToRealm() {
        let newItemID = UUID().uuidString
        
        // 選択された画像をファイルに保存し、保存時のキーをDeskItemオブジェクトで管理
        if
            let selectedImageData,
            let newImage = UIImage(data: selectedImageData)
        {
            ImageManager.shared.writeImage(name: newItemID, uiImage: newImage)
        }

        // 入力された情報で新規アイテムオブジェクトを作成
        let newItem = DeskItem()
        newItem.id = newItemID
        newItem.title = itemName
        newItem.memo = itemMemo
        newItem.url = itemURL
        newItem.isWishList = false // 所持しているアイテムとして追加
        
        // 新規アイテムを保存
        let realm = try! Realm()
        
        try! realm.write {
          realm.add(newItem)
        }
        
        // 最新のアイテムを取得し、ホーム画面にも反映させる
        let cachedItemList = realm.objects(DeskItem.self)
        items = Array(cachedItemList.filter("isWishList == false")) // 所持しているアイテムのみを抽出
    }
}

struct ItemRegistrationView_Previews: PreviewProvider {
    @State private static var sampleItemList = [DeskItemFixture.sampleItem()]
    
    static var previews: some View {
        ItemRegistrationView(items: $sampleItemList)
    }
}
