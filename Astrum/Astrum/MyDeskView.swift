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
                        Spacer()
                        Button(action: { resetDeskImage() }) {
                            Image(systemName: "ellipsis.circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                        }
                            .padding(5)
                            .accentColor(Color.white)
                            .background(Color.clear)
                            .cornerRadius(25)
                    }
                    DisplayView(deskImage: $deskImage)
                        .padding(.top, 16)
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
    }
}

struct MyDeskView_Previews: PreviewProvider {
    static var previews: some View {
        MyDeskView()
    }
}
