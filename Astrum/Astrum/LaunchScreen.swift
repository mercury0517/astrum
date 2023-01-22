//
//  LaunchScreen.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/22.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isLoading = true
        var body: some View {
            if isLoading {
                ZStack {
                    Color.black
                        .ignoresSafeArea() // ステータスバーまで塗り潰すために必要
                    Image("splash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .padding()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            isLoading = false
                        }
                    }
                }
            } else {
                ContentView()
            }
        }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
