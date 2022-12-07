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
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}
