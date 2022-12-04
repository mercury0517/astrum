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
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.black)
                    .frame(width: itemWidth - 10, height: 240)
                Image(uiImage: unwrappedImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: itemWidth - 20, height: 230)
                    .cornerRadius(15)
                    .padding(10)
            }
        } else {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.gray, .black]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .padding(5)
                    .frame(width: itemWidth, height: 250)
                VStack {
                    Text("Let's start with setting up your desk.")
                        .foregroundColor(.green)
                        .font(.title)
                    Button(action: {
                        showingAlert = true
                    }) {
                        Text("Add your desk")
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
    @State static var deskImage: UIImage? = UIImage()
    
    static var previews: some View {
        DisplayScreenView(deskImage: $deskImage)
    }
}
