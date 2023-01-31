//
//  DisplayScreenView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/03.
//

import PhotosUI
import SwiftUI

struct DisplayScreenView: View {
    @Binding var deskImage: UIImage?
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State var showingAlert: Bool = false
    
    let itemWidth = UIScreen.main.bounds.width - 32
    
    var body: some View {
        // フォトライブラリから画像を選択したか、既にキャッシュに画像が保存されている場合
        if let unwrappedSelectedImage = deskImage {
            ZStack {
                Rectangle()
                    .foregroundColor(.black)
                    .frame(width: itemWidth - 10, height: 240)

                Image(uiImage: unwrappedSelectedImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: itemWidth - 20, height: 230)
                    .cornerRadius(0) // scaledToFillが効かなくなるのを回避する為
                    .padding(10)
            }
        } else {
            // 画像がまだ選択されておらず、キャッシュにもない状態
            ZStack {
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.matteBlack, .black]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .padding(5)
                    .frame(width: itemWidth, height: 250)
                
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.yellow, .orange]),
                            startPoint: .topLeading,
                            endPoint: .bottom
                        )
                    )
                    .padding(5)
                    .frame(width: itemWidth - 10, height: 240)
                
                VStack {
                    Text("デスクの写真を追加してみよう")
                        .foregroundColor(.matteBlack)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                    
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()
                    ) {
                        Text("ライブラリから追加")
                            .padding(EdgeInsets(
                                top: 5,
                                leading: 8,
                                bottom: 5,
                                trailing: 8
                            ))
                            .accentColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(16)
                    }
                    .onChange(of: selectedItem) { newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                // フォトライブラリから取得した画像をセット
                                selectedImageData = data
                                if let unwrappedSelectedImageData = selectedImageData {
                                    deskImage = UIImage(data: unwrappedSelectedImageData)

                                    if let unwrappedDeskImage = deskImage {
                                        // キャッシュにも保存してフィードバックを送信
                                        ImageManager.shared.writeImage(name: "deskImage", uiImage: unwrappedDeskImage)
                                        HapticFeedbackManager.shared.play(.impact(.soft))
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct DisplayScreenView_Previews: PreviewProvider {
    @State static var deskImage: UIImage? = nil
    
    static var previews: some View {
        DisplayScreenView(deskImage: $deskImage)
    }
}
