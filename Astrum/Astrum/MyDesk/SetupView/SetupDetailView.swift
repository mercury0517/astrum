//
//  SetupDetailView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/09.
//

import SwiftUI

struct SetupDetailView: View {
    @State private var isAddSetupViewPresented = false

    var body: some View {
        ZStack {
            BackgroundView()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("アイテムを組み合わせて、お気に入りのセットアップを作成しよう！")
                        .foregroundColor(.white)

                    Button(action: { isAddSetupViewPresented = true }) {
                        Text("セットアップを作成")
                            .frame(width: UIScreen.main.bounds.width - 32, height: 44)
                            .foregroundColor(Color.white)
                            .background(.blue)
                    }
                    .cornerRadius(8)
                    .sheet(isPresented: $isAddSetupViewPresented) {
                        SetupSelectItemView()
                    }

                    Spacer()
                }
            }
            .padding(16)
        }
    }
}

struct SetupDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SetupDetailView()
    }
}
