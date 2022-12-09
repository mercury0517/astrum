//
//  ItemView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/04.
//

import SwiftUI

struct ItemView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Items")
                    .modifier(SectionTitle())
                
                Spacer()
                
                Menu {
                    Button(
                        "Delete the desk image",
                        role: .destructive,
                        action: {}
                    )
                } label: {
                    Image(systemName: "plus")
                        .roundButton()
                }
                .padding(.trailing, 16)
            }
            .padding(.bottom, 16)

            VStack(spacing: 0) {
                ItemLabel()
                ItemLabel()
                ItemLabel()
                ItemLabel()
                ItemLabel()
                ItemLabel()
            }
            .padding(.bottom, 48)
        }
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.matteBlack, .black, .matteBlack]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ItemView()
        }
    }
}
