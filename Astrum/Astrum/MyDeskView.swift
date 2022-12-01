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
            Color.konkikyou.edgesIgnoringSafeArea(.all)

            ScrollView(showsIndicators: false) {
                VStack {
                    ZStack {
                        GlassCardView()
                        HStack {
                            Text("デスクの写真を追加")
                                .foregroundColor(.white)
                            Button(action: {
                                print("tap buton")
                            }) {
                                Image(systemName: "plus")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                            }
                            .padding(8)
                            .accentColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(16)
                        }
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
