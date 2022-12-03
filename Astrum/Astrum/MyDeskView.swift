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
            LinearGradient(gradient: Gradient(colors: [.matteBlack, .black]), startPoint: .leading, endPoint: .trailing)
                        .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack {
                    ZStack {
                        PremiumCardView()
                        RoundedRectangle(cornerRadius: 15)
                            .padding(EdgeInsets(
                                top: 10,
                                leading: 25,
                                bottom: 20,
                                trailing: 25
                            ))
                    }
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
