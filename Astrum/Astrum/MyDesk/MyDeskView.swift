//
//  MyDeskView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/11/22.
//

import SwiftUI

struct MyDeskView: View {
    @State var deskImage: UIImage? = ImageManager.shared.getImage(name: "deskImage")
    
    var body: some View {
        NavigationStack {
            ZStack{
                BackgroundView()
                
                ScrollView(showsIndicators: true) {
                    VStack {
                        DisplayView(deskImage: $deskImage)
                            .padding(.top, 24)
                        
                        ItemView()
                            .padding(.top, 24)
                        
                        Spacer()
                    }
                }
            }
            .navigationTitle("My Desk")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(
                            "Delete the desk image",
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
