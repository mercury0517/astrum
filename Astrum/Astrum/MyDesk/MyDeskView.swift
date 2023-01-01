//
//  MyDeskView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/11/22.
//

import SwiftUI

struct MyDeskView: View {
    @State var deskImage: UIImage? = ImageManager.shared.getImage(name: "deskImage")
    @State private var showingAlert = false
    
    init(deskImage: UIImage? = nil) {
        self.deskImage = deskImage
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        
        navigationBarAppearance.backgroundColor = UIColor(40, 40, 43) // matteBlack
        navigationBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "ZenAntique-Regular", size: 24) ?? .systemFont(ofSize: 24)
        ]
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    var body: some View {
        NavigationStack {
            ZStack{
                BackgroundView()
                
                ScrollView(showsIndicators: true) {
                    VStack(spacing: 0) {
                        // モニターのエリア
                        ZStack {
                            LinearGradient(
                                gradient: Gradient(colors: [.orange, .red, .purple, .blue]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            .frame(width: UIScreen.main.bounds.width, height: 333)
                            
                            DisplayView(deskImage: $deskImage)
                        }

                        SetupView()
                            .padding(.top, 24)
                        
                        ItemView()
                        
                        Spacer()
                    }
                }
            }
            .navigationTitle("Astrum")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(
                            "設定",
                            role: .none,
                            action: {}
                        )

                        // ディスプレイに写真が設定されている時は、メニューから写真を削除できる様にする
                        if deskImage != nil {
                            Button(
                                "デスクの写真を削除",
                                role: .destructive,
                                action: { showingAlert = true }
                            )
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .roundButton()
                    }
                }
            }
            .alert("ディスプレイに表示されているデスクの写真を削除しますか？", isPresented: $showingAlert) {
                Button("キャンセル", role: .cancel, action: {})
                
                Button("削除", role: .destructive) {
                    resetDeskImage()
                }
            }
        }
    }
    
    private func resetDeskImage() {
        ImageManager.shared.deleteImage(name: "deskImage")
        deskImage = nil
        HapticFeedbackManager.shared.play(.impact(.soft))
    }
}

struct MyDeskView_Previews: PreviewProvider {
    static var previews: some View {
        MyDeskView()
    }
}
