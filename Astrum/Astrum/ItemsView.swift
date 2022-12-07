//
//  ItemsView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/04.
//

import SwiftUI

struct ItemsView: View {
    var body: some View {
        HStack {
            Text("Items")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.leading, 16)
                .fontWeight(.bold)
            Spacer()
            Menu {
                Button(
                    "Delete the desk image",
                    role: .destructive,
                    action: {}
                )
            } label: {
                Image(systemName: "plus")
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
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}
