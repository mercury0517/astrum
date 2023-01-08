//
//  WishListView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/01.
//

import SwiftUI

struct WishListView: View {
    @State private var isNextPresented = false
    @State private var sampleItemList = [DeskItemFixture.sampleItem()] // 後で消す
    private var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 16, alignment: .center), count: 4)

    @State private var emptyItem: DeskItem = DeskItemFixture.emptyItem()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Wish List")
                    .modifier(SectionTitle())
                
                Spacer()
                
                Button(action: {
                    isNextPresented.toggle()
                }) {
                    Image(systemName: "plus.circle")
                        .roundButton()
                }
                .sheet(isPresented: $isNextPresented) {
                    ItemRegistrationView(items: $sampleItemList, item: $emptyItem)
                }
                .padding(.trailing, 16)
            }

            LazyVGrid(columns: columns, spacing: 16) {
                ForEach((1...8), id: \.self) { _ in
                    ItemCellView(item: DeskItemFixture.sampleItem(), items: $sampleItemList)
                }
            }
            .padding(16)
        }
        .padding(.bottom, 16)
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView()
    }
}
