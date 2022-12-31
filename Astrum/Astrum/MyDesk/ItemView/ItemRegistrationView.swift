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
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                VStack {
                    TextField("Item Name", text: $itemName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                        .padding(.bottom, 16)

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
                }
            } 
        }
    }
}

struct ItemRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRegistrationView()
    }
}
