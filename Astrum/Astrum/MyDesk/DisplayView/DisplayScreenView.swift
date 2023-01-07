//
//  DisplayScreenView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/03.
//

import SwiftUI

struct DisplayScreenView: View {
    @Binding var deskImage: UIImage?
    @State var showingAlert: Bool = false
    
    let itemWidth = UIScreen.main.bounds.width - 32
    
    var body: some View {
        if let unwrappedImage = deskImage {
            ZStack {
                Rectangle()
                    .foregroundColor(.black)
                    .frame(width: itemWidth - 10, height: 240)

                Image(uiImage: unwrappedImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: itemWidth - 20, height: 230)
                    .cornerRadius(0) // scaledToFillが効かなくなるのを回避する為
                    .padding(10)
            }
        } else {
            ZStack {
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.matteBlack, .black]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .padding(5)
                    .frame(width: itemWidth, height: 250)
                
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.yellow, .orange]),
                            startPoint: .topLeading,
                            endPoint: .bottom
                        )
                    )
                    .padding(5)
                    .frame(width: itemWidth - 10, height: 240)
                
                VStack {
                    Text("デスクの写真を追加してみよう")
                        .foregroundColor(.matteBlack)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                    
                    Button(action: {
                        showingAlert = true
                    }) {
                        Text("ライブラリから追加")
                    }
                    .padding(EdgeInsets(
                        top: 5,
                        leading: 8,
                        bottom: 5,
                        trailing: 8
                    ))
                    .accentColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(16)
                    .sheet(isPresented: $showingAlert) {
                    } content: {
                        ImagePicker(image: $deskImage)
                    }
                }
            }
        }
    }
}

struct DisplayScreenView_Previews: PreviewProvider {
    @State static var deskImage: UIImage? = nil
    
    static var previews: some View {
        DisplayScreenView(deskImage: $deskImage)
    }
}
