//
//  SettingView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/03.
//

import MessageUI
import StoreKit
import SwiftUI

struct SettingView: View {
    @State private var isShowingMail = false
    @State private var isShowingTermOfUse = false
    @State private var isShowingPrivacyPolicy = false
    @State private var isShowingChangeIcon = false

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
                Button(action: {
                    self.isShowingMail.toggle()
                }) {
                    Text("お問い合わせ・機能のご要望")
                }
                    .disabled(!MFMailComposeViewController.canSendMail())
                    .sheet(isPresented: $isShowingMail, content: {
                        MailView(isShowing: self.$isShowingMail)
                    })
                    .listRowBackground(Color.matteBlack)
                    .foregroundColor(.white)

                Button(action: {
                    self.isShowingChangeIcon = true
                }) {
                    Text("アプリのアイコン変更")
                }
                .sheet(isPresented: $isShowingChangeIcon, content: {
                    AppIconSettingView()
                })
                .listRowBackground(Color.matteBlack)
                .foregroundColor(.white)

                Button(action: {
                    if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                        SKStoreReviewController.requestReview(in: scene)
                    }
                }) {
                    Text("⭐︎をつけてアプリを応援")
                }
                .listRowBackground(Color.matteBlack)
                .foregroundColor(.white)

                Button(action: {
                    self.isShowingTermOfUse.toggle()
                }) {
                    Text("利用規約")
                }
                .sheet(isPresented: $isShowingTermOfUse, content: {
                    WebView(isprivacyPolicy: false)
                })
                    .listRowBackground(Color.matteBlack)
                    .foregroundColor(.white)

                Button(action: {
                    self.isShowingPrivacyPolicy.toggle()
                }) {
                    Text("プライバシーポリシー")
                }
                .sheet(isPresented: $isShowingPrivacyPolicy, content: {
                    WebView(isprivacyPolicy: true)
                })
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
