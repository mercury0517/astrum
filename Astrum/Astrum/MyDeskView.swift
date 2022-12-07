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
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
                .ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        Text("My Desk")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.leading, 16)
                            .fontWeight(.bold)
                        Spacer()
                        Menu {
                            Button(
                                "Delete the desk image",
                                role: .destructive,
                                action: { resetDeskImage() }
                            )
                        } label: {
                            Image(systemName: "ellipsis")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(5)
                                .accentColor(Color.white)
                                .background(Color.blue)
                                .cornerRadius(20)
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
