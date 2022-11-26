//
//  MyDeskView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/11/22.
//

import SwiftUI

struct MyDeskView: View {
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)

            ScrollView(showsIndicators: false) {
                VStack {
                    PremiumCardView()
                        .padding(.top, 16)
                    GlassCardView()
                        .padding(.top, 16)
                    Spacer()
                }
            }
        }
    }
}

struct MyDeskView_Previews: PreviewProvider {
    static var previews: some View {
        MyDeskView()
    }
}
