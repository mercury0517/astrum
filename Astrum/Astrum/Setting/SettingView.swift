//
//  SettingView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/03.
//

import MessageUI
import SwiftUI

struct SettingView: View {
    @State private var isShowingMailView = false

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

                Button(action: {
                    self.isShowingMailView.toggle()
                }) {
                    Text("お問い合わせ・機能のご要望")
                }
                    .disabled(!MFMailComposeViewController.canSendMail())
                    .sheet(isPresented: $isShowingMailView, content: {
                        MailView(isShowing: self.$isShowingMailView)
                    })
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
