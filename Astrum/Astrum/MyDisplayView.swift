//
//  MyDisplayView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/03.
//

import SwiftUI

struct MyDisplayView: View {
    let itemWidth = UIScreen.main.bounds.width - 32
    
    var body: some View {
        VStack {
            ZStack {
                AngularGradient(
                    gradient: Gradient(colors: [.grayDark, .grayLight, .grayDark]),
                    center: .center,
                    angle: .degrees(45)
                )
                    .border(width: 0.5, edges: [.top, .leading], color: .white)
                    .border(width: 0.5, edges: [.trailing, .bottom], color: .grayDark)
                    .frame(width: itemWidth, height: 250)
                    .foregroundColor(.black)
                    .cornerRadius(15)
                RoundedRectangle(cornerRadius: 15)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.grayDark, .black]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .padding(EdgeInsets(
                        top: 10,
                        leading: 10,
                        bottom: 15,
                        trailing: 10
                    ))
                    .frame(width: itemWidth, height: 250)
                Text("Let's start with setting up your desk!")
                    .foregroundColor(.green)
                    .font(.title)
            }
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.grayDark, .grayLight]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 120, height: 50)
                .padding(.top, -18)
        }
    }
}

struct MyDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        MyDisplayView()
    }
}
