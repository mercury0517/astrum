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
            .frame(width: 25, height: 25)
            .accentColor(Color.blue)
            .background(Color.clear)
    }
}
