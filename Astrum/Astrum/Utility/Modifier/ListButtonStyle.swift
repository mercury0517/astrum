//
//  ListButtonStyle.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/02/19.
//

import SwiftUI

struct ListButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowBackground(Color.matteBlack)
            .foregroundColor(.white)
    }
}
