//
//  SettingView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/03.
//

import SwiftUI

struct SettingView: View {
    init() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        
        navigationBarAppearance.backgroundColor = UIColor(40, 40, 43) // matteBlack
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    var body: some View {
        NavigationStack {
            List {
                Text("外観")
                    .listRowBackground(Color.matteBlack)
                    .foregroundColor(.white)
                Text("問い合わせ")
                    .listRowBackground(Color.matteBlack)
                    .foregroundColor(.white)
                Text("利用規約")
                    .listRowBackground(Color.matteBlack)
                    .foregroundColor(.white)
            }
            .scrollContentBackground(.hidden)
            .background(.black)
            .navigationTitle("設定")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
