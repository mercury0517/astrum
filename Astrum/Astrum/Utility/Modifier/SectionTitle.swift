//
//  SectionTitle.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/07.
//

import SwiftUI

struct SectionTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
            .padding(.leading, 16)
            .fontWeight(.bold)
    }
}
