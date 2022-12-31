//
//  ItemView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/04.
//

import SwiftUI

struct ItemView: View {
    @State private var isNextPresented = false
    private var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 16, alignment: .center), count: 4)

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Items")
                    .modifier(SectionTitle())
                
                Spacer()
                
                Button(action: {
                    isNextPresented.toggle()
                }) {
                    Image(systemName: "plus.circle")
                        .roundButton()
                }
                .sheet(isPresented: $isNextPresented) {
                    ItemRegistrationView()
                }
                .padding(.trailing, 16)
            }

//            LazyVGrid(columns: columns, spacing: 16) {
//                ForEach((1...12), id: \.self) { _ in
//                    ItemCellView()
//                }
//            }
//            .padding(16)
//
//            .padding(.bottom, 16)
            
            VStack(spacing: 0) {
                NavigationLink {
                    ItemDetailView()
                } label: {
                    ItemLabel()
                }
                NavigationLink {
                    ItemDetailView()
                } label: {
                    ItemLabel()
                }
                NavigationLink {
                    ItemDetailView()
                } label: {
                    ItemLabel()
                }
                NavigationLink {
                    ItemDetailView()
                } label: {
                    ItemLabel()
                }
                NavigationLink {
                    ItemDetailView()
                } label: {
                    ItemLabel()
                }
            }
            .padding(.top, 8)
            .padding(.bottom, 32)
        }
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            
            ItemView()
        }
    }
}
