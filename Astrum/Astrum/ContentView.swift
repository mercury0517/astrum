//
//  ContentView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/10/22.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = .white
        UITabBar.appearance().backgroundColor = .black
    }
    
    var body: some View {
        TabView {
            MyDeskView()
                .tabItem {
                    VStack {
                        Image(systemName: "chair")
                        Text("TabA")
                    }
            }.tag(1)
            MyDeskView()
                .tabItem {
                    VStack {
                        Image(systemName: "bold")
                        Text("TabB")
                    }
            }.tag(2)
            MyDeskView()
                .tabItem {
                    VStack {
                        Image(systemName: "bold")
                        Text("TabC")
                    }
            }.tag(3)
            MyDeskView()
                .tabItem {
                    VStack {
                        Image(systemName: "bold")
                        Text("TabD")
                    }
            }.tag(4)
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
