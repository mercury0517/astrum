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
                startPoint: .leading,
                endPoint: .trailing
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
                                "Delate your desk image",
                                role: .destructive,
                                action: { resetDeskImage() }
                            )
                            Button("Cancel", action: {})
                        } label: {
                                Image(systemName: "ellipsis.circle")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding(8)
                                    .accentColor(Color.white)
                                    .background(Color.clear)
                                    .cornerRadius(30)
                        }
                        .padding(.trailing, 16)
                    }
                        .padding(.top, 16)
                    DisplayView(deskImage: $deskImage)
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
