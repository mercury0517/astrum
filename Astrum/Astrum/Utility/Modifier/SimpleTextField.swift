//
//  SimpleTextField.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/01.
//

import SwiftUI

struct SimpleTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8)
            .frame(height: 50)
            .background(.white)
            .foregroundColor(.black)
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .padding(.bottom, 16)
    }
}
