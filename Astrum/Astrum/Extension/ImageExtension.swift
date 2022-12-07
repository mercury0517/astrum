//
//  ImageExtension.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/07.
//

import SwiftUI

extension Image {
    func roundButton() -> some View {
        self.resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .padding(5)
            .accentColor(Color.white)
            .background(Color.blue)
            .cornerRadius(20)
    }
}
