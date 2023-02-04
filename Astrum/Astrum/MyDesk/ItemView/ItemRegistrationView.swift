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
    @Binding private var item: DeskItem // 編集時のみ、それ以外の場合は空のアイテムがセットされる
    @Binding private var itemImage: UIImage?
    private var isWishList: Bool

    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State private var selectedImage: UIImage? = nil
    @State private var itemName = ""
    @State private var itemMemo = ""
    @State private var itemURL = ""
    @Environment(\.dismiss) private var dismiss
    
    enum FocusField: String {
        case name, memo, url
    }
    @FocusState private var focusField: FocusField?

    init(items: Binding<[DeskItem]>, item: Binding<DeskItem>, itemImage: Binding<UIImage?>, isWishList: Bool) {
        self._items = items
        self._item = item
        self._itemImage = itemImage
        self.isWishList = isWishList

        // 編集時にデフォルトの値を入れたい
        _itemName = State(initialValue: self.item.title)
        _itemMemo = State(initialValue: self.item.memo ?? "")
        _itemURL = State(initialValue: self.item.url ?? "")

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
                                        .frame(width: UIScreen.main.bounds.width, height: 300)
                                    
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width, height: 300)
                                        .clipped()
                                }.onAppear {
                                    selectedImage = uiImage
                                }
                            } else {
                                ZStack {
                                    // フォトライブラリから画像を選択していない初期状態で、デフォルトの画像があった場合は、そちらを上に表示する
                                    if let selectedImage {
                                        Image(uiImage: selectedImage)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: UIScreen.main.bounds.width, height: 300)
                                            .clipped()
                                    } else {
                                        Rectangle()
                                            .foregroundColor(.matteBlack)
                                            .frame(width: UIScreen.main.bounds.width, height: 300)
                                        
                                        Image(systemName: "photo")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(.gray)
                                            .frame(width: 30)
                                    }
                                }.onAppear {
                                    // 編集の場合は、元々あった画像を取得する
                                    if let cachedImage = ImageManager.shared.getImage(name: item.id) {
                                        selectedImage = cachedImage
                                    }
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
                            .scrollContentBackground(.hidden)
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

                        // MARK: FIX ME: idが存在しない場合は新規追加。作りがあまり良くないので、後で直す
                        if item.id.isEmpty {
                            Button(action: {
                                addNewItemToRealm()
                                dismiss()
                            }) {
                                Text("アイテムを追加")
                                    .frame(width: UIScreen.main.bounds.width - 32, height: 44)
                                    .foregroundColor(Color.white)
                                    .background(itemName.isEmpty ? .gray : .blue)
                            }
                            .cornerRadius(8)
                            .padding(.bottom, 144)
                            .disabled(itemName.isEmpty)
                        } else {
                            Button(action: {
                                updateItemToRealm()
                                dismiss()
                            }) {
                                Text("アイテムを更新")
                                    .frame(width: UIScreen.main.bounds.width - 32, height: 44)
                                    .foregroundColor(Color.white)
                                    .background(itemName.isEmpty ? .gray : .blue)
                            }
                            .cornerRadius(8)
                            .padding(.bottom, 144)
                            .disabled(itemName.isEmpty)
                        }
                    }
                }
                .scrollDismissesKeyboard(.immediately)
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
    
    private func addNewItemToRealm() {
        let newItemID = UUID().uuidString
        
        // 選択された画像をファイルに保存し、保存時のキーをDeskItemオブジェクトで管理
        if
            let selectedImageData,
            let newImage = UIImage(data: selectedImageData)
        {
            ImageManager.shared.writeImage(name: newItemID, uiImage: getCorrectOrientationUIImage(uiImage: newImage))
        }

        // 入力された情報で新規アイテムオブジェクトを作成
        let newItem = DeskItem()
        newItem.id = newItemID
        newItem.title = itemName
        newItem.memo = itemMemo
        newItem.url = itemURL
        newItem.isWishList = isWishList // 遷移元によって処理を分岐させ、表示するリストを分ける

        // 新規アイテムを保存
        let realm = try! Realm()

        try! realm.write {
          realm.add(newItem)
        }

        let latestItemList = realm.objects(DeskItem.self)

        // 最新のアイテムを取得し、ホーム画面にも反映させる
        items = Array(latestItemList.filter("isWishList == \(isWishList)"))

        HapticFeedbackManager.shared.play(.impact(.soft))
    }
    
    // アイテムの更新
    private func updateItemToRealm() {
        let realm = try! Realm()

        // Realmから今回更新したいIDと一致するアイテムを探して更新
        if let targetItem = realm.objects(DeskItem.self).filter("id == '\(item.id)'").first {
            try! realm.write {
                targetItem.title = itemName
                targetItem.memo = itemMemo
                targetItem.url = itemURL

                // アイテムを更新し、詳細画面を更新する
                item.title = itemName
                item.memo = itemMemo
                item.url = itemURL
                
                // 画像の上書き処理。更新されていた場合のみ上書き保存すれば良い
                if
                    let selectedImageData,
                    let newImage = UIImage(data: selectedImageData)
                {
                    ImageManager.shared.writeImage(name: item.id, uiImage: getCorrectOrientationUIImage(uiImage: newImage))
                    itemImage = newImage // 詳細画面の画像も更新する
                }
            }
        }
        // 更新するアイテムが見つからなかった時の処理...

        // 最新のアイテムを取得し、ホーム画面にも反映させる
        let cachedItemList = realm.objects(DeskItem.self)
        items = Array(cachedItemList.filter("isWishList == \(isWishList)")) // 所持しているアイテムのみを抽出

        HapticFeedbackManager.shared.play(.impact(.soft))
    }

    private func getCorrectOrientationUIImage(uiImage: UIImage) -> UIImage {
        var newImage = UIImage()
        switch uiImage.imageOrientation.rawValue {
         case 1:
            guard let orientedCIImage = CIImage(image: uiImage)?.oriented(CGImagePropertyOrientation.down),
                  let cgImage = CIContext().createCGImage(orientedCIImage, from: orientedCIImage.extent) else { print("Image rotation failed."); return uiImage}
            newImage = UIImage(cgImage: cgImage)
        case 3:
            guard let orientedCIImage = CIImage(image: uiImage)?.oriented(CGImagePropertyOrientation.right),
                  let cgImage = CIContext().createCGImage(orientedCIImage, from: orientedCIImage.extent) else { print("Image rotation failed."); return uiImage}
           newImage = UIImage(cgImage: cgImage)
        default:
           newImage = uiImage
        }
        return newImage
    }
}

struct ItemRegistrationView_Previews: PreviewProvider {
    @State private static var sampleItemList = [DeskItemFixture.sampleItem()]
    @State private static var sampleItemImage = UIImage(named: "sampleItem")
    @State private static var emptyItem: DeskItem = DeskItemFixture.emptyItem()
    
    static var previews: some View {
        ItemRegistrationView(
            items: $sampleItemList,
            item: $emptyItem,
            itemImage: $sampleItemImage,
            isWishList: false
        )
    }
}
