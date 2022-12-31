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
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                VStack {
                    HStack {
                        Text("タイトル")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    
                    TextField("", text: $itemName)
                        .padding(8)
                        .frame(height: 50)
                        .border(width: 1, edges: [.top, .leading, .bottom, .trailing], color: .gray)
                        .foregroundColor(.white)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                        .padding(.bottom, 16)
                    
                    HStack {
                        Text("メモ")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 16)

                    TextEditor(text: $itemText)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 200)
                        .border(Color.gray, width: 1)

                    Text("Register New Item \(itemName)")
                        .foregroundColor(.white)

                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "x.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    
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
