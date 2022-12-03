//
//  DisplayView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/03.
//

import SwiftUI

struct DisplayView: View {
    let itemWidth = UIScreen.main.bounds.width - 32
    
    var body: some View {
        VStack {
            ZStack { // ディスプレイのモニター部分
                DisplayFrameView()
                DisplayScreenView()
            }
            DisplayStandView() // ディスプレイの土台部分
                .padding(.top, -9)
        }
    }
}

struct MyDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView()
    }
}
