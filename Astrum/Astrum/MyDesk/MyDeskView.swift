//
//  MyDeskView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/11/22.
//

import SwiftUI

struct MyDeskView: View {
    @State var deskImage: UIImage? = ImageManager.shared.getImage(name: "deskImage")
    
    init(deskImage: UIImage? = nil) {
        self.deskImage = deskImage
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        
        navigationBarAppearance.backgroundColor = UIColor(40, 40, 43)
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    var body: some View {
        NavigationStack {
            ZStack{
                BackgroundView()
                
                ScrollView(showsIndicators: true) {
                    VStack {
                        ZStack {
                            LinearGradient(
                                gradient: Gradient(colors: [.orange, .red, .purple, .blue]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            .frame(width: UIScreen.main.bounds.width, height: 350)
                            
                            DisplayView(deskImage: $deskImage)
                                .padding(.top, 16)
                        }
                        
                        
                        ItemView()
                            .padding(.top, 24)
                        
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
                            "デスクの画像を削除",
                            role: .destructive,
                            action: { resetDeskImage() }
                        )
                    } label: {
                        Image(systemName: "ellipsis")
                            .roundButton()
                    }
                }
            }
        }
    }
    
    private func resetDeskImage() {
        ImageManager.shared.deleteImage(name: "deskImage")
        deskImage = nil
        HapticFeedbackManager.shared.play(.notification(.success))
    }
}

struct MyDeskView_Previews: PreviewProvider {
    static var previews: some View {
        MyDeskView()
    }
}
