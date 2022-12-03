//
//  DisplayScreenView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/03.
//

import SwiftUI

struct DisplayScreenView: View {
    @State var image: UIImage?
    @State var showingAlert: Bool = false
    
    let itemWidth = UIScreen.main.bounds.width - 32
    
    var body: some View {
        if let image = image {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.black)
                    .frame(width: itemWidth - 10, height: 240)
                Image(uiImage: image)
                    .resizable()
                    .frame(width: itemWidth - 20, height: 230)
                    .cornerRadius(15)
                    .padding(EdgeInsets(
                        top: 10,
                        leading: 10,
                        bottom: 10,
                        trailing: 10
                    ))
            }
        } else {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.grayDark, .black]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .padding(EdgeInsets(
                        top: 10,
                        leading: 10,
                        bottom: 10,
                        trailing: 10
                    ))
                    .frame(width: itemWidth, height: 250)
                VStack {
                    Text("Let's start with setting up your desk.")
                        .foregroundColor(.backLightYellow)
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
                        ImagePicker(image: $image)
                    }
                }
            }
        }
    }
}

struct DisplayScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayScreenView()
    }
}
