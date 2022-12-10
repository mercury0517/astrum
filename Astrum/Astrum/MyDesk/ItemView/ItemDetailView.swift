//
//  ItemDetailView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/04.
//

import SwiftUI

struct ItemDetailView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            
            ScrollView() {
                VStack(spacing: 16) {
                    Image("sampleItem")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 250)
                    
                    HStack {
                        Text("Apple Studio Display")
                            .font(.title)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    
                    Text("27-inch 5K Retina display. 12MP Ultra Wide camera with Center Stage. Studio-quality mics. Six-speaker sound system with Spatial Audio.")
                        .foregroundColor(.white)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                    
                    Spacer()
                }
            }
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView()
    }
}
