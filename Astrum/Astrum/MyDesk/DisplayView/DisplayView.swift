//
//  DisplayView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/03.
//

import SwiftUI

struct DisplayView: View {
    let itemWidth = UIScreen.main.bounds.width - 32
    @Binding var deskImage: UIImage?
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack { // ディスプレイのモニター部分
                DisplayFrameView()
                DisplayScreenView(deskImage: $deskImage)
            }

            DisplayStandView() // ディスプレイの土台部分
        }
    }
}

struct MyDisplayView_Previews: PreviewProvider {
    @State static var deskImage: UIImage? = nil
    
    static var previews: some View {
        DisplayView(deskImage: $deskImage)
    }
}
