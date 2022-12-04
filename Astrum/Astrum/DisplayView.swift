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
        VStack {
            ZStack { // ディスプレイのモニター部分
                DisplayFrameView()
                DisplayScreenView(deskImage: $deskImage)
            }
            DisplayStandView() // ディスプレイの土台部分
                .padding(.top, -9)
        }
    }
}

struct MyDisplayView_Previews: PreviewProvider {
    @State static var deskImage: UIImage? = UIImage()
    
    static var previews: some View {
        DisplayView(deskImage: $deskImage)
    }
}
