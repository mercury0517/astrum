//
//  SetupView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/01.
//

import SwiftUI

struct SetupView: View {
    @State private var isNextPresented = false
    private var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 16, alignment: .center), count: 4)

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Setup")
                    .modifier(SectionTitle())
                
                Spacer()

                Button(action: {
                    isNextPresented.toggle()
                }) {
                    Image(systemName: "questionmark.circle")
                        .roundButton()
                }
                .sheet(isPresented: $isNextPresented) {
                    ItemRegistrationView()
                }
                .padding(.trailing, 16)
            }

            LazyVGrid(columns: columns, spacing: 16) {
                SetupCellView(itemColor: .orange)
                SetupCellView(itemColor: .red)
                SetupCellView(itemColor: .purple)
                SetupCellView(itemColor: .blue)
            }
            .padding(16)
        }
        .padding(.bottom, 16)
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        SetupView()
    }
}
