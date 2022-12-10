//
//  ItemView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/04.
//

import SwiftUI

struct ItemView: View {
    @State private var isNextPresented = false

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("My Items")
                    .modifier(SectionTitle())
                
                Spacer()
                
                Button(action: {
                    isNextPresented.toggle()
                }) {
                    Image(systemName: "plus")
                        .roundButton()
                }
                .sheet(isPresented: $isNextPresented) {
                    ItemRegistrationView()
                }
                .padding(.trailing, 16)
            }
            .padding(.bottom, 16)

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
                NavigationLink {
                    ItemDetailView()
                } label: {
                    ItemLabel()
                }
            }
            .padding(.bottom, 48)
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
