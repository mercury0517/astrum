//
//  ItemRegistrationView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/10.
//

import SwiftUI

struct ItemRegistrationView: View {
    @State private var itemName = ""
    @State private var itemText = ""
    @Environment(\.dismiss) private var dismiss
    
    init() {
        UITextView.appearance().textContainerInset = UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
        UITextView.appearance().backgroundColor = .clear // TextViewのデフォルト背景色を消したい(iOS15以下はこちら)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                VStack(spacing: 8) {
                    HStack {
                        Text("タイトル*")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    
                    TextField("", text: $itemName)
                        .modifier(SimpleTextField())
                    
                    HStack {
                        Text("メモ")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 16)

                    TextEditor(text: $itemText)
                        .scrollContentBackground(.hidden) // TextViewのデフォルト背景色を消したい(iOS16以降)
                        .background(Color.matteBlack)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 200)
                        .border(Color.gray, width: 1)
                        .padding(.bottom, 16)
                    
                    HStack {
                        Text("URL")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    
                    TextField("", text: $itemName)
                        .modifier(SimpleTextField())

                    Button("アイテムを追加する") {
                        dismiss()
                    }
                    .frame(width: UIScreen.main.bounds.width - 32, height: 44)
                    .foregroundColor(.white)
                    .background(.blue)
                    
                    Spacer()
                }
                .padding(.top, 16)
            } 
        }
    }
}

struct ItemRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRegistrationView()
    }
}
