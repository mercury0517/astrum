//
//  MyDeskView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/11/22.
//

import SwiftUI

struct MyDeskView: View {
    @State var deskImage: UIImage?
    
    init() {
        deskImage = getDeskImageFromCache()
    }
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [.matteBlack, .black]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView(showsIndicators: true) {
                VStack {
                    HStack {
                        Text("My Desk")
                            .modifier(SectionTitle())
                        Spacer()
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
                            .padding(.trailing, 16)
                    }
                        .padding(.top, 16)
                    DisplayView(deskImage: $deskImage)
                    ItemsView()
                        .padding(.top, 24)
                    Spacer()
                }
            }
        }
    }
    
    private func getDeskImageFromCache() -> UIImage? {
        var image: UIImage?
        if let imageData = UserDefaults.standard.data(forKey: "deskImage") {
            image = UIImage(data: imageData)
        }
        return image
    }
    
    private func resetDeskImage() {
        UserDefaults.standard.removeObject(forKey: "deskImage")
        deskImage = nil
        HapticFeedbackManager.shared.play(.notification(.success))
    }
}

struct MyDeskView_Previews: PreviewProvider {
    static var previews: some View {
        MyDeskView()
    }
}
