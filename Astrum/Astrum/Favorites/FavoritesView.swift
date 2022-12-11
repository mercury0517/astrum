//
//  FavoritesView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/11.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationStack {
            ZStack{
                BackgroundView()
                
                ScrollView(showsIndicators: true) {
                    VStack {
                        HStack {
                            Text("Favorites")
                                .modifier(SectionTitle())
                            
                            Spacer()
                        }
                        .padding(.top, 16)
                        
                        Spacer()
                    }
                }
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
