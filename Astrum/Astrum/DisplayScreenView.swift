//
//  DisplayScreenView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/03.
//

import SwiftUI

struct DisplayScreenView: View {
    let itemWidth = UIScreen.main.bounds.width - 32
    
    var body: some View {
        ZStack {
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
                    bottom: 20,
                    trailing: 10
                ))
                .frame(width: itemWidth, height: 250)
            VStack {
                Text("Let's start with setting up your desk.")
                    .foregroundColor(.backLightYellow)
                    .font(.title)
                Button(action: {
                    print("tap buton")
                }) {
                    Text("Add your desk")
                }
                .padding(EdgeInsets(
                    top: 5,
                    leading: 8,
                    bottom: 5,
                    trailing: 8
                ))
                .accentColor(Color.white)
                .background(Color.blue)
                .cornerRadius(16)
            }
        }
    }
}

struct DisplayScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayScreenView()
    }
}
